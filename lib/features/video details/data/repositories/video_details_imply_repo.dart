import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/features/dashboard/Domain/entities/videos_entity.dart';
import 'package:graduation_project/features/video%20details/data/datasources/video_details_data_source.dart';
import 'package:graduation_project/features/video%20details/domain/contract_repo.dart/video_details_contract_repo.dart';

class VideoDetailsImplyRepo implements VideoDetailsContractRepo {
  final VideoDetailsDataSource videosDetailsDataSource;

  VideoDetailsImplyRepo({required this.videosDetailsDataSource});
  @override
  Future<Either<Failure, VideosEntity>> renameVideoTitle({
    required String newTitle,
    required String videoId,
  }) async {
    final result = await videosDetailsDataSource.renameVideoTitle(
      newTitle: newTitle,
      videoId: videoId,
    );
    return Right(result);
  }
}
