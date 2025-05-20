import 'dart:io';

import 'package:async/async.dart';
import 'package:collection/collection.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/api/user_provider.dart';
import 'package:im_chat_common_plugin/tools/dialog_utils.dart';
import 'package:im_chat_common_plugin/tools/font_utils.dart';
import 'package:im_chat_common_plugin/tools/image_compress_utils.dart';
import 'package:im_chat_common_plugin/tools/text_field_utils.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_compress/video_compress.dart';

import 'bottom_sheet_view.dart';
import 'main_button.dart';

typedef PreviewBuilder = Widget Function(
  BuildContext,
  List<Widget> children,
  Widget? addButton,
);

class ImageItem {
  XFile file;
  String? url;
  bool isVideo;

  ImageItem({required this.file, required this.isVideo});

  @override
  String toString() {
    return "url: $url, path: ${file.path}";
  }
}

/// Field for picking image(s) from Gallery or Camera.
///
/// Field value is a list of objects.
///
/// the widget can internally handle displaying objects of type [XFile],[Uint8List],[String] (for an image url),[ImageProvider] (for any flutter image), [Widget] (for any widget)
/// and appends [XFile] to the list for picked images.
///
/// if you want to use a different object (e.g. a class from the backend that has imageId and imageUrl)
/// you need to implement [displayCustomType]
class FormBuilderImagePicker extends FormBuilderFieldDecoration<List<dynamic>> {
  /// set to true to insert an [InputDecorator] which displays labels, borders, etc...
  ///
  /// when [maxImages] == 1, it's better to set this to false
  final bool showDecoration;

  /// set to true to let images decide their own width
  ///
  /// when [maxImages] == 1, it's better to set this to true
  final bool previewAutoSizeWidth;

  /// the width of image previews, also see [previewAutoSizeWidth]
  final double previewWidth;

  /// the height of image previews
  final double previewHeight;

  /// margins between image previews
  final EdgeInsetsGeometry? previewMargin;

  /// May be supplied for a fully custom display of the image preview
  final PreviewBuilder? previewBuilder;

  /// placeholder image displayed when picking a new image
  final ImageProvider? placeholderImage;

  /// placeholder widget displayed when picking a new image
  final Widget? placeholderWidget;

  /// Field icon
  final IconData? icon;

  /// Field icon color
  final Color? iconColor;

  /// Field background color
  final Color? backgroundColor;

  /// Optional maximum height of image; see [ImagePicker].
  final double? maxHeight;

  /// Optional maximum width of image; see [ImagePicker].
  final double? maxWidth;

  /// The imageQuality argument modifies the quality of the image, ranging from
  /// 0-100 where 100 is the original/max quality. If imageQuality is null, the
  /// image with the original quality will be returned. See [ImagePicker].
  final int? imageQuality;

  final bool? clip;

  /// Use preferredCameraDevice to specify the camera to use when the source is
  /// `ImageSource.camera`. The preferredCameraDevice is ignored when source is
  /// `ImageSource.gallery`. It is also ignored if the chosen camera is not
  /// supported on the device. Defaults to `CameraDevice.rear`. See [ImagePicker].
  final CameraDevice preferredCameraDevice;

  /// use this to get an image from a custom object to either [Uint8List] or [XFile] or [String] (url) or [ImageProvider]
  ///
  /// ```dart
  /// (obj) => obj is MyApiFileClass ? obj.imageUrl : obj;
  /// ```
  final dynamic Function(dynamic obj)? displayCustomType;

  // final void Function(Image)? onImage;

  /// maximum images to pick
  ///
  /// also see [showDecoration],[previewAutoSizeWidth]
  final int? maxImages;

  final Widget Function(BuildContext context, Widget displayImage)? transformImageWidget;

  /// fit for each image
  final BoxFit fit;

  /// The sources available to pick from.
  /// Either [ImageSourceOption.gallery], [ImageSourceOption.camera] or both.
  final List<ImageSourceOption> availableImageSources;

  final WidgetBuilder? loadingWidget;

  /// 文件路径类型
  final ImageCategory? imageCategory;
  final bool pickVideo;
  final Duration maxDuration;
  XFile? _pickedFile;
  CroppedFile? _croppedFile;
  final Widget cameraLabel;
  final Widget galleryLabel;
  final void Function(ImageItem)? onUploadSuccess;
  final void Function(bool)? onUploadStatus; // true 上传成功了  flse上传失败了
  final void Function()? onTapload;

