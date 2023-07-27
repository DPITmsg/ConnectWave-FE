import 'package:flutter/material.dart';

class WidgetBox extends StatelessWidget {
  final Widget child;
  final Color color_primary;
  final Color color_secondary;

  const WidgetBox(
    this.child,
    this.color_primary,
      this.color_secondary,{
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(2, 0, 2, 0),
      width: 344,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: Center(
              child: SizedBox(
                width: 343,
                height: 120,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [this.color_primary, this.color_secondary]
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey,
                        blurRadius: 10.0,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(18, 14, 11, 10),
                    child: this.child,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
