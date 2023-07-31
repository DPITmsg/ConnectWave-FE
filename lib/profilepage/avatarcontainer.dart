import 'package:flutter/material.dart';

class AvatarContainer extends StatelessWidget {

  final AssetImage image;
  AvatarContainer(this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Color(0xff1a1a1a), Color(0xFFc9cfcf)], stops: [0.2, 1.0],
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
      child: CircleAvatar(
        radius: 72.0,
        backgroundImage: image,
      )
    );
  }
}