  FormBuilderImagePicker({
    super.key,
    required super.name,
    super.validator,
    super.initialValue,
    super.decoration = const InputDecoration(),
    super.onChanged,
    super.valueTransformer,
    super.enabled = true,
    super.onSaved,
    super.autovalidateMode = AutovalidateMode.disabled,
    super.onReset,
    super.focusNode,
    this.loadingWidget,
    this.onTapload,
    this.transformImageWidget,
    this.imageCategory,
    this.showDecoration = true,
    this.placeholderWidget,
    this.previewAutoSizeWidth = true,
    this.previewBuilder,
    this.fit = BoxFit.cover,
    this.displayCustomType,
    this.previewWidth = 130,
    this.previewHeight = 130,
    this.previewMargin,
    this.icon,
    this.iconColor,
    this.backgroundColor,
    this.maxHeight,
    this.maxWidth,
    this.imageQuality,
    this.clip,
    this.pickVideo = false,
    this.maxDuration = const Duration(minutes: 5),
    this.preferredCameraDevice = CameraDevice.rear,
    this.cameraLabel = const Text('拍照'),
    this.galleryLabel = const Text('相册'),
    this.maxImages,
    this.placeholderImage,
    this.onUploadSuccess,
    this.onUploadStatus,
    this.availableImageSources = const [
      ImageSourceOption.camera,
      ImageSourceOption.gallery,
    ],
  })  : assert(maxImages == null || maxImages >= 0),
        super(
          builder: (FormFieldState<List<dynamic>?> field) {
            final state = field as FormBuilderImagePickerState;
            final theme = Theme.of(state.context);
            final disabledColor = theme.disabledColor;
            final primaryColor = theme.primaryColor;
            final value = state.effectiveValue;
            final canUpload = state.enabled && !state.hasMaxImages;

            /// how many items to display in the list view (including upload btn)
            final itemCount = value.length + (canUpload ? 1 : 0);

            Widget addButtonBuilder(BuildContext context) {
              if (onTapload != null) {
                onTapload();
              }
              return GestureDetector(
                key: UniqueKey(),
                child: placeholderWidget ??
                    SizedBox(
                      width: previewWidth,
                      child: placeholderImage != null
                          ? Image(
                              image: placeholderImage,
                            )
                          : DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(8),
                              color: (state.enabled ? backgroundColor ?? primaryColor : disabledColor),
                              child: Center(
                                child: Icon(
                                  icon ?? Icons.add,
                                  size: 38,
                                  color: state.enabled ? iconColor ?? primaryColor : disabledColor,
                                ),
                              ),
                            ),
                    ),
                onTap: () async {
                  state.onTapAdd(context);
                },
              );
            }

            Widget itemBuilder(
              BuildContext context,
              dynamic item,
              int index,
            ) {
              bool checkIfItemIsCustomType(dynamic e) =>
                  !(e is XFile || e is String || e is Uint8List || e is ImageItem || e is ImageProvider || e is Widget);

              final itemCustomType = checkIfItemIsCustomType(item);
              var displayItem = item;
              if (itemCustomType && displayCustomType != null) {
                displayItem = displayCustomType(item);
              }
              assert(
                !checkIfItemIsCustomType(displayItem),
                'Display item must be of type [Uint8List], [XFile], [String] (url), [ImageProvider] or [Widget]. '
                'Consider using displayCustomType to handle the type: ${displayItem.runtimeType}',
              );

              final displayWidget = displayItem is Widget
                  ? displayItem
                  : displayItem is ImageProvider
                      ? Image(image: displayItem, fit: fit)
                      : displayItem is Uint8List
                          ? Image.memory(displayItem, fit: fit)
                          : displayItem is String
                              ? Image.network(
                                  displayItem,
                                  fit: fit,
                                )
                              : XFileImage(
                                  item: displayItem,
                                  fit: fit,
                                  imageCategory: imageCategory,
                                  onUploadSuccess: onUploadSuccess,
                                  onUploadStatus: onUploadStatus,
                                  loadingWidget: loadingWidget,
                                );
              return Stack(
                key: ObjectKey(item),
                children: <Widget>[
                  transformImageWidget?.call(context, displayWidget) ?? displayWidget,
                  if (state.enabled)
                    PositionedDirectional(
                      top: 0,
                      end: 0,
                      child: InkWell(
                        onTap: () {
                          state.focus();
                          field.didChange(
                            value.toList()..removeAt(index),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.7),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          height: 22,
                          width: 22,
                          child: const Icon(
                            Icons.close,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            }

            if (previewBuilder != null) {
              return Builder(builder: (context) {
                final widgets = value.mapIndexed((i, v) => itemBuilder(context, v, i)).toList();

                return previewBuilder(
                  context,
                  widgets,
                  canUpload ? addButtonBuilder(context) : null,
                );
              });
            }

            final child = SizedBox(
              height: previewHeight,
              child: itemCount == 0
                  ? null //empty list
                  : itemCount == 1 //has a single item,
                      ? canUpload
                          ? addButtonBuilder(state.context) //upload button
                          : SizedBox(
                              width: previewAutoSizeWidth ? null : previewWidth,
                              child: itemBuilder(state.context, value.first, 0),
                            )
                      : ListView.builder(
                          itemExtent: previewAutoSizeWidth ? null : previewWidth,
                          scrollDirection: Axis.horizontal,
                          itemCount: itemCount,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: previewMargin,
                              child: Builder(
                                builder: (context) {
                                  if (index < value.length) {
                                    final item = value[index];
                                    return itemBuilder(context, item, index);
                                  }
                                  return addButtonBuilder(context);
                                },
                              ),
                            );
                          },
                        ),
            );
            return showDecoration
                ? InputDecorator(
                    decoration: state.decoration,
                    child: child,
                  )
                : child;
          },
        );

  @override
  FormBuilderImagePickerState createState() => FormBuilderImagePickerState();
}

class FormBuilderImagePickerState extends FormBuilderFieldDecorationState<FormBuilderImagePicker, List<dynamic>> {
  bool _isPickingImage = false;

  // List<dynamic> get effectiveValue => value?.where((element) => element != null).toList() ?? [];
  List<dynamic> get effectiveValue {
    if (value == null) return [];
    return value?.where((element) => element != null).toList() ?? [];
  }

  bool get hasMaxImages {
    final ev = effectiveValue;
    return widget.maxImages != null && ev.length >= widget.maxImages!;
  }

  /// 由外部调用
  void triggerPickImage({int? maxImages}) {
    onTapAdd(context, maxInages: maxImages);
  }

  void onTapAdd(BuildContext context, {int? maxInages}) {
    final value = effectiveValue;
    int? maxSelImages = maxInages ?? widget.maxImages;
    final remainingImages = maxSelImages == null ? null : maxSelImages - value.length;
    List<MainButton> actions = [];
    if (widget.availableImageSources.contains(ImageSourceOption.camera)) {
      actions.add(
        MainButton(
            text: "相机",
            onPressed: () {
              Navigator.pop(context);
              // PermissionsUtils.requestCameraPermission((status) {
              //   if (status) {
              //     onPickImage(ImageSource.camera, remainingImages);
              //   } else {
              //     DialogUtils.showError("相机未授权");
              //   }
              // });
            }),
      );
    }
    if (widget.availableImageSources.contains(ImageSourceOption.gallery)) {
      actions.add(
        MainButton(
            text: "相册",
            onPressed: () {
              // DialogUtils.dismiss();
              Navigator.pop(context);
              // 获取相机相册权限
              // PermissionsUtils.requestAlbumPermission((status) {
              //   if (status) {
              //     onPickImage(ImageSource.gallery, remainingImages);
              //   } else {
              //     DialogUtils.showError("相册未授权");
              //   }
              // });
            }),
      );
    }
    // DialogUtils.showActionSheet(actions: actions);
    DialogUtils.bottomSheet(
        isDismissible: true,
        builder: (c) => BottomSheetView(
              actions: actions,
              onCancel: () {},
            ));
  }

  Future<void> _onImageSelected(Iterable<XFile> images) async {
    await Future.delayed(const Duration(milliseconds: 500));
    String itemContent = '';
    String itemType = '';
    try {
      /// 如果打开拆检
      if (images.length == 1 && widget.clip != null && widget.clip!) {
        await _cropImage(images.first, (XFile? croppedFile) {
          if (croppedFile != null) {
            setState(() {
              List<ImageItem> items = [
                ImageItem(
                  file: croppedFile,
                  isVideo: widget.pickVideo,
                )
              ];
              itemType = "${items.runtimeType}";
              itemContent = items.toString();

              didChange([...effectiveValue, ...items]);
            });
          }
        });
      } else {
        // CroppedFile
        List<ImageItem> items = images
            .map(
              (f) => ImageItem(
                file: f,
                isVideo: widget.pickVideo,
              ),
            )
            .toList();
        itemType = "${items.runtimeType}";
        itemContent = items.toString();
        // print('Cropped_items_type: $itemType');
        // print('Cropped_items_content: $itemContent');
        didChange([...effectiveValue, ...items]);
      }
    } catch (e, stackTrace) {
      // LoggerUtils.error(e, scopeCallback: (Scope scope) {
      //   scope.setTag(LogType.FILETRANSFER.label, "图片传输失败");
      // }, stackTrace: stackTrace);
    }
  }

  /// 图片裁剪视图
  Future<void> _cropImage(XFile file, Function(XFile) onCropped) async {
    ImageCropper().cropImage(
      sourcePath: file.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 60,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: '请将身份证裁剪到指定大小',
          toolbarColor: Colors.white,
          toolbarWidgetColor: Colors.black,
          initAspectRatio: CropAspectRatioPreset.ratio3x2,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: '请将身份证裁剪到指定大小',
        ),
      ],
    ).then((croppedFile) {
      if (croppedFile != null) {
        XFile file = XFile(croppedFile.path);
        onCropped(file);
      }
    });
  }

  Future<void> onPickImage(ImageSource source, int? remainingImages) async {
    if (_isPickingImage) return;
    remainingImages = remainingImages ?? 1;
    _isPickingImage = true;
    final imagePicker = ImagePicker();
    try {
      if (source == ImageSource.camera || remainingImages <= 1) {
        XFile? pickedFile;
        if (widget.pickVideo) {
          pickedFile = await imagePicker.pickVideo(
            source: source,
            preferredCameraDevice: widget.preferredCameraDevice,
            maxDuration: widget.maxDuration,
          );
        } else {
          pickedFile = await imagePicker.pickImage(
            source: source,
            preferredCameraDevice: widget.preferredCameraDevice,
            maxHeight: widget.maxHeight,
            maxWidth: widget.maxWidth,
            imageQuality: widget.imageQuality,
          );
        }
        _isPickingImage = false;
        if (pickedFile != null) {
          _onImageSelected([pickedFile]);
        }
      } else {
        final pickedFiles = await imagePicker.pickMultiImage(
          maxHeight: widget.maxHeight,
          maxWidth: widget.maxWidth,
          imageQuality: widget.imageQuality,
        );
        _isPickingImage = false;
        if (pickedFiles.isNotEmpty) {
          _onImageSelected(pickedFiles);
        }
      }
    } catch (e) {
      _isPickingImage = false;
      rethrow;
    }
  }
}

class XFileImage extends StatefulWidget {
  /// 文件路径类型
  final ImageCategory? imageCategory;
  final ImageItem item;
  final BoxFit? fit;
  final WidgetBuilder? loadingWidget;
  final void Function(ImageItem)? onUploadSuccess;
  final void Function(bool)? onUploadStatus; // true 上传成功了  flse上传失败了
  XFileImage({
    super.key,
    required this.item,
    this.fit,
    this.loadingWidget,
    this.onUploadSuccess,
    this.onUploadStatus,
    this.imageCategory,
  });

