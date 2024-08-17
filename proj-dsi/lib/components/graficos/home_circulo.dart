import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
class homeCircular extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(width: (150/430)*size.width,
                height:(106/932)*size.height,
                  child: AspectRatio(
                aspectRatio: 1.3,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PieChart(
                      PieChartData(
                        sectionsSpace:3,
                        centerSpaceRadius: (38/932)*size.height, // Espaço vazio no centro
                        sections: [
                          PieChartSectionData(
                            radius: (13/932)*size.height,
                            color: Colors.white,
                            value: 34,
                            title: '34%',
                            titlePositionPercentageOffset: 2.3,
                            titleStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400,fontSize: 12),
                          ),
                          PieChartSectionData(
                            radius: (13/932)*size.height,
                            color: Colors.white,
                            value: 26,
                            title: '26%',
                            titlePositionPercentageOffset: 2.3,
                            titleStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400,fontSize: 12),
                          ),
                          PieChartSectionData(
                            radius: (13/932)*size.height,
                            color: Colors.white,
                            value: 35,
                            title: '35%',
                            titlePositionPercentageOffset: 1.9,
                            titleStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400,fontSize: 12),
                          ),
                          PieChartSectionData(
                            radius: (13/932)*size.height,
                            color: Colors.white,
                            value: 5,
                            title: '5%',
                            titleStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400,fontSize: 12),
                            titlePositionPercentageOffset: 2.3
                          )
                        ],
                        borderData: FlBorderData(
                          show: false,
                        ),
                      ),
                    ),
                    Text(
                    '',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ));
  }
}