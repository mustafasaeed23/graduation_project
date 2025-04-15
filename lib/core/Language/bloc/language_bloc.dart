import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constant.dart';
import 'package:graduation_project/core/utilies/easy_loading.dart';
import '../../../core/helpers/service_locator.dart';
import '../../../core/utilies/app_preferences.dart';
import 'language_state.dart';

class LanguageBloc extends Cubit<LanguageState> {
  LanguageBloc() : super(LanguageInitial());

  Future<void> changeLanguage({required BuildContext context, required String languageCode}) async {
    showLoading();
    printDebug("languageCode before setting locale: ${context.locale.languageCode}");
    await context.setLocale(Locale(languageCode));
    printDebug("languageCode before setting locale: ${context.locale.languageCode}");

    String x = await getIt.get<AppPreferences>().getAppLanguage();
    if (languageCode != x) {
      await getIt.get<AppPreferences>().changeAppLanguage(languageCode);
    }
    // await Future.delayed(const Duration(milliseconds: 3000), () {});
    // if (languageCode == "ar") {
    //   if (context.mounted && CacheHelper.passedOnBoarding) {
    //     context.read<PreferencesCubit>().updatePreferences(
    //           prefKey: "language",
    //           prefValue: "Arabic",
    //         );
    //   }
    // } else {
    //   if (context.mounted && CacheHelper.passedOnBoarding) {
    //     context.read<PreferencesCubit>().updatePreferences(
    //           prefKey: "language",
    //           prefValue: "English",
    //         );
    //   }
    // }
    hideLoading();
    emit(LanguageChangedState());
  }
}
