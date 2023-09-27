import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_project/Views/Styles/Colors.dart';

class DisplayParticipantsPage extends StatelessWidget {
  final List<String> usernames;
  const DisplayParticipantsPage({super.key, required this.usernames});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color_Blue, title: Text("Participants"), centerTitle: true,),
      body: Container(
        color: Color_Gray,
        child: ListView.builder(
            itemCount: usernames.length,
            itemBuilder: (builder, index){
              return Text(usernames[index]);
            }
        ),
      ),
    );
  }
}
