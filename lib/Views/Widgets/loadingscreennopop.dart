import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingScreenPageNoPop extends StatefulWidget {
  const LoadingScreenPageNoPop({super.key});

  @override
  State<LoadingScreenPageNoPop> createState() => _LoadingScreenPageStateNoPop();
}

class _LoadingScreenPageStateNoPop extends State<LoadingScreenPageNoPop> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfffbfbfb),
      child: Center(child: Image(image: AssetImage('assets/logo_gifv2.gif'), height: 250, width: 250,)),
    );
  }
}