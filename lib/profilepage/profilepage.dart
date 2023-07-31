import 'package:flutter/material.dart';
import 'package:my_project/profilepage/avatarcontainer.dart';
import 'awesomegradient.dart';


class ProfilePage extends StatelessWidget {

  final AssetImage profilePic = AssetImage('assets/profile.picture.jpg');
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          SizedBox(height: 200),
          AwesomeGradient(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AvatarContainer(profilePic),
          ],
        )
        ],

      ),
    );
  }
}
