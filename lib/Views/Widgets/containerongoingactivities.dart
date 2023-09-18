import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Styles/Gradients.dart';
import '../Styles/Shadows.dart';
import '../Styles/StyleText.dart';

class ContainerOngoing extends StatelessWidget {

  final String title;
  final String date;
  final String author;
  final String address;
  final int nrParticipants;
  final Widget? child;

  ContainerOngoing(this.title, this.date, this.author, this.address, this.nrParticipants, this.child);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => child!));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Container(
          decoration: BoxDecoration(
            gradient: Gradient_Profile_Stats,
            boxShadow: [Shadow_Darius],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Text_Ongoing_Activities_v1),
                Text("Date: $date", style: Text_Ongoing_Activities_v2),
                Text("Creator: $author", style: Text_Ongoing_Activities_v2),
                Text("Address: $address", style: Text_Ongoing_Activities_v2),
                Text("Number of participants: ${nrParticipants.toString()}", style: Text_Ongoing_Activities_v2)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

