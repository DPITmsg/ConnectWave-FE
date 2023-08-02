import 'package:dpit_connect_wave/Views/Widgets/WidgetBackgroundBox.dart';
import 'package:flutter/material.dart';
import 'Widgets/WidgetBox.dart';
import 'Widgets/WidgetButtons.dart';
import 'Classes/Activity.dart';

Activity activity = Activity(
    title: 'Football la Baza Sportiva Gheorgheni',
    author: 'Zdroba Petru',
    date: '26.07.2023',
    location: 'Str. Alexandru Vaida Voievod nr. 24',
    number_participants: 14,
    descrpition:
        'Caut oameni din zona Gheorgheni cu care sa ies la un footbal, nu conteaza daca esti bun, numai sa fii sociabil',
    creator_id: 666);

class detailed_activity extends StatelessWidget {
  const detailed_activity({super.key});

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
              child: Image.asset('Assets/map.png'),
            ),
          ),
          //"CARD" FRAME

          WidgetBackgroundBox(
            Stack(
              children: <Widget>[
                Positioned(
                  left: 35,
                  top: 35,
                  child: Text(
                    activity.title,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: Color(0xFF1a1a1a),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Positioned(
                  left: 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 85),
                      WidgetBox(
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Creat de:  ',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  activity.author,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Data: ',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  activity.date,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Locatie: ',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  activity.location,
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Participanti necesari: ',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  activity.number_participants
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Color(0xFF45bac4),
                        Color(0xFF81dbe3),
                      ),
                      SizedBox(height: 20),
                      WidgetBox(
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Descriere: ',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                activity.descrpition,
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Color(0xFF81dbe3),
                          Color(0xFF45bac4)),
                      SizedBox(height: 20),
                      WidgetBox(
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('Assets/yoda.pfp.jpg'),
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
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        activity.author,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Activitati completate: ',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'TBD',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Color(0xFF45bac4),
                          Color(0xFF81dbe3)),
                      SizedBox(height: 18.0),
                      Row(
                        children: <Widget>[
                          WidgetButton(
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Join ',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF81dbe3),
                                  ),
                                ),
                                Icon(
                                  Icons.add_circle,
                                  color: Color(0xFF81dbe3),
                                )
                              ],
                            ),
                            Color(0xFF1a1a1a),
                          ),
                          SizedBox(width: 20.0),
                          WidgetButton(
                            Center(
                              child: Text(
                                "I'm interested",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF81dbe3)),
                              ),
                            ),
                            Color(0xFF1a1a1a),
                          ),
                        ],
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
