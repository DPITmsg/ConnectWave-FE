import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../darius_mock_models/remote_service_list_objects.dart';
import 'Styles/Colors.dart';
import 'Widgets/filters_search_activity.dart';
import 'Classes/activitydetails.dart';
import 'Widgets/containersearchactivity.dart';
import 'Widgets/fliters_search_activity_slider.dart';

class SearchActivityOnlinePage extends StatefulWidget {
  const SearchActivityOnlinePage({super.key});

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

  List<String> categories = ['Sports', 'Gaming', 'Services', 'Other'];
  List<String> nrParticipants = [];

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



  List<ActivityDetails> getFilteredActivities() {
    final filteredByCategory = activities!
        .where((activity) =>
    (categorySelected.isEmpty || activity.category == categorySelected))
        .toList();

    final filteredByNrParticipants = filteredByCategory.where((activity) => activity.nrParticipants.toInt() > nrParticipantsSelected.start.toInt() && activity.nrParticipants.toInt() < nrParticipantsSelected.end.toInt());

    final filteredBySearch = filteredByNrParticipants
        .where((activity) =>
        activity.title
            .toLowerCase()
            .contains(_searchController.text.toLowerCase()))
        .toList();

    return filteredBySearch;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(40, 40),
        child: AppBar(
          title: Text('SearchActivity'),
        ),
      ),
      body: Container(
        color: Color_Gray,
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: (_) {
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: 'Search by title',
              ),
            ),
            Row(
              children: [
                FilterPressAction(categorySelected, categories, _onCategorySelected, "Categories"),
                FilterPressSliderAction(nrParticipantsSelected, 0.0, 50.0, _onNrParticipantsSelected, "Number of Participants")
              ],
            ),
            Expanded(
              child: ListView.separated(
                itemCount: getFilteredActivities().length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  ActivityDetails activity = getFilteredActivities()[index];
                  return ContainerActivityForSearch(activity);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


