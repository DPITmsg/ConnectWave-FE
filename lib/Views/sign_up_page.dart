import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_project/Views/Styles/Colors.dart';
import 'package:my_project/Views/Styles/Shadows.dart';

class sign_in_page extends StatelessWidget {
  const sign_in_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('lib/Views/Styles/Backgrounds/Background_4.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height:  MediaQuery.of(context).size.height,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 170, 50, 210),
            child: Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color_Dark_Gray,
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: [Shadow_Widget_Box]
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 20, 25, 15),
                    child: Expanded(
                      child: SizedBox(
                        child: Column(
                          children: [
                            TextFormField(
                              style:const TextStyle(
                                color: Color_White
                              ),
                              autocorrect: false,
                              decoration: const InputDecoration(
                                  hintText: 'Email address',
                                  hintStyle: TextStyle(
                                      color: Color_White
                                  ),
                                  border: InputBorder.none,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
            ),
          )
        ],
      ),
    );
  }
}
