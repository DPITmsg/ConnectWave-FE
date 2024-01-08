import 'package:flutter/material.dart';
import 'package:my_project/Views/Styles/Shadows.dart';

class WidgetButton extends StatelessWidget {
  final Widget child;
  final Color color_primary;

  const WidgetButton(this.child, this.color_primary, {super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: color_primary,
          borderRadius: BorderRadius.circular(90),
          boxShadow: [Shadow_Widget_Box],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15,15, 15,15),
            child: child
        ),
    );
  }
}
