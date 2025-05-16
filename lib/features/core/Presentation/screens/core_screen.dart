import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routing/routes.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/core/widgets/custom_texts.dart';
import 'package:graduation_project/features/core/Presentation/widgets/core_featuers_widget.dart';
import 'package:graduation_project/features/core/Presentation/widgets/how_it_works_widget.dart';
import 'package:graduation_project/features/core/Presentation/widgets/landing_first_widget.dart';
import 'package:graduation_project/features/core/Presentation/widgets/last_updates_widget.dart';
import 'package:graduation_project/features/core/Presentation/widgets/stay_updated_widget.dart';

class CoreScreen extends StatelessWidget {
  const CoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            LandingFirstWidget(),
            HowItWorksWidget(),
            CorefeatuerWidget(),
            LastUpdatesWidget(),
            StayUpdatedWidget(),
          ],
        ),
      ),
    );
  }
}
