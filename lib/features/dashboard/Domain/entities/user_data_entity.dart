import 'package:graduation_project/features/dashboard/Domain/entities/air_credits_entity.dart';
import 'package:graduation_project/features/dashboard/Domain/entities/videos_entity.dart';

class UserDataEntity {
  final AirCreditsEntity airCreditsEntity;
  final int videosCount;
  final List<VideosEntity> videosEntity;
  final String name;

  UserDataEntity({
    required this.airCreditsEntity,
    required this.videosCount,
    required this.videosEntity,
    required this.name,
  });
}
