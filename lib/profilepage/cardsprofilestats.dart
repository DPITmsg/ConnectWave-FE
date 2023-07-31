import 'package:flutter/material.dart';

class CardProfile extends StatelessWidget {
  final String text;
  final String value;

  CardProfile(this.value, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(colors: [Color(0xffFFFFFF), Color(0xffc9cfcf)], stops: [0.3, 0.8], transform: GradientRotation(8)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(child: Text(text, style: TextStyle(fontSize: 16))),
          Center(child: Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),)),
        ],
      )
    );
  }
}
