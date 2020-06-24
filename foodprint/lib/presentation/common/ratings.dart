
import 'package:flutter/material.dart';

extension Ratings on double {

  Row get ratingsWidget {
    final rating = this;
    final List<Widget> ratings = [
      Text(
        rating.toString(),
        style: const TextStyle(
            fontSize: 16,
            color: Colors.grey
        ),
      ),
      const SizedBox(width: 5.0,)
    ];
    for (int i = 0; i < 5; ++i) {
      if (rating - i >= 1) { // full star
        ratings.add(
            const Icon(
              Icons.star,
              color: Colors.orange,
            )
        );
      } else if (rating > i) { // half star
        ratings.add(
            const Icon(
                Icons.star_half,
                color: Colors.orange
            )
        );
      } else { // no star
        ratings.add(
            const Icon(
              Icons.star_border,
              color: Colors.orange,
            )
        );
      }
    }
    return Row(
      children: ratings,
    );
  }
}