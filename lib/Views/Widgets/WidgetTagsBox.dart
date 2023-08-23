import 'package:flutter/material.dart';
import 'package:my_project/Views/Styles/Colors.dart';
import 'package:my_project/Views/Styles/Shadows.dart';

class WidgetTagsBox extends StatelessWidget {
  final Widget child;
  const WidgetTagsBox(this.child,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [Shadow_Widget_Box],
        color: Color_Light_Blue,
        borderRadius: BorderRadius.circular(360)
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 0, 5, 0),
        child: this.child
      ),
    );
  }
}
