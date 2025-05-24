import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graduation_project/features/dashboard/Domain/usecases/dashboard_information_use_case.dart';
import 'package:graduation_project/features/dashboard/Domain/usecases/get_all_videos_use_case.dart';
import 'package:graduation_project/features/dashboard/Presentation/cubit/dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit({required this.useCase, required this.getAllVideosUseCase})
    : super(DashboardInitial());

  final DashboardInformationUseCase useCase;
  final GetAllVideosUseCase getAllVideosUseCase;

  Future<void> getDashboardInformation() async {
    emit(DashboardLoading());
    final result = await useCase.call();
    result.fold(
      (failure) {
        emit(DashboardError(message: failure.message));
        print(failure.message);
      },
      (data) {
        emit(DashboardLoaded(data: data));
      },
    );
  }

  Future<void> getAllVideos() async {
    emit(DashboardLoading());
    final result = await getAllVideosUseCase.call();
    result.fold(
      (failure) {
        emit(AllVideosErrorState(message: failure.message));
        print(failure.message);
      },
      (data) {
        emit(AllVideosSuccessState(videos: data));
      },
    );
  }
}
