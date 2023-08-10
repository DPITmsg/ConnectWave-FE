import 'package:flutter/material.dart';

class CardProfile extends StatelessWidget {
  final String text;
  final String value;


  CardProfile(this.value, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(colors: [Color(0xffDFDFDF), Color(0xffc9cfcf)], stops: [0.3, 0.8], transform: GradientRotation(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 2,
              spreadRadius: 2,
              offset: Offset(0, 3),
            )
          ]
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  value,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}