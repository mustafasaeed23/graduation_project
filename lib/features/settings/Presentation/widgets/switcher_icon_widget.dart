import 'package:flutter/material.dart';
import 'package:graduation_project/core/theming/colors.dart';

class IconSwitcher extends StatefulWidget {
  @override
  _IconSwitcherState createState() => _IconSwitcherState();
}

class _IconSwitcherState extends State<IconSwitcher> {
  bool isOn = false;

  void toggleSwitch() {
    setState(() {
      isOn = !isOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isOn ? Icons.toggle_on : Icons.toggle_off,
        color: isOn ? AppColors.wamdahGoldColor2 : Colors.grey,
        size: 60,
      ),
      onPressed: toggleSwitch,
    );
  }
}
