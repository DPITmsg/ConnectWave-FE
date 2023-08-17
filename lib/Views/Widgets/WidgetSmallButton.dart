import 'package:flutter/material.dart';

import '../Styles/Colors.dart';
import '../Styles/Shadows.dart';

class WidgetSmallButton extends StatelessWidget {
  final Widget widget;

  const WidgetSmallButton(this.widget, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
          color: Color_Dark_Gray,
          border: Border.all(color: Color_Gray),
          boxShadow: [Shadow_Widget_Box],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: this.widget,
          ),
        ),
      ),
    );
  }
}
