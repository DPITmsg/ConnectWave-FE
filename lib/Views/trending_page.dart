import 'package:dpit_connect_wave/Views/Classes/Trending.dart';
import 'package:flutter/material.dart';

import 'Widgets/WidgetBoxSlice.dart';
import 'Widgets/WidgetButtons.dart';

List<Trending> trending = [
  Trending(
      title: 'Most popular this week',
      category: 'Basketball',
      stat_1: '90 people searched this',
      stat_2: '3 friends created',
      image_url:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp6pmKGcuA2oxkee0DfbjCtGmndjt6T9hoMQ&usqp=CAU'),
  Trending(
      title: 'Old people liked',
      category: 'Gardening',
      stat_1: 'asdasdasd',
      stat_2: 'aghfugsdfa',
      image_url:
          'https://ca-times.brightspotcdn.com/dims4/default/c8f0d3e/2147483647/strip/true/crop/1800x1013+0+0/resize/1200x675!/quality/80/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Ff5%2F33%2F417fa05141e394041be1e7fe9813%2Fgardening-clip-art-adobe-stock.jpg'),
  Trending(
      title: 'Most popular this week',
      category: 'Basketball',
      stat_1: '90 people searched this',
      stat_2: '3 friends created',
      image_url:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp6pmKGcuA2oxkee0DfbjCtGmndjt6T9hoMQ&usqp=CAU'),
  Trending(
      title: 'Old people liked',
      category: 'Gardening',
      stat_1: 'asdasdasd',
      stat_2: 'aghfugsdfa',
      image_url:
      'https://ca-times.brightspotcdn.com/dims4/default/c8f0d3e/2147483647/strip/true/crop/1800x1013+0+0/resize/1200x675!/quality/80/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Ff5%2F33%2F417fa05141e394041be1e7fe9813%2Fgardening-clip-art-adobe-stock.jpg'),
  Trending(
      title: 'Most popular this week',
      category: 'Basketball',
      stat_1: '90 people searched this',
      stat_2: '3 friends created',
      image_url:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp6pmKGcuA2oxkee0DfbjCtGmndjt6T9hoMQ&usqp=CAU'),
  Trending(
      title: 'Old people liked',
      category: 'Gardening',
      stat_1: 'asdasdasd',
      stat_2: 'aghfugsdfa',
      image_url:
      'https://ca-times.brightspotcdn.com/dims4/default/c8f0d3e/2147483647/strip/true/crop/1800x1013+0+0/resize/1200x675!/quality/80/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Ff5%2F33%2F417fa05141e394041be1e7fe9813%2Fgardening-clip-art-adobe-stock.jpg')
];

class trending_activity extends StatelessWidget {
  const trending_activity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFc9cfcf),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 20, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trending',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1a1a1a),
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 660,
                child: SingleChildScrollView(
                  child: Column(
                    children: trending.map((element) {
                      return WidgetBoxSlice(element);
                    }).toList(),
                  ),
                ),
              ),
              Row(
                children: [
                  WidgetButton(
                      Center(
                        child: Text(
                          'Friends Top',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Color(0xFF45bac4)),
                  SizedBox(width: 20.0),
                  WidgetButton(
                      Center(
                        child: Text(
                          'Explore more',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Color(0xFF45bac4)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
