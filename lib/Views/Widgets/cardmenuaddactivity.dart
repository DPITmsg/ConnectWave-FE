import 'package:flutter/material.dart';

class CardMenuAddActivity extends StatelessWidget {
  final Widget? child;
  const CardMenuAddActivity(this.child,{super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Color(0xff45BAC4), shape: CircleBorder()),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => child!));
        },
        child: Icon(Icons.add_circle_outline, color: Color(0xff1a1a1a),)
    );
  }
}
