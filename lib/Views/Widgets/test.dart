import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  late RangeValues values;

  @override
  void initState() {
    super.initState();
    values = RangeValues(0.0, 50.0); // Change the initial values as needed.
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
                child: RangeSlider(
                  values: values,
                  onChanged: (RangeValues newRange) {
                    setState(() {
                      print('New Range: $newRange');
                      values = newRange; // Update the widget's values
                    });
                  },
                  min: 0.0,
                  max: 50.0,
                  divisions: 10,
                  labels: RangeLabels('${values.start}', '${values.end}'),
                ),
              );
            },
          );
        },
        child: Text("Click me"),
      ),
    );
  }
}
