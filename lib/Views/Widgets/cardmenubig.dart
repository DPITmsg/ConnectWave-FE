
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../Styles/Gradients.dart';
import '../Styles/Shadows.dart';

class CardMenuBig extends StatelessWidget {
  final IconData icon;
  Widget? child;
  final buttonHeight = 100.0;
  final buttonWidth = 100.0;

  CardMenuBig(this.icon, this.child);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          PermissionStatus locationStatus = await Permission.location.request();

          if (locationStatus == PermissionStatus.granted) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => child!));
          }
          if (locationStatus == PermissionStatus.denied) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Cannot run without permission"),));
          }

          if (locationStatus == PermissionStatus.permanentlyDenied) {
            openAppSettings();
          }
        },

      child: Container(
        width: 150,height: 150,
           child: Icon(icon, size: 100, color: Color(0xff1a1a1a)),
           decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: gradientCardMenuBigHomePage,
             boxShadow: [
               Shadow_Widget_Box,
             ],
          ),
         ),
    );
  }
}