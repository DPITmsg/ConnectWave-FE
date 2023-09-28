import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_project/Views/detailed_activity_page.dart';
import 'Styles/Colors.dart';
import '../darius_mock_models/remote_service_list_objects.dart';
import 'Classes/activitydetails.dart';
import 'Styles/Colors.dart';
import 'Widgets/loadingscreen.dart';
import 'Classes/User.dart';

int cnt = 0;

class SearchActivityMap extends StatefulWidget {
  LatLng locationTarget;
  double zoomLevel;
  User user;

  SearchActivityMap({Key? key, required this.locationTarget, required this.zoomLevel, required this.user})
      : super(key: key);

  @override
  State<SearchActivityMap> createState() => _SearchActivityMapState();
}

class _SearchActivityMapState extends State<SearchActivityMap> {
  Map<String, ActivityDetails> _markerActivityMap = {};
  Map<String, Marker> _markers = {};
  List<ActivityDetails> activities = [];
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController _searchController = TextEditingController();
  BitmapDescriptor customIcon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);
  BitmapDescriptor defaultIcon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);


  Future<void> getData() async {
    final activityData = await fetchEventData();
    activities = activityFromJson(json.encode(activityData)).where((activity) => parseDate(activity.date).isAfter(DateTime.now())).toList();

  }

  void _onBackPressed() {
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoadingScreenPage()));
  }

  DateTime parseDate(String input){
    try {
      String day, month, year;
      List<String> list = [];
      int index = 0;

      for (var i = 0; i < input.length; i++){
        if(i == input.length - 1){
          list.add(input.substring(index, i + 1));
          break;
        }
        else if (input[i] == '-'){
          list.add(input.substring(index, i));
          index = i + 1;
        }
      }

      for (var i = 0; i < list.length; i++) {
        print(list[i]);
      }

      String newString = list[2] + '-' + list[1] + '-' + list[0];
      print(newString);

      return DateTime.parse(newString);
    } catch (e) {
      return DateTime(0, 0, 0);
    }
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: PreferredSize(preferredSize: const Size.fromHeight(0), child: AppBar(elevation: 0, backgroundColor: const Color(0x44000000),),),
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: PreferredSize(preferredSize: const Size.fromHeight(0), child: AppBar(elevation: 0, backgroundColor: const Color(0x44000000),),),
            body: Center(child: Text("Error loading data")),
          );
        } else {
          return buildMainScreen();
        }
      },
    );
  }

  Widget buildMainScreen() {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(0), child: AppBar(elevation: 0, backgroundColor: const Color(0x44000000),),),
      body: Stack(
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: widget.locationTarget,
              zoom: widget.zoomLevel,
            ),
            onMapCreated: (GoogleMapController controller) {
              if (!_controller.isCompleted) {
                _controller.complete(controller);
                addMarker(activities, controller);
              }
            },
            markers: _markers.values.toSet(),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: InkWell(
                  onTap: (){
                    _onBackPressed();
                    },
                  child: CircleAvatar(
                    backgroundColor: Color_Blue,
                    child: Icon(
                      Icons.arrow_back,
                      color: Color_White,
                    ),
                  ),
                ),
              ),
              Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    controller: _searchController,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        hintText: ('Search Activity'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                    ),
                    onChanged: (value){
                      print(value);
                    },
                  ),
                ),
              )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                child: CircleAvatar(
                  backgroundColor: Color_Blue,
                  child: IconButton(
                    color: Color_White,
                    onPressed: () async {
                      var userInput = _searchController.text;
                      searchAndDisplayMarkers(userInput);
                    },
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<ActivityDetails> detectFriend(){
    List<ActivityDetails> toReturn = [];

    for (var i = 0; i < activities.length; i++){
      if (widget.user.friends.contains(activities[i].author)){
        toReturn.add(activities[i]);
      }
    }

    return toReturn;
  }




  Future<void> _goToPlace(Map<String, dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];

    GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat,lng), zoom: 12)));
  }

  void addMarker(List<ActivityDetails> activityList, GoogleMapController controller) {
    _markers.clear();
    _markerActivityMap.clear();

    if (activities.isNotEmpty) {

      for (var i = 0; i < activities.length; i++){
        var activity = activityList[i];
        BitmapDescriptor markerIcon = defaultIcon;
        String authorName = activity.author;

        if (widget.user.friends.any((friend) => friend.name == authorName)) {
          markerIcon = customIcon;
        }

        var marker = Marker(
          markerId: MarkerId(cnt.toString()),
          position: activityList[i].location,
          icon: markerIcon,
          infoWindow: InfoWindow(
            title: activityList[i].title,
            snippet: activityList[i].address,
            onTap: () {_onMarkerTapped(activityList[i]);},
          ),
        );

        _markers[cnt.toString()] = marker;
        cnt++;
        setState(() {});
      }

    } else {
      _markers.clear();
      setState(() {});
    }
  }

  void _onMarkerTapped(ActivityDetails activity) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => detailed_activity_page(activity, widget.user)));
  }

  List<ActivityDetails> searchActivity(List<ActivityDetails> list, String userInput){
    List<ActivityDetails> results = [];

    for (var i = 0; i < list.length; i++){
      if(list[i].title.toLowerCase().contains(userInput.toLowerCase())){
        results.add(list[i]);
      }
    }
    return results;
  }

  void searchAndDisplayMarkers(String userInput) async {
    final controller = await _controller.future;
    List<ActivityDetails> filteredActivities = searchActivity(activities, userInput);

    if (filteredActivities.isNotEmpty) {
      addMarker(filteredActivities, controller);
    } else {
      _markers.clear(); // Clear the markers if there are no filtered activities
      setState(() {});
    }
  }

}

