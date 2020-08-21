import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 2.2,
        child: LineChart(
          LineChartData(
            lineTouchData: LineTouchData(enabled: false),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, .5),
                  FlSpot(1, 1.5),
                  FlSpot(2, 0.5),
                  FlSpot(3, .7),
                  FlSpot(4, .2),
                  FlSpot(5, 2),
                  FlSpot(6, 1.5),
                  FlSpot(7, 1.7),
                  FlSpot(8, 1),
                  FlSpot(9, 2.8),
                  FlSpot(10, 2.5),
                  FlSpot(11, 2.7),
                ],
                isCurved: true,
                barWidth: 2,
                colors: [
                  Colors.brown,
                ],
                dotData: FlDotData(
                  show: false,
                ),
              ),
            ],
            minY: 0,
            minX: 0,
            axisTitleData: FlAxisTitleData(
              show: false,
            ),
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(show: false),
          ),
        ),
      ),
    );
  }
}
