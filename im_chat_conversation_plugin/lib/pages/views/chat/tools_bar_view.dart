import 'package:flutter/material.dart';

// 定义工具类型的枚举 , card, system, richText, model, source
enum ToolType { image, video, file }

extension ToolTypeExtension on ToolType {
  int get value {
    switch (this) {
      case ToolType.image:
        return 0;
      case ToolType.video:
        return 1;
      case ToolType.file:
        return 2;
      // case ToolType.card:
      //   return 4;
      // case ToolType.system:
      //   return 5;
      // case ToolType.richText:
      //   return 6;
      // case ToolType.model:
      //   return 7;
      // case ToolType.source:
      //   return 8;
    }
  }
}

class ToolsBarView extends StatelessWidget {
  final double? height; // 高度由外部传入
  final ValueChanged<int>? onItemPressed; // 带索引的回调
  final List<ToolType> toolList; // 动态传入工具项列表

  // 构造函数接收高度、回调和工具列表
  ToolsBarView({
    this.height = 200,
    this.onItemPressed,
    required this.toolList,
  });

  @override
  Widget build(BuildContext context) {
    // 根据是否为平板动态计算列数
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = screenWidth > 600 ? 6 : 4;

    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          // 顶部横线
          Divider(
            height: 1,
            color: Colors.black.withValues(alpha: 0.2),
            thickness: 1,
          ),
          // 工具栏内容
          SizedBox(
            height: height,
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount, // 动态列数
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 1,
                    childAspectRatio: screenWidth > 600 ? 1.2 : 0.9),
                itemCount: toolList.length, // 动态使用外部传入的工具项列表
                itemBuilder: (context, index) {
                  return ToolItem(
                    index: index,
                    toolType: toolList[index], // 传递枚举值
                    crossAxisCount: crossAxisCount, // 传递列数
                    onTap: onItemPressed, // 传递回调
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ToolItem extends StatelessWidget {
  final int index;
  final ToolType toolType;
  final int crossAxisCount; // 列数
  final ValueChanged<int>? onTap; // 带索引的回调

  ToolItem({
    required this.index,
    required this.toolType,
    required this.crossAxisCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // 根据工具类型显示不同的内容
    IconData icon;
    String title;

    switch (toolType) {
      // case ToolType.order:
      //   icon = Icons.store_sharp;
      //   title = '订单';
      //   break;
      case ToolType.image:
        icon = Icons.image;
        title = '图片';
        break;
      case ToolType.video:
        icon = Icons.video_library;
        title = '视频';
        break;
      case ToolType.file:
        icon = Icons.insert_drive_file;
        title = '文件';
        break;
      // case ToolType.card:
      //   icon = Icons.contact_page;
      //   title = '名片';
      //   break;
      // case ToolType.system:
      //   icon = Icons.settings_system_daydream;
      //   title = '历史消息';
      //   break;
      // case ToolType.richText:
      //   icon = Icons.message_sharp;
      //   title = '富文本消息';
      //   break;
      // case ToolType.model:
      //   icon = Icons.mode_comment_outlined;
      //   title = '模板消息';
      //   break;
      // case ToolType.source:
      //   icon = Icons.source;
      //   title = '评价消息';
      //   break;
    }

    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!(index); // 传递索引
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double iconSize = constraints.maxWidth / crossAxisCount * 2; // 动态设置图标大小
                  return Icon(
                    icon,
                    size: iconSize,
                    color: Colors.black87,
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
