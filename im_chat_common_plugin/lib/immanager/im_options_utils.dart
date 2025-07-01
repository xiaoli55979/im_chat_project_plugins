import 'package:im_chat_common_plugin/models/im_node_data.dart';

class ImOptionsUtils {
  // 私有构造函数，防止外部实例化
  ImOptionsUtils._internal();

  // 单例实例
  static final ImOptionsUtils _instance = ImOptionsUtils._internal();

  // 提供全局访问点
  factory ImOptionsUtils() => _instance;

  /// 私有 IM 节点信息
  late IMNodeData _imNode;

  /// 获取 IM 节点信息（懒加载）
  IMNodeData get imNode {
    _imNode ??= IMNodeData();
    return _imNode;
  }

  set imNode(IMNodeData value) {
    _imNode = value;
  }
}
