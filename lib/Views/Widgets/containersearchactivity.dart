import 'package:flutter/cupertino.dart';
import 'package:my_project/Views/Styles/Colors.dart';
import '../Classes/activitydetails.dart';

class ContainerActivityForSearch extends StatelessWidget {
  ActivityDetails activity;

  ContainerActivityForSearch(this.activity);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Color_White,
        ),
        child: Column(
          children: [
            Text(activity.title),
            Text(activity.category),
            Text(activity.address),
            Text(activity.date),
            Text('Number of participants: ${activity.nrParticipants.toString()}'),
          ],
        ),
      ),
    );
  }
}
