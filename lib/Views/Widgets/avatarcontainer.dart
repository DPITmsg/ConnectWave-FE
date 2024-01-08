import 'package:flutter/material.dart';
import '../Styles/Colors.dart';
import '../Styles/Shadows.dart';

class AvatarContainer extends StatelessWidget {

  final String image;
  AvatarContainer(this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Color_Dark_Gray, Color_Gray], stops: [0.2, 1.0],
        ),
        boxShadow: [
          Shadow_Widget_Box,
        ],
      ),
      child: CircleAvatar(
        radius: 72.0,
        backgroundImage: NetworkImage(image),
      )
    );
  }
}
