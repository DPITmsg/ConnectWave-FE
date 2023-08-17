import 'package:flutter/material.dart';
import 'package:my_project/Views/Styles/Colors.dart';

import 'Classes/Trending.dart';
import 'Styles/StyleText.dart';
import 'Widgets/WidgetBoxSlice.dart';
import 'Widgets/WidgetButtons.dart';

List<Trending> trending = [
  Trending(
      title: 'Most popular this week',
      category: 'Basketball',
      stats: ['3 people liked this', '5 friends searched this'],
      image_url:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp6pmKGcuA2oxkee0DfbjCtGmndjt6T9hoMQ&usqp=CAU'),
  Trending(
      title: 'Old people liked',
      category: 'Gardening',
      stats: [
        '300 people went',
        '1k searches this month',
        'avg. rating of 4.5'
      ],
      image_url:
          'https://ca-times.brightspotcdn.com/dims4/default/c8f0d3e/2147483647/strip/true/crop/1800x1013+0+0/resize/1200x675!/quality/80/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Ff5%2F33%2F417fa05141e394041be1e7fe9813%2Fgardening-clip-art-adobe-stock.jpg'),
  Trending(
      title: 'Most popular this week',
      category: 'Basketball',
      stats: ['3 people liked this', '5 friends searched this'],
      image_url:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp6pmKGcuA2oxkee0DfbjCtGmndjt6T9hoMQ&usqp=CAU'),
  Trending(
      title: 'Old people liked',
      category: 'Gardening',
      stats: ['300 people went', '1k searches this month'],
      image_url:
          'https://ca-times.brightspotcdn.com/dims4/default/c8f0d3e/2147483647/strip/true/crop/1800x1013+0+0/resize/1200x675!/quality/80/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Ff5%2F33%2F417fa05141e394041be1e7fe9813%2Fgardening-clip-art-adobe-stock.jpg'),
  Trending(
      title: 'Most popular this week',
      category: 'Basketball',
      stats: ['3 people liked this', '5 friends searched this'],
      image_url:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp6pmKGcuA2oxkee0DfbjCtGmndjt6T9hoMQ&usqp=CAU'),
  Trending(
      title: 'Old people liked',
      category: 'Gardening',
      stats: [
        '300 people went',
      ],
      image_url:
          'https://ca-times.brightspotcdn.com/dims4/default/c8f0d3e/2147483647/strip/true/crop/1800x1013+0+0/resize/1200x675!/quality/80/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Ff5%2F33%2F417fa05141e394041be1e7fe9813%2Fgardening-clip-art-adobe-stock.jpg')
];

class trending_page extends StatelessWidget {
  const trending_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('lib/Views/Styles/Backgrounds/Background_2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 30, 25, 10),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            child: SizedBox(
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: Color_Dark_Gray,
                              ),
                            ),
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Text(
                            'Trending',
                            style: Text_Title_Top,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 12,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: trending.map((element) {
                                return WidgetBoxSlice(element);
                              }).toList(),
                            ),
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
                                child: Text("Close to me",
                                    style: Text_Widget_Buttons_Blue),
                              ),
                              Color_Dark_Gray,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 1,
                            child: WidgetButton(
                              Center(
                                child: Text("Explore more",
                                    style: Text_Widget_Buttons_Blue),
                              ),
                              Color_Dark_Gray,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
