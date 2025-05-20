import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:im_chat_common_plugin/config/color/colors.dart';
import 'package:im_chat_common_plugin/util/asset_util.dart';
import 'package:im_chat_common_plugin/util/fonts.dart';

class StateTextView extends StatefulWidget {

  StateTextView({
    super.key,
    required this.text,
    required this.select,
    Color? bgColor,
    Color? selectBgColor,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.padding,
    this.onPressed,
    this.assets,
    this.selectAssets,
  }) : bgColor = bgColor ?? IMColors.colorF8F8F8,
       selectBgColor = selectBgColor ?? const Color(0xff2F50F7).withOpacity(0.05);

  final bool select;
  final String text;
  final VoidCallback? onPressed;
  final Color bgColor;
  final Color selectBgColor;
  final EdgeInsetsGeometry? padding;
  final MainAxisAlignment mainAxisAlignment;
  final String? assets;
  final String? selectAssets;

  @override
  State<StateTextView> createState() => _StateTextViewState();
}

class _StateTextViewState extends State<StateTextView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
      },
      child: Container(
        padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: widget.select ? widget.selectBgColor : widget.bgColor,
          borderRadius: BorderRadius.circular(10.w),
          border: Border.all(
            color: widget.select ? IMColors.primaryColor : Colors.transparent,
            width: 1.w,
          ),
        ),
        child: Row(
          mainAxisAlignment: widget.mainAxisAlignment,
          children: [
            if (widget.assets != null)
              ...[
                AssetUtil.asset(
                  widget.select ? (widget.selectAssets ?? widget.assets)! : widget.assets!,
                ),
                SizedBox(width: 6.w),
              ],
            CommonText.instance(widget.text, 14.sp, color: widget.select ? IMColors.primaryColor : IMColors.normalTextColor,
                fontWeight: CommonFontWeight.medium),
          ],
        ),
      ),
    );
  }
}
