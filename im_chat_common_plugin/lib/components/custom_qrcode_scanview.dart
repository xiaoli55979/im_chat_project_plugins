import 'package:flutter/material.dart';
import 'package:flutter_scankit/flutter_scankit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomQrcodeScanview extends StatefulWidget {
  const CustomQrcodeScanview({Key? key}) : super(key: key);

  @override
  State<CustomQrcodeScanview> createState() => _CustomViewState();
}

double boxSize = 200.0;
bool isLightOn = false;

class _CustomViewState extends State<CustomQrcodeScanview> {
  final ScanKitController _controller = ScanKitController();

  @override
  void initState() {
    _controller.onResult.listen((result) {
      try {
        Future(() {
          Navigator.of(context).pop(result.originalValue);
        });
      } catch (e) {}
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    boxSize = screenWidth * 3.0 / 5.0;
    var rect = Rect.fromLTWH(0, 0, screenWidth, screenHeight);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        top: false,
        child: Stack(
          children: [
            ScanKitWidget(
              controller: _controller,
              continuouslyScan: false,
              format: 1 << 10,
              boundingBox: rect,
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top, // 顶部安全区
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 56,
                color: Colors.transparent, // 背景透明
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "扫码支付",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    // 图标按钮
                    IconButton(
                      icon: Icon(
                        Icons.photo_library,
                        color: Colors.white,
                        size: 28,
                      ),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () async {
                        _controller.pickPhoto(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 100.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "请扫描支付二维码",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    5.verticalSpace,
                    const Text(
                      "如果无法扫描请前后移动摄像头进行对焦",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: boxSize,
                    height: boxSize,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(color: Colors.white.withOpacity(0.6), width: 2),
                        right: BorderSide(color: Colors.white.withOpacity(0.6), width: 2),
                        top: BorderSide(color: Colors.white.withOpacity(0.6), width: 2),
                        bottom: BorderSide(color: Colors.white.withOpacity(0.6), width: 2),
                      ),
                    ),
                  ),
                  30.verticalSpace,
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isLightOn = !isLightOn;
                      });
                      _controller.switchLight();
                    },
                    icon: Icon(
                      isLightOn ? Icons.flash_on : Icons.flash_off,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
