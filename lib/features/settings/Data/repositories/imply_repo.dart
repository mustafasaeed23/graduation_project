import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/exceptions.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/core/Errors/strings.dart';
import 'package:graduation_project/core/constant.dart';
import 'package:graduation_project/features/settings/Data/datasources/user_profile_data_source.dart';
import 'package:graduation_project/features/settings/Domain/entites/user_profile_entity.dart';
import 'package:graduation_project/features/settings/Domain/repositories/profile_contract_repo.dart';

class ImplyRepo implements ProfileContractRepo {
  final UserProfileDataSource userProfileDataSource;

  ImplyRepo({required this.userProfileDataSource});
  @override
  Future<Either<Failure, UserProfileEntity>> getUserProfile() async {
    try {
      final result = await userProfileDataSource.getUserProfile();
      return Right(result);
    } on ServerException catch (err) {
      return Left(ServerFailure(message: err.message));
    } on OfflineException {
      return const Left(OfflineFailure(message: OFFLINE_FAILURE_MESSAGE));
    } catch (err) {
      printDebug(err);
      return const Left(
        ServerFailure(message: 'Unexpected error occurred. Please try again.'),
      );
    }
  }
}
