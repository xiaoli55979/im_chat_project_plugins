import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/tools/fontsize_extension.dart';

import '../tools/font_utils.dart';

// 快捷菜单
class MenuItem extends StatelessWidget {
  final IconData? icon;
  final Icon? rightIcon;
  final String title;
  final Color? tinColor;
  final Color? backGroundColor;
  final double? radius;
  final bool? radiusTop;
  final bool? radiusBottom;
  final VoidCallback? onPressed;
  final String? url;
  final String? value;
  final EdgeInsetsGeometry? padding;
  final bool hideLine;
  final bool hideRightArrow;
  final String? notice;
  final Color? noticeColor;
  final double? noticeSize;
  final Color? noticeBagroundColors;
  final String? subTitle;
  final Color? subTitleColor;
  final bool? showBadges;
  final dynamic object;
  final dynamic tingObject;

  const MenuItem({
    super.key,
    this.icon,
    this.rightIcon,
    this.value,
    required this.title,
    this.tinColor,
    this.backGroundColor,
    this.radius,
    this.radiusTop,
    this.radiusBottom,
    this.url,
    this.padding,
    this.hideLine = false,
    this.hideRightArrow = false,
    this.notice,
    this.noticeSize,
    this.noticeColor,
    this.noticeBagroundColors,
    this.subTitle,
    this.subTitleColor,
    this.showBadges,
    this.onPressed,
    this.object,
    this.tingObject,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        } else if (url != null) {
          Get.toNamed(url!);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: backGroundColor ?? Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: (radiusTop != null ? Radius.circular(radius ?? 8) : Radius.zero), // 判断是否需要顶部圆角
            topRight: (radiusTop != null ? Radius.circular(radius ?? 8) : Radius.zero), // 判断是否需要顶部圆角
            bottomLeft: (radiusBottom != null ? Radius.circular(radius ?? 8) : Radius.zero), // 判断是否需要底部圆角
            bottomRight: (radiusBottom != null ? Radius.circular(radius ?? 8) : Radius.zero), // 判断是否需要底部圆角
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: padding ??
                  EdgeInsets.only(
                    top: 15,
                    left: 10,
                    right: hideRightArrow ? 0 : 10,
                    bottom: 15,
                  ),
              child: Row(
                children: <Widget>[
                  icon != null
                      ? Padding(
                          padding: EdgeInsets.only(
                            right: 8.0,
                          ),
                          child: Icon(
                            icon,
                            color: Theme.of(context).primaryColor.withValues(alpha: 0.85),
                          ),
                        )
                      : 10.horizontalSpace,
                  if (object != null) object,
                  if (object != null) 10.horizontalSpace,
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          title,
                          style: TextStyle(color: Colors.black87, fontSize: FontUtils.contentTitleFontSize),
                        ),
                        if (subTitle != null)
                          10.horizontalSpace,
                        Expanded(child: Text(subTitle ?? "", style: TextStyle(color: subTitleColor),)),
                      ],
                    ),
                  ),

                  if (notice != null)
                    Container(
                      width: noticeSize ?? 75.rl,
                      height: noticeSize ?? 20.rl,
                      decoration: BoxDecoration(
                        color: noticeBagroundColors ?? Colors.red, // 背景色
                        borderRadius: BorderRadius.circular(noticeSize ?? 10.rl), // 圆角
                      ),
                      child: Center(
                        child: Text(
                          notice!,
                          style: TextStyle(
                            fontSize: noticeSize ?? FontUtils.desFontSize,
                            color: noticeColor ?? Colors.white, // 文本颜色
                          ),
                        ),
                      ),
                    ),
                  if (notice != null) 5.horizontalSpace,
                  // 使用Align来确保 value 在右边对齐
                  Align(
                    alignment: Alignment.centerRight,
                    child: badges.Badge(
                      position: badges.BadgePosition.topStart(top: 5),
                      showBadge: showBadges != null && showBadges!,
                      child: Text(
                        value ?? "",
                        style: TextStyle(
                          color: tinColor ?? Colors.grey,
                          fontSize: FontUtils.contentTitleFontSize,
                        ),
                        softWrap: true, // 启用换行
                      ),
                    ),
                  ),

                  if (tingObject != null) tingObject,
                  Opacity(
                    opacity: hideRightArrow ? 0.0 : 1.0,
                    child: rightIcon ?? const Icon(Icons.chevron_right, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Opacity(
              opacity: hideLine ? 0.0 : 1.0,
              child: const Divider(
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
