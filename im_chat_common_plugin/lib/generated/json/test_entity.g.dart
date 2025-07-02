import 'package:im_chat_common_plugin/generated/json/base/json_convert_content.dart';
import 'package:im_chat_common_plugin/models/test_entity.dart';

TestEntity $TestEntityFromJson(Map<String, dynamic> json) {
  final TestEntity testEntity = TestEntity();
  final String? test = jsonConvert.convert<String>(json['test']);
  if (test != null) {
    testEntity.test = test;
  }
  return testEntity;
}

Map<String, dynamic> $TestEntityToJson(TestEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['test'] = entity.test;
  return data;
}

extension TestEntityExtension on TestEntity {
  TestEntity copyWith({
    String? test,
  }) {
    return TestEntity()
      ..test = test ?? this.test;
  }
}