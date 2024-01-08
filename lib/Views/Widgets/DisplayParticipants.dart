import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_project/Views/Styles/Colors.dart';
import 'package:my_project/Views/Widgets/container_rate_activity.dart';
import 'package:my_project/Views/Widgets/containerdisplayparticipants.dart';
import 'package:my_project/Views/Widgets/loadingscreen.dart';

import '../Classes/Friend.dart';

class DisplayParticipantsPage extends StatefulWidget {
  final List<Friend> participants;
  final bool isAuthor;
  final VoidCallback Function;

  DisplayParticipantsPage({Key? key, required this.participants, required this.isAuthor, required this.Function})
      : super(key: key);

  @override
  _DisplayParticipantsPageState createState() => _DisplayParticipantsPageState();
}

class _DisplayParticipantsPageState extends State<DisplayParticipantsPage> {
  void _removeParticipant(String username) {
    setState(() {
      widget.participants.remove(username);
    });
    widget.Function();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color_Blue,
        title: Text("Participants"),
        centerTitle: true,
      ),
      body: Container(
        color: Color_Gray,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ListView.builder(
            itemCount: widget.participants.length,
            itemBuilder: (builder, index) {
              return ContainerParticipants(widget.participants[index].name, widget.participants[index].pfp, widget.isAuthor, (){_removeParticipant(widget.participants[index].name);});
            },
          ),
        ),
      ),
    );
  }
}
