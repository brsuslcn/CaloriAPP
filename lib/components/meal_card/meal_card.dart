import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  const MealCard({super.key, required this.cardTitle, required this.imageURl});
  final String? imageURl;
  final String? cardTitle;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.network(imageURl!),
          ),
          Text(cardTitle!)
        ],
      ),
    );
  }
}
