import 'package:flutter/material.dart';
import 'package:my_project/Views/Classes/RecommendedActivity.dart';
import 'package:my_project/Views/Styles/Colors.dart';

import '../Styles/StyleText.dart';

class WidgetBoxForYou extends StatelessWidget {
  final RecommendedActivity activity;

  const WidgetBoxForYou(this.activity, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 15, 5, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: const BoxDecoration(
            color: Color_Dark_Gray,
          ),
          child: Row(
            children: [
              Expanded(
                  flex: 5,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.amberAccent,
                        image: DecorationImage(
                            image: AssetImage('assets/map.png'),
                            fit: BoxFit.fill)),
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: [0.35, 1.0],
                              colors: [Color_Dark_Gray, Colors.transparent])),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 2,
                              child: SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10,bottom: 5),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(activity.address, style: Text_Widget_ForYou_Normal_Blue,),
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 10, bottom: 2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(activity.title,
                                            style:
                                                Text_Widget_ForYou_Bold_White),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.person,
                                              color: Color_White,
                                            ),
                                            Text(
                                                activity.nr_participants
                                                    .toString(),
                                                style:
                                                    Text_Widget_ForYou_Normal_White),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(activity.author,
                                        style: Text_Widget_ForYou_Normal_White)
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  )),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    color: Color_Dark_Gray,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(35),
                        bottomRight: Radius.circular(35)),
                    border: Border.all(color: Color_Light_Blue, width: 1)),
                child: Center(
                    child: Transform.rotate(
                  angle: -90 * (3.14159265359 / 180),
                  child: Text(
                    'Join',
                    style: Text_Join_ForYou,
                  ),
                )),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
