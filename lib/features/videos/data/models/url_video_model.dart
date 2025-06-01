import 'package:graduation_project/features/videos/domain/entities/url_video_entity.dart';

class UrlVideoModel {
  final String status;
  final String? videoUrl;
  final int? progress;

  UrlVideoModel({required this.status, this.videoUrl, this.progress});

  factory UrlVideoModel.fromJson(Map<String, dynamic> json) {
    final status = json['status'] as String? ?? 'unknown';

    if (status == 'completed') {
      final video = json['video'] as Map<String, dynamic>?;
      final videoSource = video?['videoSource'] as Map<String, dynamic>?;
      final secureUrl = videoSource?['secure_url'] as String?;

      return UrlVideoModel(status: status, videoUrl: secureUrl, progress: null);
    } else {
      return UrlVideoModel(
        status: status,
        videoUrl: null,
        progress: json['progress'] is int ? json['progress'] as int : 0,
      );
    }
  }

  UrlVideoEntity toEntity() =>
      UrlVideoEntity(status: status, videoUrl: videoUrl, progress: progress);
}
