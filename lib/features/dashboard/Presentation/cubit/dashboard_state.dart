import 'package:graduation_project/features/dashboard/Domain/entities/user_data_entity.dart';

abstract class DashboardState {}
  
class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardError extends DashboardState {
  final String message;
  DashboardError({required this.message});
}

class DashboardLoaded extends DashboardState {
  final UserDataEntity data;
  DashboardLoaded({required this.data});
}
