import 'package:graduation_project/features/ai%20avatar/Domain/entities/ai_avtar_person_entity.dart';

abstract class AiAvatarState {}

class AiAvatarInitial extends AiAvatarState {}

class AiAvatarLoading extends AiAvatarState {}

class AiAvatarLoaded extends AiAvatarState {
  final List<AiAvtarPersonEntity> entity;

  AiAvatarLoaded({required this.entity});
}

class AiAvatarError extends AiAvatarState {
  final String message;

  AiAvatarError({required this.message});
}
