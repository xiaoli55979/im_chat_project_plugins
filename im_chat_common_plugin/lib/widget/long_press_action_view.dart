import 'package:flutter/material.dart';

abstract class LongPressActionView<T> extends StatelessWidget {
  LongPressActionView({super.key});

  double longPressX = 0;
  double longPressY = 0;

  //长按触发弹出菜单
  void onLongPress(BuildContext context) {
    //当添加图片当图片被点击时候
    final RenderBox overlay = Overlay.of(context).context.findRenderObject()
        as RenderBox; //应该是找到容器，这个是抄PopupMenuButton里面抄来的

    RelativeRect position = RelativeRect.fromRect(
      Rect.fromLTRB(longPressX, longPressY, longPressX + 50, longPressY - 50),
      Offset.zero & overlay.size,
    );

    showMenu(
      color: Colors.white,
      context: context,
      position: position,
      items: menuItems,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      menuPadding: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      constraints: BoxConstraints(maxWidth: maxWidth),
    ).then(handler);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (details) {
        longPressX = details.globalPosition.dx; //获取全局触摸到的x方向位置
        longPressY = details.globalPosition.dy - 20; //获取全局y方向当位置并且下移20,菜单一般需要显示在下面，而不是按着的位置
      },
      onLongPress: () => onLongPress(context),
      child: childBuild(context),
    );
  }

  Widget childBuild(BuildContext context);

  double get maxWidth;

  List<PopupMenuItem<T>> get menuItems;

  PopupMenuItemSelected<T?> get handler;
}
