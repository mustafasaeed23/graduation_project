class VideoDataModel {
  final Video video;

  VideoDataModel({required this.video});

  factory VideoDataModel.fromJson(Map<String, dynamic> json) {
    return VideoDataModel(video: Video.fromJson(json['video']));
  }
}

class Video {
  final String createdBy;
  final String title;
  final VideoSource videoSource;
  final String thumbnailUrl;
  final String scriptId;
  final String voiceId;
  final String language;
  final String accentOrDialect;
  final int duration;
  final String id;
  final String createdAt;
  final String updatedAt;
  final int v;

  Video({
    required this.createdBy,
    required this.title,
    required this.videoSource,
    required this.thumbnailUrl,
    required this.scriptId,
    required this.voiceId,
    required this.language,
    required this.accentOrDialect,
    required this.duration,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      createdBy: json['createdBy'],
      title: json['title'],
      videoSource: VideoSource.fromJson(json['videoSource']),
      thumbnailUrl: json['thumbnailUrl'],
      scriptId: json['scriptId'],
      voiceId: json['voiceId'],
      language: json['language'],
      accentOrDialect: json['accentOrDialect'],
      duration: json['duration'],
      id: json['_id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}

class VideoSource {
  final String secureUrl;
  final String publicId;

  VideoSource({
    required this.secureUrl,
    required this.publicId,
  });

  factory VideoSource.fromJson(Map<String, dynamic> json) {
    return VideoSource(
      secureUrl: json['secure_url'],
      publicId: json['public_id'],
    );
  }
}
