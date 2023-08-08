import 'package:flutter/material.dart';

import 'Classes/Activity.dart';
import 'Styles/Backgrounds/Background_1.dart';
import 'Styles/Colors.dart';
import 'Styles/StyleText.dart';
import 'Widgets/WidgetBackgroundBox.dart';
import 'Widgets/WidgetBox.dart';
import 'Widgets/WidgetButtons.dart';

Activity activity = Activity(
    title: 'Football la Baza Sportiva Gheorgheni',
    author: 'Zdroba Petru',
    date: '26.07.2023',
    location: 'Str. Alexandru Vaida Voievod nr. 24',
    number_participants: 14,
    descrpition:
        'Caut oameni din zona Gheorgheni cu care sa ies la un footbal, nu conteaza daca esti bun, numai sa fii sociabil',
    creator_id: 666);

class detailed_activity_page extends StatelessWidget {
  const detailed_activity_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //FRAME OF PHONE
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(children: <Widget>[
          //LATER ADD MAP API INSTEAD OF IMAGE
          Positioned(
            top: 0,
            child: SizedBox(
              width: 530,
              height: 450,
              child: Image.asset('assets/map.png'),
            ),
          ),
          //"CARD" FRAME

          WidgetBackgroundBox(
            Stack(
              children: <Widget>[
                Background_1(),
                Positioned(
                  left: 35,
                  top: 25,
                  child: Container(
                    width: 343,
                    child: Text(
                      activity.title,
                      softWrap: true,
                      style: Text_Title_Top
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Positioned(
                  left: 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 95),
                      WidgetBox(
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Creat de:  ',
                                  style: Text_Detailed_Page_Regular,
                                ),
                                Text(
                                  activity.author,
                                  style: Text_Detailed_Page_Bold
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Data: ',
                                  style: Text_Detailed_Page_Regular
                                ),
                                Text(
                                  activity.date,
                                  style: Text_Detailed_Page_Bold
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Locatie: ',
                                  style: Text_Detailed_Page_Regular
                                ),
                                Text(
                                  activity.location,
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color_White,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Participanti necesari: ',
                                  style: Text_Detailed_Page_Regular
                                ),
                                Text(
                                  activity.number_participants
                                      .toString(),
                                  style: Text_Detailed_Page_Bold
                                ),
                              ],
                            ),
                          ],
                        ),
                        Color_Blue,
                        Color_Light_Blue,
                      ),
                      SizedBox(height: 10),
                      WidgetBox(
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Descriere: ',
                                style: Text_Detailed_Page_Bold
                              ),
                              Text(
                                activity.descrpition,
                                softWrap: true,
                                style: Text_Detailed_Page_Regular
                              ),
                            ],
                          ),
                          Color_Light_Blue,
                          Color_Blue
                      ),
                      SizedBox(height: 10),
                      WidgetBox(
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/yoda.pfp.jpg'),
                                radius: 45.0,
                              ),
                              SizedBox(width: 10.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Nume: ',
                                        style: Text_Detailed_Page_Bold
                                      ),
                                      Text(
                                        activity.author,
                                        style: Text_Detailed_Page_Bold
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Activitati completate: ',
                                        style: Text_Detailed_Page_Bold
                                      ),
                                      Text(
                                        'TBD',
                                        style: Text_Detailed_Page_Bold
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Color_Blue,
                          Color_Light_Blue
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25,15,25,15),
                        child: Row(
                          children: <Widget>[
                            WidgetButton(
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Join ',
                                    style: Text_Widget_Buttons_Blue
                                  ),
                                  Icon(
                                    Icons.add_circle,
                                    color: Color_Light_Blue,
                                  )
                                ],
                              ),
                              Color_Dark_Gray,
                            ),
                            SizedBox(width: 20.0),
                            WidgetButton(
                              Center(
                                child: Text(
                                  "I'm interested",
                                  style: Text_Widget_Buttons_Blue
                                ),
                              ),
                              Color_Dark_Gray,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
