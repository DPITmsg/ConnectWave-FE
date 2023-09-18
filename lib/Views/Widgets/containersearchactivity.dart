import 'package:flutter/cupertino.dart';
import 'package:my_project/Views/Styles/Colors.dart';
import 'package:my_project/Views/Styles/Shadows.dart';
import 'package:my_project/Views/Styles/StyleText.dart';
import '../Classes/activitydetails.dart';

class ContainerActivityForSearch extends StatelessWidget {
  ActivityDetails activity;

  ContainerActivityForSearch(this.activity);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Container(
        height: 120,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Color_White,
          boxShadow: [
            Shadow_Darius
          ]
        ),
        child: Column(
          children: [
            Text(activity.title, style: Text_Search_Activity_v1,),
            Text(activity.category, style: Text_Search_Activity_v2),
            Text(activity.address, style: Text_Search_Activity_v2),
            Text(activity.date, style: Text_Search_Activity_v2),
            Text('Number of participants: ${activity.nrParticipants.toString()}', style: Text_Search_Activity_v2),
          ],
        ),
      ),
    );
  }
}
