abstract class CreditsState {}

class CreditsInitial extends CreditsState {}

class CreditsLoading extends CreditsState {}

class CreditsLoaded extends CreditsState {
  final String message;
  CreditsLoaded({required this.message});
}

class CreditsError extends CreditsState {
  final String message;
  CreditsError({required this.message});
}
