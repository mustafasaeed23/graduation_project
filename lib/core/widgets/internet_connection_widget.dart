import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:graduation_project/core/theming/assets.dart';
import 'package:graduation_project/core/theming/themes.dart';
import 'package:graduation_project/core/utilies/easy_loading.dart';
import 'package:graduation_project/core/widgets/custom_texts.dart';
import 'package:graduation_project/core/widgets/error_widget.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


class InternetConnectionWidget extends StatefulWidget {
  const InternetConnectionWidget({super.key, required this.materialApp});
  final MaterialApp materialApp;

  @override
  State<InternetConnectionWidget> createState() => _InternetConnectionWidgetState();
}

class _InternetConnectionWidgetState extends State<InternetConnectionWidget> {
  bool isConnected = true;
  @override
  void initState() {
    super.initState();
    InternetConnectionChecker().onStatusChange.asBroadcastStream().listen((result) {
      if (result == InternetConnectionStatus.disconnected) {
        setState(() {
          isConnected = false;
        });
      }
      if (result == InternetConnectionStatus.connected) {
        if (isConnected == false) {
          setState(() {
            isConnected = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<InternetConnectionStatus>(
      stream: InternetConnectionChecker().onStatusChange,
      initialData: InternetConnectionStatus.connected,
      builder: (context, snapshot) {
        final isConnected = snapshot.data == InternetConnectionStatus.connected;
        return isConnected
            ? widget.materialApp
            : MaterialApp(
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                debugShowCheckedModeBanner: false,
                theme: lightTheme,
                darkTheme: darkTheme,
                builder: (context, widget) {
                  configLoading();
                  widget = EasyLoading.init()(context, widget);
                  return widget;
                  // return DevicePreview.appBuilder(context, widget);
                },
                home: Scaffold(
                  body: Container(
                    color: Colors.white,
                    width: MediaQuery.sizeOf(context).width,
                    child: TregoErrorWidget(
                      asset: Assets.offlineFailureImage,
                      message: "No Internet Connection !".tr(),
                      secondaryWidget: Text16(
                        text: "The app will automatically be restored when you connect to the internet".tr(),
                        textColor: Colors.black54,
                        weight: FontWeight.w500,
                        alignment: TextAlign.center,
                      ),
                      textColor: Colors.black,
                    ),
                  ),
                ),
              );
      },
    );
  }
}
