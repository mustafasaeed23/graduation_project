import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/toast_manager.dart';
import 'package:graduation_project/features/settings/Domain/usecases/get_user_profile_use_case.dart';
import 'package:graduation_project/features/settings/Presentation/cubits/cubit/credits_state.dart';

class CreditsCubitCubit extends Cubit<CreditsState> {
  CreditsCubitCubit({required this.getUserProfileUseCase})
    : super(CreditsInitial());

  final GetUserProfileUseCase getUserProfileUseCase;

  Future<void> purchaseCredits({
    required int credit,
    required BuildContext context,
  }) async {
    emit(CreditsLoading());
    final result = await getUserProfileUseCase.purchaseCredits(credit: credit);
    result.fold(
      (failure) {
        emit(CreditsError(message: failure.message));
        print(failure.message);
        ToastManager.showBottomSmallToastSuccess(
          context: context,
          description: failure.message,
          bgColor: Colors.red,
        );
      },
      (message) {
        emit(CreditsLoaded(message: message));
        ToastManager.showBottomSmallToastSuccess(
          context: context,
          description: message,
          bgColor: Colors.green,
        );
      },
    );
  }
}
