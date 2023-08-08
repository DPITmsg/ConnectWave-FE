import 'package:flutter/material.dart';
import '../Colors.dart';

class Background_1 extends StatelessWidget {
  const Background_1({super.key});

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
                child: Row(
                  children: [
                    SizedBox(width: 150,),
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          stops: [0.3, 1.0],
                          colors: [Color_Blue, Color(0xffffff)],
                          transform: GradientRotation(9),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 150,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                physics: const NeverScrollableScrollPhysics(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Container(
                      width: 400,
                      height: 400,
                     decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          stops: [0.3, 1.0],
                          colors: [Color_Light_Blue, Color(0xffffff)],
                          transform: GradientRotation(12),
                        ),
                      ),
                    ),
                    SizedBox(width: 150,)
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
