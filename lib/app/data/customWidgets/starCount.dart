import 'package:flutter/material.dart';

Widget starRating(int count) {
  List<Widget> stars = [];

  // Add filled stars
  for (int i = 0; i < count; i++) {
    stars.add(
      Icon(
        Icons.star,
        color: Colors.amber,
        size: 16,
      ),
    );
  }

  // Add empty stars (if less than 5)
  for (int i = count; i < 5; i++) {
    stars.add(
      Icon(
        Icons.star_border,
        color: Colors.amber,
        size: 16,
      ),
    );
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: stars,
  );
}
