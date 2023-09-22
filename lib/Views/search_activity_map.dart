import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_project/Views/detailed_activity_page.dart';

import '../darius_mock_models/remote_service_list_objects.dart';
import 'Classes/activitydetails.dart';
import 'Styles/Colors.dart';


int cnt = 0;

class SearchActivityMap extends StatefulWidget {
  LatLng locationTarget;
  double zoomLevel;

  SearchActivityMap({Key? key, required this.locationTarget, required this.zoomLevel})
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
  Future<void> getData() async {
    final activityData = await fetchEventData();
    activities = activityFromJson(json.encode(activityData));
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: PreferredSize(preferredSize: const Size.fromHeight(0), child: AppBar(elevation: 0, backgroundColor: const Color(0x44000000),),),
            body: Center(child: CircularProgressIndicator()), // Show loading indicator
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: PreferredSize(preferredSize: const Size.fromHeight(0), child: AppBar(elevation: 0, backgroundColor: const Color(0x44000000),),),
            body: Center(child: Text("Error loading data")), // Show error message
          );
        } else {
          return buildMainScreen(); // Build the main UI
        }
      },
    );
  }

  Widget buildMainScreen() {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(0), child: AppBar(elevation: 0, backgroundColor: const Color(0x44000000),),),
      body: Stack(
        children: [
          Expanded(
            flex: 7,
            child: GoogleMap(
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
          ),
          Row(
            children: [
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
                  child: IconButton(
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
        var marker = Marker(
          markerId: MarkerId(cnt.toString()),
          position: activityList[i].location,
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
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => detailed_activity_page(activity)));
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

