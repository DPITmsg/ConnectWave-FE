
import 'package:flutter/material.dart';
import 'package:my_project/Views/Styles/Colors.dart';
import 'package:my_project/Views/Styles/Shadows.dart';

import '../Classes/Trending.dart';
import 'WidgetTextTrending.dart';

class WidgetBoxSlice extends StatelessWidget {
  final Trending activity;
  const WidgetBoxSlice(this.activity ,{super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Container(
            width: 335,
            height: 120,
            decoration: BoxDecoration(
              boxShadow: [
                Shadow_Widget_Box
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
                        child: Image.network(activity.image_url),
                      ),
                    ),

                    Container(
                      height: 120,
                      width: 160,
                      color: Color_Dark_Gray,
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
                                  colors: [Color_Dark_Gray,Color(0xffffff)]
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
                        padding: EdgeInsets.fromLTRB(20, 25, 20, 1),
                        child: WidgetTextTrending(activity),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.0,)
      ],
    );
  }
}
