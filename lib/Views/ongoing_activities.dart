
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../darius_mock_models/remote_service_singular_object.dart';
import 'Classes/User.dart';
import 'Widgets/containerongoingactivities.dart';
import 'Classes/activitydetails.dart';
import '../darius_mock_models/remote_service_list_objects.dart';
import 'Widgets/loadingscreen.dart';
import 'detailed_activity_page.dart';
import 'Widgets/containersearchactivity.dart';
import 'Styles/Colors.dart';

class OngoingActivities extends StatefulWidget {
  final User? user;

  const OngoingActivities({super.key, required this.user});

  @override
  State<OngoingActivities> createState() => _OngoingActivitiesState();
}

class _OngoingActivitiesState extends State<OngoingActivities> {

  void _onBackPressed() {
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoadingScreenPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: widget.user?.activities_enrolled?.length ?? 0,
                itemBuilder: (context, index) {
                  final activity = widget.user?.activities_enrolled[index];
                  return ContainerActivityForSearch(activity!, widget.user!);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}





