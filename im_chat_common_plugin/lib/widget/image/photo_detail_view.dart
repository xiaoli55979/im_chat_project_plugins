import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/config/color/colors.dart';
import 'package:im_chat_common_plugin/util/app_values.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:im_chat_common_plugin/widget/button/common_button.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoDetailView extends StatelessWidget {
  final List<String> photos;

  final int initialPage;

  final String? tag;

  Axis scrollDirection;

  final PageController _pageController;

  final RxInt _currentIndex;

  PhotoDetailView({
    super.key,
    this.tag,
    required this.photos,
    this.initialPage = 0,
    this.scrollDirection = Axis.vertical,
  })  : _pageController = PageController(
          initialPage: initialPage,
        ),
        _currentIndex = RxInt(initialPage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff121212),
        body: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: tag == null
              ? _contentView()
              : Hero(
                  tag: tag!,
                  child: _contentView(),
                ),
        ));
  }

  Widget _contentView() {
    return Stack(
      children: [
        PhotoViewGallery.builder(
          itemCount: photos.length,
          builder: (context, index) {
            final photo = photos[index];
            final bool isLocal = Uri.tryParse(photo)?.scheme.isEmpty ?? false;
            return PhotoViewGalleryPageOptions(
              imageProvider: !isLocal
                  ? CachedNetworkImageProvider(photo)
                  : FileImage(File(photo)),
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered * 2,
            );
          },
          scrollPhysics: const BouncingScrollPhysics(),
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
          pageController: _pageController,
          scrollDirection: scrollDirection,
          onPageChanged: (index) => _currentIndex.value = index,
        ),
        Positioned(
          right: 20,
          top: safeAreaEdgeInsets.top,
          child: CommonButton(
            minSize: 0,
            padding: const EdgeInsets.all(5),
            onPressed: () {
              Get.back();
            },
            child:  Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Color(0xff373737).withOpacity(0.3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Icon(Icons.close, color: IMColors.white, size: 24),
              ),
            ),
          ),
        ),
      ],
    );
  }

  static void showImages({
    String? tag,
    required List<String> photos,
    int initialPage = 0,
    Axis scrollDirection = Axis.horizontal,
  }) {
    Get.to(
      transition: Transition.noTransition,
        () => PhotoDetailView(
              tag: tag,
              photos: photos,
              initialPage: initialPage,
              scrollDirection: scrollDirection,
            ));
  }
}
