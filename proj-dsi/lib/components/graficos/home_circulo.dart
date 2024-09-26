import 'package:cardiocare/control/utils/datetime_para_dataehora.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:cardiocare/control/controlGraf.dart';

class homeCircular extends StatelessWidget {
  const homeCircular({super.key});

  Future<List> pegalista() async {
    List dados = await listaCard3Novos();
    if (dados.length < 3) {
      throw 'Não há dados \n suficientes :/';
    }
    return dados;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: pegalista(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while the data is loading
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Handle errors
          return Center(child: Text('${snapshot.error}'));
        } else if (snapshot.hasData) {
          List lista = snapshot.data!;

          final data0 = DateTime.fromMillisecondsSinceEpoch(lista[0].datatime);
          final data1 = DateTime.fromMillisecondsSinceEpoch(lista[1].datatime);
          final data2 = DateTime.fromMillisecondsSinceEpoch(lista[2].datatime);

          tag(x) {
            if (x == 0.0) {
              return '${lista[0].sistole}/${lista[0].diastole}';
            }
            if (x == 1.0) {
              return '${lista[1].sistole}/${lista[1].diastole}';
            }
            if (x == 2.0) {
              return '${lista[2].sistole}/${lista[2].diastole}';
            }
          }

          return LineChart(
            LineChartData(
              gridData: FlGridData(show: true),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 38,
                    getTitlesWidget: (value, meta) {
                      switch (value) {
                        case 0:
                          return Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              '${data0.day}/${data0.month}/${data0.year}',
                              style: TextStyle(fontSize: 8),
                            ),
                          );
                        case 1:
                          return Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              '${data1.day}/${data1.month}/${data1.year}',
                              style: TextStyle(fontSize: 8),
                            ),
                          );
                        case 2:
                          return Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              '${data2.day}/${data2.month}/${data2.year}',
                              style: TextStyle(fontSize: 8),
                            ),
                          );
                        default:
                          return const Text('');
                      }
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false), // Remove titles on Y-axis
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false), // Remove titles on right axis
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false), // Remove titles on top axis
                ),
              ),
              borderData: FlBorderData(
                show: false,
                border: Border.all(color: Colors.black, width: 1),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    FlSpot(0, (lista[0].sistole / lista[0].diastole)), // First point (x: 0, y: value)
                    FlSpot(1, (lista[1].sistole / lista[1].diastole)), // Second point (x: 1, y: value)
                    FlSpot(2, (lista[2].sistole / lista[2].diastole)), // Third point (x: 2, y: value)
                  ],
                  isCurved: true, // Defines whether the line should be curved
                  barWidth: 2, // Line width
                  isStrokeCapRound: true,
                  color: Colors.white,
                  dotData: FlDotData(show: true), // Show points on the graph
                ),
              ],
              lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                  getTooltipItems: (touchedSpots) {
                    return touchedSpots.map((spot) {
                      // Customize tooltip text
                      String customLabel = "${tag(spot.x)}";

                      return LineTooltipItem(
                        customLabel,
                        const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }).toList();
                  },
                ),
              ),
            ),
          );
        } else {
          // Handle the case where no data is available
          return const Center(child: Text('No data available'));
        }
      },
    );
  }
}
