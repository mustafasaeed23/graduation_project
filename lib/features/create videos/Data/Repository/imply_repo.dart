import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/exceptions.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/core/Errors/strings.dart';
import 'package:graduation_project/core/constant.dart';
import 'package:graduation_project/features/create%20videos/Data/Data%20Source/generate_video_data_source.dart';
import 'package:graduation_project/features/create%20videos/Data/Models/create_video_model.dart';
import 'package:graduation_project/features/create%20videos/Domain/Contract%20Repo/generate_video_contract_repo.dart';

class GenerateVideoImplyRepo implements GenerateVideoContractRepo {
  final GenerateVideoDataSource dataSource;

  GenerateVideoImplyRepo({required this.dataSource});
  @override
  Future<Either<Failure, VideoDataModel>> generateVideo({
    required String promot,
    required String language,
    required String accentOrDialect,
    required String type,
  }) async {
    try {
      final result = await dataSource.generateVideo(
        promot: promot,
        language: language,
        accentOrDialect: accentOrDialect,
        type: type,
      );
      return Right(result);
    } on ServerException catch (err) {
      return Left(ServerFailure(message: err.message));
    } on OfflineException {
      return const Left(OfflineFailure(message: OFFLINE_FAILURE_MESSAGE));
    } catch (err) {
      printDebug(err);
      return const Left(
        ServerFailure(message: "Something went wrong, please try again later"),
      );
    }
  }
}