  @override
  State<XFileImage> createState() => _XFileImageState();
}

class _XFileImageState extends State<XFileImage> {
  final _memoizer = AsyncMemoizer<Uint8List?>();
  int uploadProcess = 0;
  int compressProcess = 0;
  bool compressComplete = false;
  bool uploadError = false;
  bool uploadFileError = false;
  bool uploadSuccess = false;
  String uploadStatusStr = "";

  var api = Get.find<UserProvider>();
  Subscription? _subscription;

  void _uploadFile(String filePath) {
    if (!mounted) return; // 检查组件是否仍然在树上

    ImageCategory category = ImageCategory.none;
    if (widget.imageCategory != null) {
      category = widget.imageCategory!;
    }
    var objectKey = TextFieldUtils.objectKeyNew(filePath, headPath: category);
    api.uploadFileNew(File(filePath), key: objectKey, onSendProgress: (count, total) {
      if (!mounted) return; // 检查组件是否仍然在树上
      int progress = (count / total * 100).toInt();
      if (progress >= 96) {
        progress = 98;
      }
      setState(() {
        uploadProcess = progress;
      });
    }).then((_) {
      if (!mounted) return;
      setState(() {
        uploadSuccess = true;
        uploadStatusStr = "上传成功";
      });
      // LogUtil.v(url, tag: "文件上传成功");
      widget.item.url = objectKey;
      widget.onUploadSuccess?.call(widget.item);
      widget.onUploadStatus?.call(true);
    }).catchError((e, stackTrace) {
      // LoggerUtils.error(e, stackTrace: stackTrace, scopeCallback: (Scope scope) {
      //   scope.setTag(LogType.FILETRANSFER.label, objectKey);
      // }, type: LogType.FILETRANSFER);
      // if (!mounted) return;
      // setState(() {
      //   uploadError = true;
      //   uploadStatusStr = "上传失败";
      //   widget.onUploadStatus?.call(false);
      // });
    });
  }

