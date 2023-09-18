import 'package:flutter/material.dart';
import 'Classes/activitydetails.dart';

import 'Classes/Activity.dart';
import 'Styles/Colors.dart';
import 'Styles/StyleText.dart';
import 'Widgets/WidgetBackgroundBox.dart';
import 'Widgets/WidgetBox.dart';
import 'Widgets/WidgetButtons.dart';
import 'Widgets/tags.dart';

class DetailedActivityPage extends StatefulWidget {
  final ActivityDetails activity;

  DetailedActivityPage({required this.activity});

  @override
  _DetailedActivityPageState createState() => _DetailedActivityPageState();
}

class _DetailedActivityPageState extends State<DetailedActivityPage> {
  late ActivityDetails activity;

  @override
  void initState() {
    super.initState();
    activity = widget.activity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Expanded(
              child: Column(
                children: [Image.asset('assets/map.png'), SizedBox()],
              ),
            ),
            WidgetBackgroundBox(
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 30, 25, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      activity.title,
                      softWrap: true,
                      style: Text_Title_Top,
                    ),
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: Container(
                          child: Column(
                            children: [
                              Expanded(
                                child: WidgetBox(
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            'Created by:  ${activity.author}',
                                            style: Text_Detailed_Page_Regular,
                                          ),
                                          Text(
                                            'Starts on:  ${activity.date}',
                                            style: Text_Detailed_Page_Regular,
                                          ),
                                          Text(
                                            'Category is:  ${activity.category}',
                                            style: Text_Detailed_Page_Regular,
                                          ),
                                          Text(
                                            'Address is:  ${activity.address}',
                                            style: Text_Detailed_Page_Regular,
                                          ),
                                          Text(
                                            'Tags',
                                            style: Text_Detailed_Page_Regular,
                                          ),
                                          Tags(activity.tags),
                                          Text(
                                            'Description \n ${activity.description}',
                                            style: Text_Detailed_Page_Regular,
                                          ),
                                        ],
                                      ),
                                      // Rest of your layout code
                                    ],
                                  ),
                                  Color_Blue,
                                  Color_Light_Blue,
                                ),
                              ),
                              // Rest of your layout code
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            child: WidgetButton(
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Join ',
                                      style: Text_Widget_Buttons_Blue,
                                    ),
                                    Icon(
                                      Icons.add_circle,
                                      color: Color_Light_Blue,
                                    ),
                                  ],
                                ),
                              ),
                              Color_Dark_Gray,
                            ),
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                            child: WidgetButton(
                              Center(
                                child: Text(
                                  "I'm interested",
                                  style: Text_Widget_Buttons_Blue,
                                ),
                              ),
                              Color_Dark_Gray,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Other classes, imports, and assets should remain unchanged
