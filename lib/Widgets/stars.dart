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
      itemSize: 32.0,
      itemBuilder: (context, _) => const Icon(
        Icons.star_rounded,
        color: Color(0xff1a1a1a),
      ),
      updateOnDrag: false,
      onRatingUpdate: (_) {  },
    );
  }
}
