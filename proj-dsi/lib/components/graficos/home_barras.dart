import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarGrafico extends StatelessWidget {
  const BarGrafico({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: (100 / 430) * size.width,
      height: (106 / 930) * size.height,
      child: BarChart(
        BarChartData(
          borderData: FlBorderData(
            show: false,
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  if (value == 0) {
                    return Text('0', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 12));
                  } else if (value == 5) {
                    return Text('6', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 12));
                  }
                  return const Text('');
                },
              ),
            ),
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ), rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false))
          ),
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(
                  toY: 53,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
              ],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                  toY: 70,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
              ],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(
                  toY: 28,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
              ],
            ),
            BarChartGroupData(
              x: 3,
              barRods: [
                BarChartRodData(
                  toY: 36,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
              ],
            ),
            BarChartGroupData(
              x: 4,
              barRods: [
                BarChartRodData(
                  toY: 53,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
              ],
            ),
            BarChartGroupData(
              x: 5,
              barRods: [
                BarChartRodData(
                  toY: 66,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
