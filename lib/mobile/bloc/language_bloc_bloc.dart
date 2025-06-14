import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:graduation_project/mobile/bloc/language_bloc_event.dart';
import 'package:graduation_project/mobile/bloc/language_bloc_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState(Locale('en'))) {
    on<LanguageChanged>((event, emit) {
      emit(LanguageState(event.locale));
    });
  }
}
