import 'package:flutter/material.dart';
import 'Classes/activitydetails.dart';
import 'package:my_project/darius_mock_models/post.dart';
import 'package:my_project/darius_mock_models/remote_service.dart';
import 'dart:developer' as developer;

class ActivityHistoryPage extends StatefulWidget {
  ActivityHistoryPage({Key? key}) : super(key: key);

  @override
  _ActivityHistoryPageState createState() => _ActivityHistoryPageState();
}

class _ActivityHistoryPageState extends State<ActivityHistoryPage> {
  final ActivityDetails activityDetails = ActivityDetails(
    date: '12-02-2023',
    title: 'Fotbal afara in casa la mac',
    tags: ['fotbal', 'begginner'],
    nrParticipants: 14,
    category: 'Sports',
    avgUserRating: 4.3,
    address: 'Str. Oarecare nr 23',
    description:
    'Fotbal afara cu niste oameni am teren de fotbal smecher si va rog sa va aduceti papuci de sport ca sa nu stricam terenul',
  );

  List<Post>? posts = [];
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    developer.log(posts!.length.toString());
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Activity History"),
        backgroundColor: Color(0xffc9cfcf),
      ),
      body: Container(
        color: Color(0xffc9cfcf),
        child: Text(posts!.first.title, style: TextStyle(fontSize: 32),)
        ),
      );
  }
}
