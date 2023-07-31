import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Stars extends StatelessWidget {
  final double rating;

  Stars(this.rating);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      ignoreGestures: true,
      initialRating: rating,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 30.0, // Adjust the size of the stars as per your preference
      itemBuilder: (context, _) => const Icon(
        Icons.star_rounded,
        color: Color(0xff1a1a1a),
      ),
      updateOnDrag: false,
      onRatingUpdate: (_) {  },
    );
  }
}
