import 'package:dpit_connect_wave/Views/Classes/Trending.dart';
import 'package:flutter/material.dart';

class WidgetTextTrending extends StatelessWidget {
  final Trending activity;
  const WidgetTextTrending(this.activity,{super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          activity.title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF45bac4),
          ),
        ),
        Text(
          activity.category,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            decoration: TextDecoration.underline,
          ),
        ),Text(
          activity.stat_1,
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF81dbe3),
          ),
        ), Text(
          activity.stat_2,
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF81dbe3),
          ),
        ),
      ],
    );
  }
}
