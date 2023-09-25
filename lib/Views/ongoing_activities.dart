
import 'package:flutter/material.dart';

import '../darius_mock_models/remote_service_singular_object.dart';
import 'Classes/User.dart';
import 'Styles/Colors.dart';
import 'Widgets/containersearchactivity.dart';
import 'Widgets/loadingscreen.dart';

class OngoingActivities extends StatefulWidget {
  const OngoingActivities({super.key});

  @override
  State<OngoingActivities> createState() => _OngoingActivitiesState();
}

class _OngoingActivitiesState extends State<OngoingActivities> {
  User? user;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      final userData = await fetchUserData();
      user = User.fromJson(userData);

      setState(() {
        isLoaded = true;
      });
    } catch (error) {
      print('Error loading data: $error');
    }
  }

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
              child: Visibility(
                visible: isLoaded,
                replacement: Center(child: const CircularProgressIndicator()),
                child: ListView.builder(
                  itemCount: user?.activities_enrolled?.length ?? 0,
                  itemBuilder: (context, index) {
                    final activity = user?.activities_enrolled[index];
                    return ContainerActivityForSearch(activity!);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





