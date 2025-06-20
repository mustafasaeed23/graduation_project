import 'package:graduation_project/features/settings/Domain/entites/user_profile_entity.dart';

abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class UserProfileLoading extends SettingsState {}

class UserProfileLoaded extends SettingsState {
  final UserProfileEntity entity;

  UserProfileLoaded({required this.entity});
}

class UserProfileError extends SettingsState {
  final String message;

  UserProfileError({required this.message});
}
