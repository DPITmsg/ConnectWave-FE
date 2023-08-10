import 'package:flutter/material.dart';
import 'package:my_project/Views/Styles/Colors.dart';
import 'package:my_project/Views/Styles/Shadows.dart';

class WidgetBackgroundBox extends StatelessWidget {
  final Widget child;

  const WidgetBackgroundBox(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 530,
          height: 250,
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            child: Container(
              width: 400,
              height: 600,
              decoration: BoxDecoration(
                color: Color_Gray,
                boxShadow: [
                  Shadow_Widget_Box
                ],
              ),
              child:this.child,
              )
            ),
          ),
      ],
    );
  }
}
