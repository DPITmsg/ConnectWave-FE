import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_project/Views/Styles/Colors.dart';

class InteractiveStars extends StatefulWidget {
  const InteractiveStars({Key? key});

  @override
  _InteractiveStarsState createState() => _InteractiveStarsState();
}

class _InteractiveStarsState extends State<InteractiveStars> {
  double ratingvar = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RatingBar.builder(
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Color_Gray,
          ),
          onRatingUpdate: (rating) {
            setState(() {
              ratingvar = rating;
            });
            print(ratingvar);
          },
        ),
      ],
    );
  }
}
