import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PersentageWidget extends StatelessWidget {
  const PersentageWidget(
      {super.key,
      required this.color,
      required this.percent,
      required this.ratio});
  final Color color;
  final double percent;
  final String ratio;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: CircularPercentIndicator(
        radius: 45.0,
        lineWidth: 4.0,
        percent: percent,
        center: Text(
          ratio,
          style: TextStyle(color: Colors.white),
        ),
        progressColor: color,
      ),
    );
  }
}
