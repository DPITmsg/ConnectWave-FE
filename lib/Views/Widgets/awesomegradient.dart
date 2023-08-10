import 'package:flutter/material.dart';

class AwesomeGradient extends StatelessWidget {
  const AwesomeGradient({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    return Container(
      width: screenWidth,
      height: screenHeight*0.2,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xff25656B), Color(0xff45BAC4)], stops: [0, 0.7])
      ),
    );
  }
}

