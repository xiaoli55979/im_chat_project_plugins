import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:im_chat_common_plugin/util/constant.dart';
import 'package:im_chat_common_plugin/widget/button/common_button.dart';
import 'package:im_chat_resource_plugin/generated/assets.dart';

class CommonImageView extends StatelessWidget {

  CommonImageView({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
    this.alignment,
    this.needFadeIn = true,
    this.placeholderName = Assets.commonPlaceholder,
    this.onPress,
    this.placeholder,
    this.errorWidget,
  });

  CommonImageView.avatar({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
    this.alignment,
    this.needFadeIn = true,
    this.onPress,
    this.placeholder,
    this.errorWidget,
  }) {
    placeholderName = Assets.commonDefaultAvatar;
  }

  CommonImageView.normal({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.alignment,
    this.needFadeIn = true,
    this.onPress,
    this.placeholder,
    this.errorWidget,
  }) {
    placeholderName = Assets.commonPlaceholder;
  }

  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Alignment? alignment;
  late String placeholderName;
  final PlaceholderWidgetBuilder? placeholder;
  final LoadingErrorWidgetBuilder? errorWidget;

  final bool needFadeIn;

  final void Function(String? imageUrl)? onPress;

  @override
  Widget build(BuildContext context) {
    final placeholder = Image.asset(
      placeholderName,
      width: width,
      height: height,
      fit: BoxFit.cover,
      package: resourcePackageName,
    );
    final isValidUrl = imageUrl != null && imageUrl!.isNotEmpty;
    final Widget content;
    if (isValidUrl) {
      content = CachedNetworkImage(
        fadeInDuration: needFadeIn ? const Duration(milliseconds: 500) : Duration.zero,
        alignment: alignment ?? Alignment.center,
        width: width,
        height: height,
        fit: fit,
        imageUrl: imageUrl!,
        placeholder: this.placeholder ?? (context, url) => placeholder,
        errorWidget: errorWidget ?? (context,url,error)=> placeholder,
      );
    } else {
      content = placeholder;
    }

    if (onPress != null) {
      final button = CommonButton(
        borderRadius: BorderRadius.zero,
        padding: EdgeInsets.zero,
        minSize: 0,
        child: content,
        onPressed: () => onPress!(imageUrl),
      );

      if (isValidUrl) {
        return Hero(
          tag: imageUrl!,
          child: button,
        );
      } else {
        return button;
      }
    } else {
      return content;
    }
  }
}
