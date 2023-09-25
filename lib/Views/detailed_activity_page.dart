import 'package:flutter/material.dart';
import 'package:my_project/Views/Widgets/WidgetTagsBox.dart';

import 'Classes/activitydetails.dart';
import 'Styles/Colors.dart';
import 'Styles/StyleText.dart';
import 'Widgets/WidgetBackgroundBox.dart';
import 'Widgets/WidgetBox.dart';
import 'Widgets/WidgetButtons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class detailed_activity_page extends StatefulWidget {
  final ActivityDetails activity;

  const detailed_activity_page(this.activity, {super.key});

  @override
  State<detailed_activity_page> createState() => _detailed_activity_pageState();
}

class _detailed_activity_pageState extends State<detailed_activity_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height*0.35,
            child: GoogleMap(
              zoomGesturesEnabled: false,
              zoomControlsEnabled: false,
              rotateGesturesEnabled: false,
              scrollGesturesEnabled: false,
              initialCameraPosition: CameraPosition(target: LatLng(widget.activity.location.latitude, widget.activity.location.longitude), zoom: 14),
              markers: {
                Marker(markerId: const MarkerId('xman-zdroba'), position: LatLng(widget.activity.location.latitude, widget.activity.location.longitude))
              },
            ),
          ),
          WidgetBackgroundBox(
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(widget.activity.title, softWrap: true, style: Text_Title_Top),
                  Expanded(
                    flex: 7,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  const Icon(Icons.location_pin),
                                  Text(widget.activity.address,
                                      style: Text_Detailed_Page_Bold_Black),
                                ],
                              ),
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
                                      widget.activity.date == widget.activity.endDate ? widget.activity.date : '${widget.activity.date}     ${widget.activity.endDate}',
                                      style: Text_Detailed_Page_Bold_Black,
                                    ),
                                  ],
                                ),

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
                                    const Icon(Icons.access_time_filled),
                                    Text(
                                      widget.activity.time,
                                      style: Text_Detailed_Page_Bold_Black,
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    const Icon(Icons.category_sharp),
                                    Text(
                                      widget.activity.category,
                                      style: Text_Detailed_Page_Bold_Black,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.person_rounded),
                                    Text(
                                      widget.activity.nrParticipants.toString(),
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
                                widget.activity.description,
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
                                children: widget.activity.tags.map((tag) {
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
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Text('Name: ',
                                                style:
                                                Text_Detailed_Page_Bold_White),
                                            Text(widget.activity.author,
                                                style:
                                                Text_Detailed_Page_Bold_White),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text('Activities completed: ',
                                                style:
                                                Text_Detailed_Page_Bold_White),
                                            Text('TBD',
                                                style:
                                                Text_Detailed_Page_Bold_White),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Color_Blue,
                                Color_Light_Blue),
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
                        const Expanded(
                          child: SizedBox()
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