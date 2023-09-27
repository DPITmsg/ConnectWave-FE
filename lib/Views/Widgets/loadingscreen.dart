import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingScreenPage extends StatefulWidget {
  const LoadingScreenPage({super.key});

  @override
  State<LoadingScreenPage> createState() => _LoadingScreenPageState();
}

class _LoadingScreenPageState extends State<LoadingScreenPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 750), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      child: Center(child: Image(image: AssetImage('assets/logo_gifv2.gif'), height: 250, width: 250,)),
    );
  }
}
