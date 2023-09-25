import 'package:flutter/material.dart';
import 'package:my_project/Views/Classes/RecommendedActivity.dart';
import 'package:my_project/Views/Widgets/WidgetForYouBox.dart';

import 'Styles/Colors.dart';
import 'Styles/StyleText.dart';


class for_you_page extends StatefulWidget {

  final List<RecommendedActivity> activity_list;
  final String username;

  const for_you_page(this.activity_list, this.username, {super.key});

  @override
  State<for_you_page> createState() => _for_you_pageState();
}

class _for_you_pageState extends State<for_you_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'lib/Views/Styles/Backgrounds/Background_3.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 30, 25, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: InkWell(
                          child: const SizedBox(
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Color_Dark_Gray,
                              size: 35,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Text(
                          'For you',
                          style: Text_Title_Top_FriendsList,
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: widget.activity_list.map((activity) {
                        return WidgetBoxForYou(activity,'xman');
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
