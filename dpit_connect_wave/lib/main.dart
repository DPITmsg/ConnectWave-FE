import 'package:dpit_connect_wave/Views/trending_activity.dart';
import 'package:flutter/material.dart';
import 'Views/detailed_activty.dart';
import 'Views/trending_activity.dart';

void main() {
  runApp(MaterialApp(
    home: DetailedActivity(),
  ));
}

class DetailedActivity extends StatefulWidget {
  const DetailedActivity({super.key});

  @override
  State<DetailedActivity> createState() => _DetailedActivityState();
}

class _DetailedActivityState extends State<DetailedActivity> {
  @override
  Widget build(BuildContext context) {
    return trending_activity();
  }
}
