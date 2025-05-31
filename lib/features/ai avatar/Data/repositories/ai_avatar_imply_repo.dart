import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/exceptions.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/features/ai%20avatar/Data/datasources/ai_avatar_data_source.dart';
import 'package:graduation_project/features/ai%20avatar/Domain/entities/ai_avtar_person_entity.dart';
import 'package:graduation_project/features/ai%20avatar/Domain/repositories/ai_avatar_contract_repo.dart';

class AiAvatarImplyRepo implements AiAvatarContractRepo {
  final AiAvatarDataSource dataSource;

  AiAvatarImplyRepo({required this.dataSource});
  @override
  Future<Either<Failure, List<AiAvtarPersonEntity>>> getAllAiAvtars() async {
    try {
      final result = await dataSource.getAllAiAvatar();
      return Right(result);
    } on ServerException catch (err) {
      return Left(ServerFailure(message: err.message));
    } catch (e) {
      return const Left(
        ServerFailure(message: "Something went wrong, please try again later"),
      );
    }
  }
}
