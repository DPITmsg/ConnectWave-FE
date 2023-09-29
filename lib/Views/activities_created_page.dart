import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_project/Views/Classes/Activity.dart';
import 'package:my_project/Views/Classes/User.dart';
import 'Classes/activitydetails.dart';
import 'Styles/Colors.dart';
import 'Widgets/containerongoingactivities.dart';
import 'Widgets/containersearchactivity.dart';
import 'Widgets/loadingscreen.dart';
import 'Classes/User.dart';

class ActivitiesCreatedPage extends StatefulWidget {
  final List<ActivityDetails> activities_created;
  final User user;

  const ActivitiesCreatedPage({Key? key, required this.activities_created, required this.user}) : super(key: key);

  @override
  State<ActivitiesCreatedPage> createState() => _ActivitiesCreatedPageState();
}


class _ActivitiesCreatedPageState extends State<ActivitiesCreatedPage> {
  void _onBackPressed() {
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoadingScreenPage()));
  }

  bool _isOnline(ActivityDetails activity){
    return activity.address != "online";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Created Activities"),
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
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: widget.activities_created.length,
                itemBuilder: (context, index) {
                  final activity = widget.activities_created[index];
                  return ContainerActivityForSearch(activity!, widget.user, _isOnline(activity));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