  /// 是否显示压缩进度
  bool get showCompress {
    return !compressComplete;
  }

  @override
  void initState() {
    if (widget.item.isVideo) {
      /// 订阅压缩进度监听
      _subscription = VideoCompress.compressProgress$.subscribe((progress) {
        if (!mounted) return;
        setState(() {
          compressProcess = progress.toInt();
        });
      });

      /// 压缩视频
      VideoCompress.compressVideo(
        widget.item.file.path,
        quality: VideoQuality.DefaultQuality,
      ).then((value) async {
        if (value != null && value.path != null) {
          File file = File(value.path!);
          bool fileExists = await file.exists();
          if (!fileExists) {
            if (mounted) {
              setState(() {
                uploadStatusStr = "视频文件异常";
                compressComplete = true;
                uploadFileError = true;
              });
            }
            String errmsg = "Pick_文件上传失败:Start:${value.path!},选择的本地视频文件不存在";
            if (kDebugMode) {
              print(errmsg);
            }
            // ApputilHandle.onUpdateBugly(errmsg);
            return;
          }
          if (!mounted) return;
          setState(() {
            compressComplete = true;
          });
          _uploadFile(value.path!);
        } else {
          DialogUtils.showError("视频压缩失败");
        }
      });
    } else {
      /// 图片压缩
      var filePath = widget.item.file.path;
      ImageCompressUtil.compress(File(filePath), minWidth: 1280, minHeight: 720).then((res) async {
        // filePath = "${widget.item.file.path}a";
        File file = File(filePath);
        bool fileExists = await file.exists();
        if (!fileExists) {
          if (mounted) {
            setState(() {
              uploadStatusStr = "图片文件异常";
              compressComplete = true;
              uploadFileError = true;
            });
          }
          String errmsg = "Pick_文件上传失败:Start:$filePath,选择的本地图片文件不存在";
          if (kDebugMode) {
            print(errmsg);
          }
          // ApputilHandle.onUpdateBugly(errmsg);
          return;
        }
        if (!mounted) return;
        setState(() {
          compressComplete = true;
        });
        if (res != null) {
          _uploadFile(res.path);
        }
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.unsubscribe();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: _memoizer.runOnce(() async {
        if (widget.item.isVideo) {
          return await VideoCompress.getByteThumbnail(widget.item.file.path, quality: 50, position: -1);
        }
        return await widget.item.file.readAsBytes();
      }),
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (data == null) {
          return widget.loadingWidget?.call(context) ??
              Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      "视频加载中",
                      style: TextStyle(
                        fontSize: FontUtils.contentSubFontSize,
                        color: Colors.black,
                      ),
                    ),
                    5.verticalSpace,
                    const CircularProgressIndicator(),
                  ],
                ),
              );
        }
        return Stack(
          children: [
            Image.memory(data, fit: widget.fit),
            PositionedDirectional(
              top: 1,
              start: 1,
              child: Container(
                color: Colors.blue.withOpacity(0.9),
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      showCompress
                          ? "压缩$compressProcess%"
                          : uploadFileError
                              ? uploadStatusStr
                              : uploadError
                                  ? uploadStatusStr
                                  : uploadSuccess
                                      ? '上传成功'
                                      : '上传中$uploadProcess%',
                      style: const TextStyle(fontSize: 10, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Options where a user can pick images from
enum ImageSourceOption {
  /// From the device camera
  /// (via [ImageSource.camera])
  camera,

  /// From the gallery (or local files on the web)
  /// (via [ImageSource.gallery])
  gallery
}
