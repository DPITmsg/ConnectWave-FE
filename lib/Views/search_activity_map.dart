import 'dart:async';
import 'dart:convert';
import 'package:my_project/Views/detailed_activity_page.dart';

import 'Styles/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../darius_mock_models/remote_service_list_objects.dart';
import 'Classes/activitydetails.dart';
import 'package:permission_handler/permission_handler.dart';
import 'Widgets/test.dart';


final LatLng currentLocation = LatLng(46.7712, 23.6236);
final List<LatLng> markerLocation = [LatLng(46.7712, 23.6236), LatLng(46.7702, 23.6236)];
int cnt = 0;

class SearchActivityMap extends StatefulWidget {
  const SearchActivityMap({Key? key}) : super(key: key);

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
      body: Column(
        children: [
          Row(
            children: [
              Expanded(child: TextFormField(
                controller: _searchController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                    hintText: ('Search Activity')
                ),
                onChanged: (value){
                  print(value);
                },
              )),
              IconButton(
                onPressed: () async {
                    var userInput = _searchController.text;
                    searchAndDisplayMarkers(userInput);
                    },
                icon: Icon(Icons.search),
              ),

            ],
          ),
          Expanded(
            flex: 7,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: currentLocation,
                zoom: 14,
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
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(14), topRight: Radius.circular(14)), color: Color_Blue),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailedActivityPage(activity: activities[0])));
                },
                child: Center(
                    child: Text(_searchController.text,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )
                ),
              ),
            ),
          )
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
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailedActivityPage(activity: activity)));
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

