import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../tools/font_utils.dart';

class PasswordCheckView extends StatelessWidget {
  final String title;
  final bool selected;

  const PasswordCheckView({
    Key? key,
    required this.title,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: FontUtils.desFontSize * 1.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 1.0.sp,
            height: 1.0.sp,
            child: Transform.scale(
              scale: 0.75,
              child: Checkbox(
                shape: const CircleBorder(),
                visualDensity: VisualDensity.compact,
                value: true,
                activeColor: selected ? Theme.of(context).primaryColor : Colors.black.withOpacity(0.35),
                onChanged: (value) {},
              ),
            ),
          ),
          10.horizontalSpace,
          Text(
            title,
            style: TextStyle(
              fontSize: FontUtils.desFontSize,
              color: selected ? Colors.black : Colors.black.withOpacity(0.5),
            ),
          )
        ],
      ),
    );
  }
}
