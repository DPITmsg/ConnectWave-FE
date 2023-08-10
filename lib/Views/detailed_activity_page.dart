import 'package:flutter/material.dart';

import 'Classes/Activity.dart';
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
                  Text(activity.title, softWrap: true, style: Text_Title_Top),

                  Expanded(
                    flex: 7,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child: Container(
                        child: Column(
                          children: [
                            Expanded(
                                child:WidgetBox(
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
                              ),

                            Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                                  child: WidgetBox(
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
                              ),
                            ),

                            Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                                  child: WidgetBox(
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
                              ),
                            ),
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
                                      style: Text_Widget_Buttons_Blue
                                  ),
                                  Icon(
                                    Icons.add_circle,
                                    color: Color_Light_Blue,
                                  )
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
                                  style: Text_Widget_Buttons_Blue
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
        ]),
      ),
    );
  }
}
