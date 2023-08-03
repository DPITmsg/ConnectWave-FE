import 'package:flutter/material.dart';

class WidgetButton extends StatelessWidget {
  final Widget child;
  final Color color_primary;

  const WidgetButton(this.child, this.color_primary,{super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 60,
      child: Container(
        decoration: BoxDecoration(
            color: this.color_primary,
            borderRadius: BorderRadius.circular(30.0)),
        child: this.child,
      ),
    );
  }
}
