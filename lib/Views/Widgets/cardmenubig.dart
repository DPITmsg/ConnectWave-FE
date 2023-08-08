import 'package:flutter/material.dart';

class CardMenuBig extends StatelessWidget {
  final IconData icon;
  final buttonHeight = 100.0;
  final buttonWidth = 100.0;

  CardMenuBig(this.icon);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        width: 150,height: 150,
           child: Icon(icon, size: 100, color: Color(0xff1a1a1a)),
           decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xFF45BAC4), Color(0xFFc9cfcf)], stops: [0.2, 1.0],
              transform: GradientRotation(14),
            ),
             boxShadow: [
               BoxShadow(
                 color: Colors.grey.withOpacity(0.5),
                 spreadRadius: 5,
                 blurRadius: 7,
                 offset: Offset(0, 3), // changes position of shadow
               ),
             ],
          ),
         ),
    );
  }
}