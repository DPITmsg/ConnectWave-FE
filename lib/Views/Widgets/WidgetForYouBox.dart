import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_project/Service/activity_service.dart';
import 'package:my_project/Views/Classes/RecommendedActivity.dart';
import 'package:my_project/Views/Styles/Colors.dart';

import '../Styles/StyleText.dart';

bool didJoin = false;

class WidgetBoxForYou extends StatefulWidget {
  final RecommendedActivity activity;
  final String username;

  const WidgetBoxForYou(this.activity, this.username, {super.key});

  @override
  State<WidgetBoxForYou> createState() => _WidgetBoxForYouState();
}

class _WidgetBoxForYouState extends State<WidgetBoxForYou> {
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
                child: Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.36,
                      child: GoogleMap(
                        zoomGesturesEnabled: false,
                        zoomControlsEnabled: false,
                        rotateGesturesEnabled: false,
                        scrollGesturesEnabled: false,
                        initialCameraPosition: CameraPosition(
                            target: LatLng(widget.activity.location.latitude,
                                widget.activity.location.longitude),
                            zoom: 14),
                        markers: {
                          Marker(
                              markerId: const MarkerId('1'),
                              position: LatLng(widget.activity.location.latitude,
                                  widget.activity.location.longitude))
                        },
                      ),
                    ),
                    Container(
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
                                  padding: const EdgeInsets.only(
                                      right: 10, bottom: 5),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      widget.activity.address,
                                      style: Text_Widget_ForYou_Normal_Blue,
                                    ),
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
                                        Text(widget.activity.title,
                                            style:
                                                Text_Widget_ForYou_Bold_White),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.person,
                                              color: Color_White,
                                            ),
                                            Text(
                                                widget.activity.nr_participants
                                                    .toString(),
                                                style:
                                                    Text_Widget_ForYou_Normal_White),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(widget.activity.author,
                                        style: Text_Widget_ForYou_Normal_White)
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: InkWell(
                    onTap: () async {
                      final response = await joinActivity(widget.activity.id,widget.username);
                      if(response.body == 'true'){
                        didJoin = true;
                      }
                      setState(() {});
                    },
                    child: Container(
                decoration: BoxDecoration(
                      color: Color_Dark_Gray,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(35),
                          bottomRight: Radius.circular(35)),
                      border: Border.all(color: didJoin== false ?Color_Light_Blue: Colors.green, width: 1)),
                child: Center(
                      child: Transform.rotate(
                    angle: -90 * (3.14159265359 / 180),
                    child: Text(
                      didJoin == false ?'Join': 'Joined',
                      style: didJoin == false ?Text_Join_ForYou: Text_Join_ForYou_Green,
                    ),
                )),
              ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
