import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ForYou extends StatefulWidget {
  final Widget? child;

  const ForYou(this.child);

  @override
  _ForYouState createState() => _ForYouState();
}

class _ForYouState extends State<ForYou> {
  final double _swipeThreshold = 100.0;
  double _startY = 0.0;

  void _onVerticalDragStart(DragStartDetails details) {
    _startY = details.localPosition.dy;
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    double deltaY = details.localPosition.dy - _startY;
    if (deltaY.abs() >= _swipeThreshold) {
      Navigator.push(context, PageTransition(child: widget.child!, type: PageTransitionType.bottomToTop));
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
