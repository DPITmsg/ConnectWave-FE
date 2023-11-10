import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_project/Views/welcome_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: welcome_page(),
  ));
}
