
import 'package:flutter/material.dart';
import 'package:my_project/Service/activity_service.dart';
import 'package:my_project/Views/Widgets/container_ongoing_activities.dart';
import 'package:my_project/Views/Widgets/loadingscreennopop.dart';

import '../Service/friend_list_service.dart';
import '../darius_mock_models/remote_service_list_objects.dart';
import 'Classes/User.dart';
import 'Classes/activitydetails.dart';
import 'Styles/Colors.dart';
import 'Widgets/loadingscreen.dart';

class OngoingActivities extends StatefulWidget {
  User? user;

  OngoingActivities({super.key, required this.user});

  @override
  State<OngoingActivities> createState() => _OngoingActivitiesState();
}

class _OngoingActivitiesState extends State<OngoingActivities> {

  bool isLoaded = false;
  List<ActivityDetails> activitiesCurrent = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void updateData() async{
  }

  getData() async {
    print(widget.user!.activities_enrolled.length);
    User? tempUser = await getUserByUsername(widget.user!.username);
    setState(() {
      widget.user = tempUser;
    });
    activitiesCurrent = await fetchEnrolledActivitesData(widget.user!.activities_enrolled);

    setState(() {
      isLoaded = true;
    });
  }

  void _onBackPressed() {
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoadingScreenPage()));
  }

  void _removeActivity(ActivityDetails activity) async{
    final response = await unJoinActivity(activity.id, widget.user!.username);

    if (response.statusCode == 200){
      setState(() {
        activitiesCurrent.remove(activity);
        print('worked');
      });
    }
    print("didn't work");
  }

  bool _isOnline(ActivityDetails activity){
    return activity.address != "online";
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded ? Scaffold(
      appBar: AppBar(
        title: Text("Ongoing Activities"),
        backgroundColor: Color_Blue,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            _onBackPressed();
          },
        ),
      ),
      body: Container(
        color: Color_Gray,
        child: activitiesCurrent.length != 0 ? Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: activitiesCurrent.length ?? 0,
                itemBuilder: (context, index) {
                  final activity = activitiesCurrent[index];
                  return ContainerOngoingActivity(activity, widget.user!, _isOnline(activity), (){_removeActivity(activity);});
                },
              ),
            ),
          ],
        ): Center(child: Text("You haven't joined an activity!"),)
      ),
    ): LoadingScreenPageNoPop();
  }
}





