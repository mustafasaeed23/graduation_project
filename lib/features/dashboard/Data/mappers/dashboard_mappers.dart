import 'package:graduation_project/features/dashboard/Data/models/user_data_model.dart';
import 'package:graduation_project/features/dashboard/Domain/entities/air_credits_entity.dart';
import 'package:graduation_project/features/dashboard/Domain/entities/user_data_entity.dart' show UserDataEntity;
import 'package:graduation_project/features/dashboard/Domain/entities/video_source_entity.dart';
import 'package:graduation_project/features/dashboard/Domain/entities/videos_entity.dart';

class DashboardMappers {
  static UserDataEntity getUserDataEntityFromModel(UserData model) {
    return UserDataEntity(
      airCreditsEntity: model.aiCredits != null
          ? getAiCreditsEntityFromModel(model.aiCredits!)
          : AirCreditsEntity(airCredits: 0, sId: "N/A"),
      videosCount: model.videosCount ?? 0,
      videosEntity: model.videos?.map(getVideosEntityFromModel).toList() ?? [],
      name: model.name ?? "N/A",
    );
  }

  static AirCreditsEntity getAiCreditsEntityFromModel(AiCredits model) {
    return AirCreditsEntity(
      airCredits: model.aiCredits ?? 0,
      sId: model.sId ?? "N/A",
    );
  }

  static VideosEntity getVideosEntityFromModel(Videos model) {
    return VideosEntity(
      videoSourceEntity: model.videoSource != null
          ? getVideoSourceEntityFromModel(model.videoSource!)
          : VideoSourceEntity(publicId: "N/A", secureUrl: "N/A"),
      sId: model.sId ?? "N/A",
      createdBy: model.createdBy ?? "N/A",
      title: model.title ?? "N/A",
      thumbnailUrl: model.thumbnailUrl ?? "N/A",
      scriptId: model.scriptId ?? "N/A",
      voiceId: model.voiceId ?? "N/A",
      language: model.language ?? "N/A",
      accentOrDialect: model.accentOrDialect ?? "N/A",
      duration: model.duration ?? 0,
      createdAt: model.createdAt ?? "N/A",
      updatedAt: model.updatedAt ?? "N/A",
      iV: model.iV ?? 0,
    );
  }

  static VideoSourceEntity getVideoSourceEntityFromModel(VideoSource videoSource) {
    return VideoSourceEntity(
      publicId: videoSource.publicId ?? "N/A",
      secureUrl: videoSource.secureUrl ?? "N/A",
    );
  }
}
