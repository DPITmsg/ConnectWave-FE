import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../darius_mock_models/remote_service_list_objects.dart';
import 'Styles/Colors.dart';
import 'Widgets/filters_search_activity.dart';
import 'Classes/activitydetails.dart';
import 'Widgets/containersearchactivity.dart';
import 'Widgets/fliters_search_activity_slider.dart';
import 'Widgets/loadingscreen.dart';
import 'Classes/User.dart';


class SearchActivityOnlinePage extends StatefulWidget {
  final User user;

  const SearchActivityOnlinePage({super.key, required this.user});

  @override
  State<SearchActivityOnlinePage> createState() =>
      _SearchActivityOnlinePageState();
}

class _SearchActivityOnlinePageState extends State<SearchActivityOnlinePage> {
  List<ActivityDetails>? activities = [];
  late TextEditingController _searchController;

  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
    _searchController = TextEditingController();
  }

  getData() async {
    final activityData = await fetchEventData();

    setState(() {
      activities = activityFromJson(json.encode(activityData));
      isLoaded = true;
    });
  }

  void _onBackPressed() {
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoadingScreenPage()));
  }

  List<String> categories = ['Sports', 'Gaming', 'Services', 'Other'];
  List<String> dates = ["tomorrow", "in the next three days", "in the next 7 days", "in the next 30 days", "all"];

  String dateSelected = '';
  String categorySelected = '';
  RangeValues nrParticipantsSelected = RangeValues(0.0, 50.0);

  void _onCategorySelected(String selectedCategory) {
    setState(() {
      categorySelected = selectedCategory;
    });
  }

  void _onNrParticipantsSelected(RangeValues selectedRange) {
    setState(() {
      nrParticipantsSelected = selectedRange;
    });
  }

  void _onDateSelected(String selectedDate){
    setState(() {
      dateSelected = selectedDate;
    });
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


  DateTime dateConversion(String input){
    DateTime today = DateTime.now();

    if (input == "tomorrow"){
      return today.add(Duration(days:1));
    }
    else if(input == "in the next three days"){
      return today.add(Duration(days:3));
    }
    else if(input == "in the next 7 days"){
      return today.add(Duration(days:7));
    }
    else if(input == "in the next 30 days"){
      return today.add(Duration(days: 30));
    }
    else{
      return DateTime(2006, 08, 07);
    }
  }

  List<ActivityDetails> getFilteredActivities() {
    final filteredByCategory = activities!
        .where((activity) =>
    (categorySelected.isEmpty || activity.category == categorySelected))
        .toList();

    final filteredByNrParticipants = filteredByCategory.where((activity) =>
    activity.participants.length.toInt() >= nrParticipantsSelected.start.toInt() &&
        activity.participants.length.toInt() <= nrParticipantsSelected.end.toInt());

    DateTime targetDate = dateConversion(dateSelected);

    final filteredByDate = filteredByNrParticipants.where((activity) {
      DateTime activityDate = parseDate(activity.date);
      print("$activityDate + $targetDate");
      return activityDate.isBefore(targetDate) || targetDate == DateTime(2006, 08, 07);
    }).toList();


    final filteredBySearch = filteredByDate
        .where((activity) =>
        activity.title.toLowerCase().contains(_searchController.text.toLowerCase()))
        .toList();

    return filteredBySearch;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color_Blue,
        title: Text('Search Activity'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            _onBackPressed();
          },
        ),
      ),
      body: Container(
        color: Color_Gray,
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
              child: TextField(
                controller: _searchController,
                onChanged: (_) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  hintText: 'Search by title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilterPressAction(categorySelected, categories, _onCategorySelected, "Categories"),
                FilterPressSliderAction(nrParticipantsSelected, 0.0, 50.0, _onNrParticipantsSelected, "Nr Participants"),
                FilterPressAction(dateSelected, dates, _onDateSelected, 'Happening in')
              ],
            ),
            Expanded(
              child: Visibility(
                visible: isLoaded,
                replacement: Center(child: CircularProgressIndicator(),),
                child: ListView.separated(
                  itemCount: getFilteredActivities().length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) {
                    ActivityDetails activity = getFilteredActivities()[index];
                    return ContainerActivityForSearch(activity, widget.user);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


