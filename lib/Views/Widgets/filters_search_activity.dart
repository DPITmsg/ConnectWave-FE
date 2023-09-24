import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Classes/activitydetails.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FilterPressAction extends StatefulWidget {
  String text;
  List<String> options;
  Function(String) onCategorySelected;
  String displayTo;

  FilterPressAction(this.text, this.options, this.onCategorySelected, this.displayTo);

  @override
  State<FilterPressAction> createState() => _FilterPressActionState();
}

class _FilterPressActionState extends State<FilterPressAction> {

  String getDisplayText() {
    return widget.text.isNotEmpty ? widget.text : widget.displayTo;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      child: TextButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: screenHeight / 2,
                child: ListView.builder(
                  itemCount: widget.options.length,
                  itemBuilder: (context, index) {
                    String textSelect = widget.options[index];
                    return Container(
                      child: TextButton(
                          onPressed: () {
                            widget.onCategorySelected(textSelect);
                            Navigator.pop(context);
                          },
                          child: Center(child: Text(textSelect))),
                    );
                  },
                ),
              );
            },
          );
        },
        child: Text(getDisplayText()),
      ),
    );
  }
}

