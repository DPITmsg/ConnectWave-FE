import 'package:flutter/material.dart';

import 'Views/trending_page.dart';

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
