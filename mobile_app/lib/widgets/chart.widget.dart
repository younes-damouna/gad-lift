import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  late int showingTooltip;
  @override
  void initState() {
    showingTooltip = -1;
    super.initState();
  }

  BarChartGroupData generateGroupData(int x, int y) {
    return BarChartGroupData(
      x: x,
      showingTooltipIndicators: showingTooltip == x ? [0] : [],
      barRods: [
        BarChartRodData(toY: y.toDouble()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        borderData: FlBorderData(show: false),
        // gridData: FlGridData(drawVerticalLine: true),
        barGroups: [
          generateGroupData(2, 10),
          generateGroupData(3, 18),
          generateGroupData(4, 40),
          generateGroupData(5, 11),
        ],
        barTouchData: BarTouchData(
            enabled: true,
            handleBuiltInTouches: false,
            touchCallback: (event, response) {
              if (response != null &&
                  response.spot != null &&
                  event is FlTapUpEvent) {
                setState(() {
                  final x = response.spot!.touchedBarGroup.x;
                  final isShowing = showingTooltip == x;
                  if (isShowing) {
                    showingTooltip = -1;
                  } else {
                    showingTooltip = x;
                  }
                });
              }
            },
            mouseCursorResolver: (event, response) {
              return response == null || response.spot == null
                  ? MouseCursor.defer
                  : SystemMouseCursors.click;
            }

            // read about it in the BarChartData section
            ),
      ),
      swapAnimationDuration: const Duration(milliseconds: 150), // Optional
      swapAnimationCurve: Curves.linear, // Optional
    );
  }
}
