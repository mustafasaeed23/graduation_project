import 'package:graduation_project/features/create%20videos/Domain/Entites/generate_script_entity.dart';

class GenerateScriptModel extends GenerateScriptEntity {
  GenerateScriptModel({required super.generatedScript, required super.title});

  factory GenerateScriptModel.fromJson(Map<String, dynamic> json) {
    return GenerateScriptModel(
      generatedScript: json['generatedScript'],
      title: json['title'],
    );
  }
}
