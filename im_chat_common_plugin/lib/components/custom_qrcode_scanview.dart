import 'package:flutter/material.dart';
import 'package:flutter_scankit/flutter_scankit.dart';
import 'package:get/get.dart';

class CustomQrcodeScanview extends StatefulWidget {
  const CustomQrcodeScanview({Key? key}) : super(key: key);

  @override
  State<CustomQrcodeScanview> createState() => _CustomViewState();
}

class _CustomViewState extends State<CustomQrcodeScanview> {
  final ScanKitController _controller = ScanKitController();
  double boxSize = 200.0; // 扫描框大小
  bool isLightOn = false;

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
    var screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    var screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    // 动态调整扫描框大小
    boxSize = screenWidth * 3.0 / 5.0;

    // 定义扫描框的范围
    Rect boundingBox = Rect.fromCenter(
      center: Offset(screenWidth / 2, screenHeight / 2),
      width: boxSize,
      height: boxSize,
    );

    return Scaffold(
      body: SafeArea(
        bottom: false,
        top: true,
        child: Stack(
          children: [
            // 扫码区域
            ScanKitWidget(
              controller: _controller,
              continuouslyScan: false,
              format: 1 << 10, // 支持的二维码格式
              boundingBox: boundingBox, // 限制扫描区域
            ),

            // // 遮罩层
            ScannerMaskWidget(
              boxSize: boxSize, // 扫码框大小
              scanWidget: ScanKitWidget(
                controller: _controller,
                boundingBox: boundingBox,
              ),
            ),

            // 顶部导航栏
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 56,
                color: Colors.white,
                child:                     Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "扫一扫",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                )
              ),
            ),

            // 扫描提示文字
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: boxSize + 20),
                  Text(
                    "请将二维码与框内对齐",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),

            // 底部按钮
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.photo_library,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () async {
                      _controller.pickPhoto(context);
                    },
                  ),
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

// 遮罩层的绘制
class ScannerMaskWidget extends StatelessWidget {
  final double boxSize;
  final Widget scanWidget;

  const ScannerMaskWidget({
    required this.boxSize,
    required this.scanWidget,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;
    final center = Offset(screenSize.width / 2, screenSize.height / 2);

    return Stack(
      children: [
        // 遮罩层（使用ClipPath裁剪中间区域）
        IgnorePointer(
          child: ClipPath(
            clipper: _ScannerMaskClipper(boxSize: boxSize, center: center),
            child: Container(
              color: Color.fromRGBO(0, 0, 0, 0.8), // 四周80%黑
              width: screenSize.width,
              height: screenSize.height,
            ),
          ),
        ),
      ],
    );
  }
}

// 自定义裁剪路径
class _ScannerMaskClipper extends CustomClipper<Path> {
  final double boxSize;
  final Offset center;

  _ScannerMaskClipper({required this.boxSize, required this.center});

  @override
  Path getClip(Size size) {
    final path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))..addRect(
          Rect.fromCenter(
            center: center,
            width: boxSize,
            height: boxSize,
          ));
    path.fillType = PathFillType.evenOdd;
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}