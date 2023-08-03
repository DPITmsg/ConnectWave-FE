import 'package:flutter/material.dart';

class WidgetBackgroundBox extends StatelessWidget {
  final Widget child;
  const WidgetBackgroundBox(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 230,
      child: Container(
        width: 410,
        height: 760,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 395,
              height: 760,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
              ),
              child: SizedBox(
                width: 390,
                height: 760,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Color(0xFFc9cfcf),
                  ),
                  child: this.child,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
