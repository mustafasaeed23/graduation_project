import 'package:graduation_project/features/ai%20avatar/Domain/entities/ai_avtar_person_entity.dart';

class AiAvtarPersonModel extends AiAvtarPersonEntity {
  AiAvtarPersonModel({
    required super.sId,
    required super.avatarName,
    required super.avatarId,
    required super.avatarImage,
    required super.iV,
    required super.createdAt,
    required super.updatedAt,
    required super.voiceIdfinal,
  });

  factory AiAvtarPersonModel.fromJson(Map<String, dynamic> json) {
    return AiAvtarPersonModel(
      sId: json['_id'],
      avatarName: json['avatarName'],
      avatarId: json['avatarId'],
      avatarImage: json['avatarImage'],
      iV: json['__v'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      voiceIdfinal: json['voiceId'],
    );
  }
}
