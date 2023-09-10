import 'package:flutter/material.dart';
import 'package:my_project/Views/Styles/Colors.dart';
import 'package:my_project/Views/Styles/Shadows.dart';

import '../Classes/Trending.dart';
import 'WidgetTextTrending.dart';

class WidgetBoxSlice extends StatelessWidget {
  final Trending activity;

  const WidgetBoxSlice(this.activity, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,0,0,10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [Shadow_Widget_Box],
            color: Color_Dark_Gray,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
                    child: WidgetTextTrending(activity),
                  )),
              Expanded(
                flex: 5,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color_Dark_Gray,Color_Light_Blue]
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Image.network(activity.image_url),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
