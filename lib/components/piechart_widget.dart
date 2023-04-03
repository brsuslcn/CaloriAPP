import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyPieChart extends StatefulWidget {
  const MyPieChart({super.key});

  @override
  State<MyPieChart> createState() => _MyPieChartState();
}

class _MyPieChartState extends State<MyPieChart> {
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      GlobalKey<AnimatedCircularChartState>();

  List<CircularStackEntry> data = <CircularStackEntry>[
    CircularStackEntry(
      <CircularSegmentEntry>[
        CircularSegmentEntry(500.0, Colors.purpleAccent, rankKey: 'Consumed'),
        CircularSegmentEntry(1000.0, Colors.greenAccent, rankKey: 'Total'),
      ],
      rankKey: '',
    ),
  ];
// Map<String double>dataMap={
//   "Total":100.00,
// "Consumed":55.5
// };
// List<Color>colorList=[const Color()];

  @override
  Widget build(BuildContext context) {
    return AnimatedCircularChart(
      key: _chartKey,
      size: const Size(300.0, 300.0),
      initialChartData: data,
      chartType: CircularChartType.Pie,
    );
  }

  void _cycleSamples() {
    List<CircularStackEntry> nextData = <CircularStackEntry>[
      CircularStackEntry(
        <CircularSegmentEntry>[
          CircularSegmentEntry(
            1500.0,
            Colors.purpleAccent,
            rankKey: 'Consumed',
          ),
          new CircularSegmentEntry(750.0, Colors.greenAccent, rankKey: 'Q2'),
        ],
        rankKey: 'Quarterly Profits',
      ),
    ];
    setState(() {
      _chartKey.currentState?.updateData(nextData);
    });
  }
}
