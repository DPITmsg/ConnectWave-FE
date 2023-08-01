import 'package:flutter/material.dart';
import 'Widgets/WidgetBoxSlice.dart';
import 'Widgets/WidgetButtons.dart';

class trending_activity extends StatelessWidget {
  const trending_activity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFc9cfcf),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 20, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trending',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1a1a1a),
                  decoration: TextDecoration.underline,
                ),
              ),

              SizedBox(height: 10.0),
              WidgetBoxSlice(
                Text(
                  'TBD',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),

              SizedBox(height: 10.0),
              WidgetBoxSlice(
                Text(
                  'TBD',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),

              SizedBox(height: 10.0),
              WidgetBoxSlice(
                Text(
                  'TBD',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),

              SizedBox(height: 10.0),
              WidgetBoxSlice(
                Text(
                  'TBD',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),

              SizedBox(height: 10.0),
              WidgetBoxSlice(
                Text(
                  'TBD',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),

              SizedBox(height: 10.0),
              Row(
                children: [
                  WidgetButton(
                    Center(
                      child: Text(
                        'Friends Top',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Color(0xFF45bac4)
                  ),
                  SizedBox(width: 20.0),
                  WidgetButton(
                      Center(
                        child: Text(
                          'Explore more',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Color(0xFF45bac4)
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
