import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/contants.dart';

class StoreRating extends StatelessWidget {
  final double score;
  const StoreRating({
    Key key,
    this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 7),
            blurRadius: 20,
            color: kShadowColor,
          )
        ],
      ),
      child: Column(
        children: [
          Icon(
            Icons.star,
            color: Colors.amber,
            size: 15,
          ),
          SizedBox(height: 5),
          Text(
            "$score",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
