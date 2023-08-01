import 'package:flutter/material.dart';

class WidgetBoxSlice extends StatelessWidget {
  final Widget child;
  const WidgetBoxSlice(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Container(
        width: 335,
        height: 120,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey,
              blurRadius: 10.0,
              spreadRadius: 0.5,
            ),
          ],
        ),
        child: Row(
          children: [
            Stack(
              children: [
                Positioned(
                  right: 0,
                  child: Container(
                    height: 120,
                    width: 190,
                    child: Image.asset('Assets/concert.jpg'),
                  ),
                ),

                Container(
                  height: 120,
                  width: 160,
                  color: Color(0xFF1a1a1a),
                ),

                Row(
                  children: [
                    SizedBox(width:45),
                    RotationTransition(
                      turns: AlwaysStoppedAnimation(-60/360),
                      child: Container(
                        height: 190,
                        width: 290,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.center,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF1a1a1a),Color(0xffffff)]
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  height: 120,
                  width: 190,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 15, 20, 1),
                    child: this.child,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
