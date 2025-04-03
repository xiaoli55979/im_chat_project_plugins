import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_detection_plugin/line_detection.dart';

import '../tools/tools_utils.dart';

class EasySplashScreen extends StatefulWidget {
  final Text? title;
  final Color backgroundColor;
  final ImageProvider? backgroundImage;
  final double logoWidth;
  final Image? logo;
  final Color loaderColor;
  final Text loadingText;
  final EdgeInsets loadingTextPadding;
  final Gradient? gradientBackground;
  final bool showLoader;
  final int durationInSeconds;
  final dynamic navigator;
  final List<LinkInfo> listPath;
  final int netStatus;
  final void Function(bool) onRetry;
  final void Function(bool) onTestStatus;
  final Future<Object> Function()? futureNavigator;

  const EasySplashScreen({
    super.key,
    this.loaderColor = Colors.black,
    this.futureNavigator,
    this.navigator,
    this.durationInSeconds = 3,
    this.logo,
    required this.onRetry,
    required this.onTestStatus,
    this.logoWidth = 50,
    this.title,
    this.netStatus = 0,
    this.backgroundColor = Colors.white,
    this.loadingText = const Text(''),
    this.loadingTextPadding = const EdgeInsets.only(top: 10.0),
    this.backgroundImage,
    this.gradientBackground,
    this.showLoader = true,
    required this.listPath,
  });

  @override
  _EasySplashScreenState createState() => _EasySplashScreenState();
}

class _EasySplashScreenState extends State<EasySplashScreen> {
  late ScrollController _scrollController;
  String version = "";

  Future<void> getVersion() async {
    String ver = await ToolsUtils.getVersion();
    setState(() {
      version = ver;
    });
  }

  @override
  void initState() {
    super.initState();
    getVersion();
    _scrollController = ScrollController();
    Future.delayed(const Duration(seconds: 2), () {
      getDeviceInfo();
    });
    if (widget.futureNavigator == null) {
      Timer(Duration(seconds: widget.durationInSeconds), () {
        if (widget.navigator is String) {
          Get.offAllNamed(widget.navigator as String);
        } else if (widget.navigator is Widget) {
          Get.offAll(() => widget.navigator as Widget);
        }
      });
    } else {
      widget.futureNavigator?.call().then((_route) {
        if (_route is String) {
          Get.offAllNamed(_route);
        } else if (_route is Widget) {
          Get.offAll(() => _route);
        }
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });

    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: widget.backgroundImage != null
                    ? DecorationImage(
                        fit: BoxFit.cover,
                        image: widget.backgroundImage!,
                      )
                    : null,
                gradient: widget.gradientBackground,
                color: widget.backgroundColor,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: widget.logoWidth,
                            child: widget.logo,
                          ),
                          if (widget.title != null) widget.title!
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        widget.showLoader
                            ? Container(
                                color: Colors.white,
                                height: 100,
                                child: ListView.builder(
                                  controller: _scrollController,
                                  itemCount: widget.listPath.length,
                                  itemBuilder: (context, index) {
                                    LinkInfo listMap = widget.listPath[index];
                                    String url = "";
                                    int duration = 10000;
                                    url = listMap.url;
                                    duration = listMap.duration;

                                    return Container(
                                      padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Text("线路${index + 1}  ", style: const TextStyle(fontSize: 14)),
                                              const SizedBox(width: 4),
                                            ],
                                          ),
                                          Text(
                                            duration > 18000 ? "线路繁忙" : "${duration}ms",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: duration < 600
                                                  ? Colors.green
                                                  : duration < 18000
                                                      ? Colors.red
                                                      : Colors.blue,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Container(),
                        if ((widget.netStatus == 0 || widget.netStatus == 2) && widget.loadingText.data!.isNotEmpty)
                          Padding(
                            padding: widget.loadingTextPadding,
                            child: widget.loadingText,
                          ),
                        if (widget.netStatus == 1 || widget.netStatus == 3)
                          Text(
                            widget.listPath.length == 1
                                ? "线路状态繁忙,请重试"
                                : widget.netStatus == 3
                                    ? "获取线路Key异常"
                                    : "线路繁忙,请重试",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        if (widget.netStatus == 1 || widget.netStatus == 3) 5.verticalSpace,
                        if (widget.netStatus == 1 || widget.netStatus == 3)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 25,
                                child: OutlinedButton(
                                  child: Text(
                                    "线路切换 >",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  onPressed: () {
                                    // if (ToolsUtils.instance.loginMsg.isNotEmpty) {
                                    //   String msg = ToolsUtils.instance.loginMsg;
                                    //   debugPrint("线路异常:$msg");
                                    //   LoggerUtils.error("线路异常:$msg", level: LogLevel.ERROR);
                                    //   ToolsUtils.instance.loginMsg = "";
                                    // }
                                    widget.onRetry(true);
                                  },
                                ),
                              ),
                              10.horizontalSpace,
                              SizedBox(
                                height: 25,
                                child: OutlinedButton(
                                  child: Text(
                                    "联系客服 >",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  onPressed: () {
                                    // if (ToolsUtils.instance.loginMsg.isNotEmpty) {
                                    //   String msg = ToolsUtils.instance.loginMsg;
                                    //   debugPrint("线路异常:$msg");
                                    //   LoggerUtils.error("线路异常:$msg", level: LogLevel.ERROR);
                                    //   ToolsUtils.instance.loginMsg = "";
                                    // }
                                    // ToolsUtils.openLocalServer();
                                    // Get.toNamed(Routes.customerService);
                                  },
                                ),
                              ),
                            ],
                          ),
                        15.verticalSpace,
                        if (widget.netStatus == 1)
                          SizedBox(
                            height: 33,
                            child: TextButton(
                              child: Text(
                                "网络不好?点击前往网页版 >",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(0.8),
                                ),
                              ),
                              onPressed: () {
                                // h5Url
                                // Get.toNamed(Routes.webView, parameters: {"title": "客服热线", "url": LinkUtils.h5Url});
                                // ApputilHandle.gotoWebsite(LinkUtils.h5Url);
                              },
                            ),
                          ),
                        10.verticalSpace,
                        Text(
                          version,
                          style: TextStyle(fontSize: 14),
                        ),
                        5.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getDeviceInfo() async {
    // your implementation here
  }
}
