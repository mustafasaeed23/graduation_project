import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/features/settings/Domain/entites/user_profile_entity.dart';

abstract class ProfileContractRepo {
  Future<Either<Failure, UserProfileEntity>> getUserProfile();
  Future<Either<Failure, String>> purchaseCredits({required int credit});
}
