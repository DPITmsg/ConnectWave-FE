import 'package:flutter/material.dart';

class CardMenuSmall extends StatelessWidget {
  final IconData icon;
  CardMenuSmall(this.icon);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Icon(icon, size: 60, color: Color(0xff1a1a1a),),
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.grey,
        shape: CircleBorder(),
        padding: EdgeInsets.all(24),
        backgroundColor: Color(0xff45bac4),
      ),
    );
  }
}