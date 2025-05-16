class UserData {
  AiCredits? aiCredits;
  int? videosCount;
  List<Videos>? videos;
  String? name;

  UserData({this.aiCredits, this.videosCount, this.videos});

  UserData.fromJson(Map<String, dynamic> json) {
   name = json['name'];
    aiCredits = json['aiCredits'] != null
        ? new AiCredits.fromJson(json['aiCredits'])
        : null;
    videosCount = json['videosCount'];
    if (json['videos'] != null) {
      videos = <Videos>[];
      json['videos'].forEach((v) {
        videos!.add(new Videos.fromJson(v));
      });
    }
  }
}

class AiCredits {
  String? sId;
  int? aiCredits;

  AiCredits({this.sId, this.aiCredits});

  AiCredits.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    aiCredits = json['aiCredits'];
  }
}

class Videos {
  VideoSource? videoSource;
  String? sId;
  String? createdBy;
  String? title;
  String? thumbnailUrl;
  String? scriptId;
  String? voiceId;
  String? language;
  String? accentOrDialect;
  int? duration;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Videos({
    this.videoSource,
    this.sId,
    this.createdBy,
    this.title,
    this.thumbnailUrl,
    this.scriptId,
    this.voiceId,
    this.language,
    this.accentOrDialect,
    this.duration,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  Videos.fromJson(Map<String, dynamic> json) {
    videoSource =
        json['videoSource'] != null
            ? new VideoSource.fromJson(json['videoSource'])
            : null;
    sId = json['_id'];
    createdBy = json['createdBy'];
    title = json['title'];
    thumbnailUrl = json['thumbnailUrl'];
    scriptId = json['scriptId'];
    voiceId = json['voiceId'];
    language = json['language'];
    accentOrDialect = json['accentOrDialect'];
    duration = json['duration'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}

class VideoSource {
  String? secureUrl;
  String? publicId;

  VideoSource({this.secureUrl, this.publicId});

  VideoSource.fromJson(Map<String, dynamic> json) {
    secureUrl = json['secure_url'];
    publicId = json['public_id'];
  }
}
