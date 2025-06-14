class GenerateVideoStatusEntity {
  final String status;
  final VideoStatusEntity? video;  // Make nullable because video may be absent if not completed

  GenerateVideoStatusEntity({required this.status, this.video});
}

class VideoStatusEntity {
  final VideoSourceEntity videoSource;
  final String sId;
  final String jobId;
  final String createdBy;
  final String title;
  final String scriptId;
  final String voiceId;
  final int duration;
  final String createdAt;
  final String updatedAt;
  final int iV;

  VideoStatusEntity({
    required this.videoSource,
    required this.sId,
    required this.jobId,
    required this.createdBy,
    required this.title,
    required this.scriptId,
    required this.voiceId,
    required this.duration,
    required this.createdAt,
    required this.updatedAt,
    required this.iV,
  });
}

class VideoSourceEntity {
  final String secureUrl;
  final String publicId;

  VideoSourceEntity({required this.secureUrl, required this.publicId});
}
