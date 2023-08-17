import 'package:flutter/material.dart';
import '../Styles/Gradients.dart';
import '../Styles/Shadows.dart';

class CardMenuBig extends StatelessWidget {
  final IconData icon;
  final buttonHeight = 100.0;
  final buttonWidth = 100.0;

  CardMenuBig(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,height: 150,
         child: Icon(icon, size: 100, color: Color(0xff1a1a1a)),
         decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: gradientCardMenuBigHomePage,
           boxShadow: [
             Shadow_Widget_Box,
           ],
        ),
       );
  }
}