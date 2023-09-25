import 'package:flutter/material.dart';

import 'Classes/activitydetails.dart';
import 'Styles/Colors.dart';
import 'Widgets/containersearchactivity.dart';
import 'Widgets/loadingscreen.dart';

class ActivitiesCreatedPage extends StatefulWidget {
  final List<ActivityDetails> activities_created;

  const ActivitiesCreatedPage({Key? key, required this.activities_created}) : super(key: key);

  @override
  State<ActivitiesCreatedPage> createState() => _ActivitiesCreatedPageState();
}


class _ActivitiesCreatedPageState extends State<ActivitiesCreatedPage> {
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
                itemCount: widget.activities_created.length,
                itemBuilder: (context, index) {
                  final activity = widget.activities_created[index];
                  return ContainerActivityForSearch(activity);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
