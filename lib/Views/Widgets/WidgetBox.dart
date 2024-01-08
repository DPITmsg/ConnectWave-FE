import 'package:flutter/material.dart';
import 'package:my_project/Views/Styles/Shadows.dart';

class WidgetBox extends StatelessWidget {
  final Widget child;
  final Color color_primary;
  final Color color_secondary;

  const WidgetBox(
    this.child,
    this.color_primary,
      this.color_secondary,{
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [color_primary, color_secondary]
          ),
          boxShadow: [
            Shadow_Widget_Box
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 12, 20),
          child: child,
        ),
    );
  }
}
