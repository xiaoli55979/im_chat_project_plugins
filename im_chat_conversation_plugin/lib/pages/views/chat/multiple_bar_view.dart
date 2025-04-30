import 'package:flutter/material.dart';

class MultipleBarView extends StatelessWidget {
  const MultipleBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 50 + MediaQuery.of(context).padding.bottom,
      child: Row(
        children: [
          TextButton(
              onPressed: () {},
              child: Text("收藏", style: TextStyle(color: Colors.black54, fontSize: 14),)),
          SizedBox(width: 50,),
          TextButton(
              onPressed: () {},
              child: Text("转发${111}", style: TextStyle(color: Colors.black54, fontSize: 14),)),
          SizedBox(width: 50,),
          TextButton(
              onPressed: () {},
              child: Text("删除", style: TextStyle(color: Colors.red, fontSize: 14),)),
          SizedBox(width: 50,),
          TextButton(
              onPressed: () {},
              child: Text("撤回", style: TextStyle(color: Colors.red, fontSize: 14),)),
        ],
      ),
    );
  }
}
