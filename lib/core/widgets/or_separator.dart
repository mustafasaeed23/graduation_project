import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/widgets/custom_texts.dart';

class OrSeparator extends StatelessWidget {
  const OrSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * .05,
      ),
      child: Row(children: [
        Expanded(
            child: Container(
          height: .8,
          color: const Color.fromARGB(255, 172, 171, 171),
        )),
        Padding(padding: EdgeInsets.symmetric(horizontal: 17.w), child: const Text14(text: 'or')),
        Expanded(
            child: Container(
          height: .8.h,
          color: const Color.fromARGB(255, 172, 171, 171),
        ))
      ]),
    );
  }
}
