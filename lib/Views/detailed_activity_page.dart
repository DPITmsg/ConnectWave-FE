import 'package:flutter/material.dart';
import 'package:my_project/Views/Widgets/WidgetTagsBox.dart';

import 'Classes/Activity.dart';
import 'Styles/Colors.dart';
import 'Styles/StyleText.dart';
import 'Widgets/WidgetBackgroundBox.dart';
import 'Widgets/WidgetBox.dart';
import 'Widgets/WidgetButtons.dart';

// Activity activity = Activity(
//     title: 'Football la Baza Sportiva Gheorgheni',
//     author: 'Zdroba Petru',
//     date: '26.07.2023',
//     end_date: '26.07.2023',
//     location: 'Str. Alexandru Vaida Voievod nr. 24',
//     number_participants: 14,
//     descrpition:
//         'Caut oameni din zona Gheorgheni cu care sa ies la un footbal, nu conteaza daca esti bun, numai sa fii sociabil',
//     author_id: ' ',
//     tags: ['Football', 'Messi', 'Ronaldo', 'fun', 'chill'],
//     category: 'Sport',
//     time: '10:00');

class detailed_activity_page extends StatelessWidget {

  final Activity activity;

  const detailed_activity_page(this.activity, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(children: <Widget>[
           Column(
              children: [Image.asset('assets/map.png'), const SizedBox()],
            ),
          WidgetBackgroundBox(
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(activity.title, softWrap: true, style: Text_Title_Top),
                  Expanded(
                    flex: 7,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.location_pin),
                                Text(activity.location,
                                    softWrap: true,
                                    style: Text_Detailed_Page_Bold_Black),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.calendar_month_rounded),
                                    Text(
                                      activity.date,
                                      style: Text_Detailed_Page_Bold_Black,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.access_time_filled),
                                    Text(
                                      activity.time,
                                      style: Text_Detailed_Page_Bold_Black,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.category_sharp),
                                    Text(
                                      activity.category,
                                      style: Text_Detailed_Page_Bold_Black,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.person_rounded),
                                    Text(
                                      activity.number_participants.toString(),
                                      style: Text_Detailed_Page_Bold_Black,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Description:',
                              style: Text_Detailed_Page_Bold_Black,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Text(
                                activity.descrpition,
                                softWrap: true,
                                style: Text_Detailed_Page_Regular_Medium_Black,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Wrap(
                                spacing: 8,
                                children: activity.tags.map((tag) {
                                  return WidgetTagsBox(Text(
                                    tag,
                                    style: Text_Tag_Widget,
                                  ));
                                }).toList(),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Created by:',
                              style: Text_Detailed_Page_Bold_Black,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            WidgetBox(
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const CircleAvatar(
                                      backgroundImage:
                                      AssetImage('assets/yoda.pfp.jpg'),
                                      radius: 45.0,
                                    ),
                                    const SizedBox(width: 10.0),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                                'Name: ',
                                                style: Text_Detailed_Page_Bold_White
                                            ),
                                            Text(
                                                activity.author,
                                                style: Text_Detailed_Page_Bold_White
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                'Activities completed: ',
                                                style: Text_Detailed_Page_Bold_White
                                            ),
                                            Text(
                                                'TBD',
                                                style: Text_Detailed_Page_Bold_White
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
                                  Text('Join ',
                                      style: Text_Widget_Buttons_Blue),
                                  const Icon(
                                    Icons.add_circle,
                                    color: Color_Light_Blue,
                                  )
                                ],
                              ),
                            ),
                            Color_Dark_Gray,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: WidgetButton(
                            Center(
                              child: Text("I'm interested",
                                  style: Text_Widget_Buttons_Blue),
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
