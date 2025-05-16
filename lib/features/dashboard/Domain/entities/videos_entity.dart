import 'package:graduation_project/features/dashboard/Domain/entities/video_source_entity.dart';

class VideosEntity {
  final VideoSourceEntity videoSourceEntity;
  final String sId;
  final String createdBy;
  final String title;
  final String thumbnailUrl;
  final String scriptId;
  final String voiceId;
  final String language;
  final String accentOrDialect;
  final int duration;
  final String createdAt;
  final String updatedAt;
  final int iV;

  VideosEntity({
    required this.videoSourceEntity,
    required this.sId,
    required this.createdBy,
    required this.title,
    required this.thumbnailUrl,
    required this.scriptId,
    required this.voiceId,
    required this.language,
    required this.accentOrDialect,
    required this.duration,
    required this.createdAt,
    required this.updatedAt,
    required this.iV,
  });
}
