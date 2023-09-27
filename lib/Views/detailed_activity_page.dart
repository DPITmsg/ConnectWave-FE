import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_project/Views/Widgets/DisplayParticipants.dart';
import 'package:my_project/Views/Widgets/WidgetTagsBox.dart';

import '../Service/activity_service.dart';
import 'Classes/User.dart';
import 'Classes/activitydetails.dart';
import 'Styles/Colors.dart';
import 'Styles/StyleText.dart';
import 'Widgets/WidgetBackgroundBox.dart';
import 'Widgets/WidgetBox.dart';
import 'Widgets/WidgetButtons.dart';
import 'search_activity_map.dart';

class detailed_activity_page extends StatefulWidget {
  final ActivityDetails activity;
  final User user;

  bool _didJoin = false;

  bool get didJoin => _didJoin;

  setDidJoin(bool value) {
    _didJoin = value;
  }

  detailed_activity_page(this.activity, this.user, {super.key});

  @override
  State<detailed_activity_page> createState() => _detailed_activity_pageState();
}

class _detailed_activity_pageState extends State<detailed_activity_page> {
  get didJoin => widget.didJoin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(children: <Widget>[
          InkWell(
            onDoubleTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchActivityMap(locationTarget: widget.activity.location, zoomLevel: 16, user: widget.user)));
            },
            child: SizedBox(height: MediaQuery.of(context).size.height*0.35,
              child: GoogleMap(
                zoomGesturesEnabled: false,
                zoomControlsEnabled: false,
                rotateGesturesEnabled: false,
                scrollGesturesEnabled: false,
                initialCameraPosition: CameraPosition(target: LatLng(widget.activity.location.latitude, widget.activity.location.longitude), zoom: 14),
                markers: {
                  Marker(markerId: const MarkerId('1'), position: LatLng(widget.activity.location.latitude, widget.activity.location.longitude))
                },
              ),
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
                                    InkWell(
                                        onTap: (){
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => DisplayParticipantsPage(usernames: widget.activity.participants,)));
                                        },
                                        child: const Icon(Icons.person_rounded)
                                    ),
                                    Text(
                                      widget.activity.participants.length.toString(),
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
                          child: InkWell(
                            onTap: () async {
                              final response = await joinActivity(
                                  widget.activity.id, widget.user.username);
                              if (response.body == 'true') {
                                widget.setDidJoin(true);
                              }
                              setState(() {});
                            },
                            child: WidgetButton(
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(didJoin == false ?'Join ': 'Joined',
                                        style: didJoin == false ?Text_Widget_Buttons_Blue : Text_Widget_Buttons_Green),
                                    Icon(
                                      didJoin == false ?Icons.add_circle: Icons.check_circle,
                                      color: didJoin == false ?Color_Light_Blue: Colors.green,
                                    )
                                  ],
                                ),
                              ),
                              Color_Dark_Gray,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
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