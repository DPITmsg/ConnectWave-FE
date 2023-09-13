import 'package:flutter/material.dart';
import 'package:my_project/Views/Styles/Shadows.dart';

class WidgetBackgroundBox extends StatelessWidget {
  final Widget child;

  const WidgetBackgroundBox(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const Expanded(flex:2,child: SizedBox()),
        Expanded(
          flex: 5,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            child: Stack(

              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/Views/Styles/Backgrounds/Background_3.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: screenWidth,
                  decoration: BoxDecoration(
                    boxShadow: [
                      Shadow_Widget_Box
                    ],
                  ),
                  child:child,
                  ),
              ],
            )
            ),
          ),
      ],
    );
  }
}
