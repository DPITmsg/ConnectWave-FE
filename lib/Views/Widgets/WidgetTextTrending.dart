import 'package:my_project/Views/Styles/StyleText.dart';

import '../Classes/Trending.dart';
import 'package:flutter/material.dart';

class WidgetTextTrending extends StatelessWidget {
  final Trending activity;

  const WidgetTextTrending(this.activity, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(activity.title, softWrap: true, style: Text_Trending_Title),
        Text(activity.category, style: Text_Trending_Category),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: activity.stats.map((stat) {
          return Text(stat, style: Text_Trending_Stats);
        }).toList())
      ],
    );
  }
}
