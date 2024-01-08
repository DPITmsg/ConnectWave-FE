import 'package:flutter/material.dart';
import '../Styles/Gradients.dart';
import '../Styles/Shadows.dart';

class CardProfile extends StatelessWidget {
  final String text;
  final String value;
  Widget? child;


  CardProfile(this.value, this.text, this.child);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => child!));},
      child: Container(
        width: 95,
        height: 110,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: Gradient_Profile_Stats,
            boxShadow: [
              Shadow_Darius,
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
      ),
    );
  }
}