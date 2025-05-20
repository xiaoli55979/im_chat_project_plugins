import 'package:flutter/material.dart';

class MultipleBarView extends StatelessWidget {
  final int didSelectedCount;
  final int total;
  const MultipleBarView({super.key, required this.didSelectedCount, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 50 + MediaQuery.of(context).padding.bottom,
      child: Row(
        children: [
          SizedBox(width: 10,),
          TextButton(
              onPressed: () {},
              child: Text("收藏", style: TextStyle(color: Colors.black54, fontSize: 14),)),
          Spacer(),
          TextButton(
              onPressed: () {},
              child: Text("转发($didSelectedCount/$total)", style: TextStyle(color: Colors.black54, fontSize: 14),)),
          Spacer(),
          TextButton(
              onPressed: () {},
              child: Text("删除", style: TextStyle(color: Colors.red, fontSize: 14),)),
          Spacer(),
          TextButton(
              onPressed: () {},
              child: Text("撤回", style: TextStyle(color: Colors.red, fontSize: 14),)),
          Spacer()
        ],
      ),
    );
  }
}
