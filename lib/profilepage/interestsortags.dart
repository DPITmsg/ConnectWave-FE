import 'package:flutter/material.dart';

class IntOrTags extends StatelessWidget {
  final String tagOrInt;
  final List<String> elementList;

  IntOrTags(this.tagOrInt, this.elementList);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(tagOrInt, style: TextStyle(fontWeight: FontWeight.bold)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: elementList.map((element) {
                return Container(
                  margin: EdgeInsets.all(8),
                  child: Container(
                    width: 80,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(colors: [Color(0xffFFFFFF), Color(0xffc9cfcf)], stops: [0.3, 0.6], transform: GradientRotation(8)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 2,
                          spreadRadius: 2,
                          offset: Offset(0, 3),
                        )
                      ]
                    ),
                    child: Center(child: Text(element, style: TextStyle(fontWeight: FontWeight.bold),)),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
