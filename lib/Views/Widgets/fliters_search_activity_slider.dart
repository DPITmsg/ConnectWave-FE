import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Styles/Colors.dart';

class FilterPressSliderAction extends StatefulWidget {
  late RangeValues values;
  final double lower;
  final double upper;
  final void Function(RangeValues) onRangeSelected;
  final String displayTo;

  FilterPressSliderAction(
      this.values,
      this.lower,
      this.upper,
      this.onRangeSelected,
      this.displayTo,
      );

  @override
  State<FilterPressSliderAction> createState() =>
      _FilterPressActionSliderState();
}

class _FilterPressActionSliderState extends State<FilterPressSliderAction> {
  String selectedRange = '';

  @override
  void initState() {
    super.initState();
    selectedRange = widget.displayTo;
  }

  void updateSelectedRange(RangeValues newRange) {
    setState(() {
      selectedRange =
      '${newRange.start.toStringAsFixed(2)} - ${newRange.end.toStringAsFixed(2)}';
      widget.onRangeSelected(newRange);
    });
  }

  String getDisplayText() {
    return selectedRange.isNotEmpty ? selectedRange : widget.displayTo;
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
              return StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Container(
                    height: screenHeight / 3,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Select a Range'),
                        ),
                        RangeSlider(
                          values: widget.values,
                          onChanged: (RangeValues newRange) {
                            setState(() {
                              widget.values = newRange;
                              updateSelectedRange(newRange);
                            });
                          },
                          min: widget.lower,
                          max: widget.upper,
                          divisions: 10,
                          labels: RangeLabels(
                            '${widget.values.start}',
                            '${widget.values.end}',
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
        child: Text(selectedRange, style: TextStyle(color: Color_Blue),),
      ),
    );
  }
}
