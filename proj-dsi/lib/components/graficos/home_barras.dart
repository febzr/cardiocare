import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class barGrafico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: (100 / 430) * size.width,
      height: (106 / 930) * size.height,
      child: BarChart(
        BarChartData(
          borderData: FlBorderData(
            show: false,
          ),
          titlesData: FlTitlesData(
            show: true,
            
            bottomTitles: SideTitles( showTitles: true,getTitles: (value) {
              if(value==0){
                return '0';

              }
              else if(value==5){
                return '6';
              }
              return '';
            },getTextStyles: (context, value) {
              return Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400,color: Colors.white,fontSize: 12);
            },),
            
            leftTitles: SideTitles(showTitles: false)
          ),
          barGroups: [
            BarChartGroupData(
              x: 0,
            
              barRods: [
                BarChartRodData(
                  y: 53,
                  colors: [Colors.white],
                  borderRadius: BorderRadius.circular(6),
                  
                ),
              ],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                  y: 70,
                  colors: [Colors.white],
                  borderRadius: BorderRadius.circular(6),
                ),
              ],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(
                  y: 28,
                  colors: [Colors.white],
                  borderRadius: BorderRadius.circular(6),
                ),
              ],
            ),
            BarChartGroupData(
              x: 3,
              barRods: [
                BarChartRodData(
                  y: 36,
                  colors: [Colors.white],
                  borderRadius: BorderRadius.circular(6),
                ),
              ],
            ),
            BarChartGroupData(
              x: 4,
              barRods: [
                BarChartRodData(
                  y: 53,
                  colors: [Colors.white],
                  borderRadius: BorderRadius.circular(6),
                ),
              ],
            ),
            BarChartGroupData(
              x: 5,
              barRods: [
                BarChartRodData(
                  y: 66,
                  colors: [Colors.white],
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
