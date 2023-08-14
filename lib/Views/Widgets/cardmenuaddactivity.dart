import 'package:flutter/material.dart';
import '../Styles/Colors.dart';

class CardMenuAddActivity extends StatelessWidget {
  const CardMenuAddActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Color_Blue, shape: CircleBorder()),
        onPressed: (){},
        child: Icon(Icons.add_circle_outline, color: Color_Dark_Gray,)
    );
  }
}
