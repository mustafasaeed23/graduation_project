import 'package:graduation_project/features/videos/domain/entities/script_entity.dart';

class ScriptModel {
  final String generatedScript;
  final String title;

  ScriptModel({required this.generatedScript, required this.title});

  factory ScriptModel.fromJson(Map<String, dynamic> json) {
    return ScriptModel(
      generatedScript: json['generatedScript'],
      title: json['title'],
    );
  }

  ScriptEntity toEntity() {
    return ScriptEntity(generatedScript: generatedScript, title: title);
  }
}
