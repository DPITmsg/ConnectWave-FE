import 'package:flutter/material.dart';

class SearchBarMenu extends StatelessWidget {
  const SearchBarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: SizedBox(
        width: screenWidth*0.8,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            suffixIcon: Icon(Icons.search, color: Color(0xff1a1a1a),)
          ),
        ),
      ),
    );
  }
}
