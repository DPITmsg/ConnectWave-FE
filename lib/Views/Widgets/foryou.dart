import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_project/Views/Classes/RecommendedActivity.dart';
import 'package:page_transition/page_transition.dart';

import '../../Service/activity_service.dart';
import '../for_you_page.dart';

class ForYou extends StatefulWidget {
  const ForYou();

  @override
  _ForYouState createState() => _ForYouState();
}

class _ForYouState extends State<ForYou> {
  final double _swipeThreshold = 100.0;
  double _startY = 0.0;

  void _onVerticalDragStart(DragStartDetails details) {
    _startY = details.localPosition.dy;
  }

  Future<void> _onVerticalDragUpdate(DragUpdateDetails details) async {
    double deltaY = details.localPosition.dy - _startY;
    if (deltaY.abs() >= _swipeThreshold)  {

      final response = await getForYouList();
      List<RecommendedActivity> for_you_list =
      (jsonDecode(response.body) as List)
          .map((e) => RecommendedActivity.fromJson(e))
          .toList();

      Navigator.push(context, PageTransition(child: for_you_page(for_you_list), type: PageTransitionType.bottomToTop));
      _startY = details.localPosition.dy; // Reset the start position
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
      child: GestureDetector(
        onVerticalDragStart: _onVerticalDragStart,
        onVerticalDragUpdate: _onVerticalDragUpdate,
        child: Container(
          width: screenWidth,
          height: 120,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
          ),
          child: Center(child: Text("For You", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),)),
        ),
      ),
    );
  }
}
