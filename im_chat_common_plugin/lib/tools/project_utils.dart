class ProjectType {
  final String value;
  const ProjectType(this.value);

  static const ProjectType iChat = ProjectType("iChat");

  @override
  String toString() => value;
}

class ProjectUtils {
  ProjectUtils._();

  // 用于手动设置的全局项目类型，默认为 null
  static ProjectType? _globalProjectType;

  // 获取项目类型，如果全局类型已手动设置则返回该类型，否则根据 ToolsUtils 的逻辑返回类型
  static ProjectType get projectType {
    return _globalProjectType ?? ProjectType.iChat;
  }

  // 设置全局的项目类型
  static void setGlobalProjectType(ProjectType type) {
    _globalProjectType = type;
  }

  // 清除手动设置的全局项目类型，以便恢复为默认逻辑
  static void resetGlobalProjectType() {
    _globalProjectType = null;
  }
}
