import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_project/Views/Classes/RecommendedActivity.dart';
import 'package:page_transition/page_transition.dart';

import '../../Service/activity_service.dart';
import '../../darius_mock_models/remote_service_singular_object.dart';
import '../Classes/User.dart';
import '../for_you_page.dart';

class ForYou extends StatefulWidget {
  const ForYou();

  @override
  _ForYouState createState() => _ForYouState();
}

class _ForYouState extends State<ForYou> {
  final double _swipeThreshold = 100.0;
  double _startY = 0.0;
  bool _isPageTransitionInProgress = false; // Flag to prevent multiple transitions

  void _onVerticalDragStart(DragStartDetails details) {
    _startY = details.localPosition.dy;
  }

  Future<void> _onVerticalDragUpdate(DragUpdateDetails details) async {
    if (_isPageTransitionInProgress) {
      return; // Ignore if a transition is already in progress
    }

    double deltaY = details.localPosition.dy - _startY;
    if (deltaY.abs() >= _swipeThreshold)  {
      setState(() {
        _isPageTransitionInProgress = true;
      });

      final response = await getForYouList();
      List<RecommendedActivity> forYouList =
      (jsonDecode(response.body) as List)
          .map((e) => RecommendedActivity.fromJson(e))
          .toList();

      final userData = await fetchUserData('yes');
      User user = User.fromJson(userData);

      Navigator.push(context, PageTransition(child: for_you_page(forYouList, user.username), type: PageTransitionType.bottomToTop)).then((value) {
        // Reset the flag when the transition is completed.
        setState(() {
          _isPageTransitionInProgress = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
      child: GestureDetector(
        onVerticalDragStart: _onVerticalDragStart,
        onVerticalDragUpdate: _onVerticalDragUpdate,
        child: Container(
          width: screenWidth,
          height: 120,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
          ),
          child: const Center(child: Text("For You", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),)),
        ),
      ),
    );
  }
}
