import 'package:graduation_project/core/theming/assets.dart';

abstract class Failure {
  final String message;
  final String asset;
  const Failure( {required this.message,required this.asset,});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message,super.asset = Assets.emptyListFailureImage});

}
class EmptyListFailure extends Failure {
  const EmptyListFailure({required super.message,super.asset = Assets.emptyListFailureImage});
}

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure({required super.message,super.asset = Assets.emptyListFailureImage});
}

class OfflineFailure extends Failure {
  const OfflineFailure({required super.message,super.asset = Assets.offlineFailureImage});
}
