import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/features/ai%20avatar/Domain/entities/ai_avtar_person_entity.dart';

abstract class AiAvatarContractRepo {
  Future<Either<Failure, List<AiAvtarPersonEntity>>> getAllAiAvtars();
}
