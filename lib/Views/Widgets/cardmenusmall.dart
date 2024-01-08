import 'package:flutter/material.dart';

class CardMenuSmall extends StatelessWidget {
  final IconData icon;
  final Widget? child;

  CardMenuSmall(this.icon, this.child);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => child!));
      },
      child: Icon(icon, size: 60, color: Color(0xff1a1a1a),),
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.black.withOpacity(0.4),
        shape: CircleBorder(),
        padding: EdgeInsets.all(24),
        backgroundColor: Color(0xff45bac4),
      ),
    );
  }
}