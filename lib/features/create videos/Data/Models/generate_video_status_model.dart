import 'package:graduation_project/features/create%20videos/Domain/Entites/generate_video_status_entity.dart';

class GenerateVideoStatusModel extends GenerateVideoStatusEntity {
  GenerateVideoStatusModel({required super.status, required super.video});

  factory GenerateVideoStatusModel.fromJson(Map<String, dynamic> json) {
    return GenerateVideoStatusModel(
      status: json['status'],
      video: Video.fromJson(json['video']),
    );
  }
}

class Video extends VideoStatusEntity {
  Video({
    required super.videoSource,
    required super.sId,
    required super.jobId,
    required super.createdBy,
    required super.title,
    required super.scriptId,
    required super.voiceId,
    required super.duration,
    required super.createdAt,
    required super.updatedAt,
    required super.iV,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      videoSource: VideoSource.fromJson(json['videoSource']),
      sId: json['_id'],
      jobId: json['jobId'],
      createdBy: json['createdBy'],
      title: json['title'],
      scriptId: json['scriptId'],
      voiceId: json['voiceId'],
      duration: json['duration'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      iV: json['__v'],
    );
  }
}

class VideoSource extends VideoSourceEntity {
  VideoSource({required super.secureUrl, required super.publicId});

  factory VideoSource.fromJson(Map<String, dynamic> json) {
    return VideoSource(
      secureUrl: json['secure_url'],
      publicId: json['public_id'],
    );
  }
}
