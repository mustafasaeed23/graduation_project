import 'package:flutter/material.dart';

abstract class LanguageEvent {}

class ChangeLanguageEvent extends LanguageEvent {
  final BuildContext context;
  final String languageCode;
  ChangeLanguageEvent(this.context, {required this.languageCode});
}
