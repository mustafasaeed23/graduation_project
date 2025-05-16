import 'package:graduation_project/core/theming/assets.dart';

abstract class Failure {
  final String message;
  // final String asset;
  const Failure({required this.message});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

class EmptyListFailure extends Failure {
  const EmptyListFailure({
    required super.message,
  
  });
}

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure({
    required super.message,
   
  });
}

class OfflineFailure extends Failure {
  const OfflineFailure({
    required super.message,
   
  });
}
