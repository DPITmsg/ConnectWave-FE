import 'package:flutter/material.dart';

class ForYou extends StatelessWidget {
  const ForYou({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
      child: Container(
        width: screenWidth,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
        ),
        child: Center(child: Text("For You", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),)),
      ),
    );
  }
}
