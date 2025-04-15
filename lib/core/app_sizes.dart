import 'package:flutter/cupertino.dart';

class AppSizes{
  final BuildContext context;

  AppSizes(this.context);

  // Heights
  double get height5 {
    return 5 * MediaQuery.sizeOf(context).height / 932;
  }// Heights
  double get height10 {
    return 10 * MediaQuery.sizeOf(context).height / 932;
  }

  double get height15 {
    return 15 * MediaQuery.sizeOf(context).height / 932;
  }

  double get width10 {
    return 10 * MediaQuery.sizeOf(context).width / 430;
  }

}