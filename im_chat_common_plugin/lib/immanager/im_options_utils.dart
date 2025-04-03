import '../models/app_model_entity.dart';
import '../models/im_node_model_entity.dart';

class ImOptionsUtils {
  // 私有构造函数，防止外部实例化
  ImOptionsUtils._internal();

  // 单例实例
  static final ImOptionsUtils _instance = ImOptionsUtils._internal();

  // 提供全局访问点
  factory ImOptionsUtils() => _instance;

  /// 私有 IM 节点信息
  late ImNodeModelEntity _imNode;

  /// 私有 APP 模块信息
  late List<AppModelEntity> _appConfigModel;

  /// 获取 IM 节点信息（懒加载）
  ImNodeModelEntity get imNode {
    _imNode ??= ImNodeModelEntity();
    return _imNode;
  }

  set imNode(ImNodeModelEntity value) {
    _imNode = value;
  }

  /// 获取 APP 模块信息（懒加载）
  List<AppModelEntity> get appConfigModel {
    _appConfigModel ??= [];
    return _appConfigModel;
  }

  set appConfigModel(List<AppModelEntity> value) {
    _appConfigModel = value;
  }
}
