import 'package:flutter/material.dart';
import '../Colors.dart';

class Background_0 extends StatelessWidget {
  const Background_0({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        fit: StackFit.loose,
        children: [Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color_Gray,
        ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  reverse: true,
                  child: Row(
                    children: [
                      Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                             stops: [0.2, 1.0],
                            colors: [Color_Blue, Color(0xffffff)],
                            transform: GradientRotation(1),
                          ),
                        ),
                      ),
                      SizedBox(width: 150,),
                    ],
                  ),
                ),
                SizedBox(height: 150,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: 150,),
                      Container(
                        width: 600,
                        height: 600,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            stops: [0.3, 1.0],
                            colors: [Color_Light_Blue, Color(0xffffff)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomLeft
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]
    );
  }
}
