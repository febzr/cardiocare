import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:cardiocare/control/controlGraf.dart';

class BarGrafico extends StatelessWidget {
  const BarGrafico({super.key});

  Future<List> pegaagua() async {
    List dados = await lista7agua();
    if (dados.length < 7) {
      throw 'Não há dados \n suficientes :/';
    }
    return dados;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return FutureBuilder<List>(
      future: pegaagua(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        } else if (snapshot.hasData) {
          List agua = snapshot.data!;

          final dia0 = getPrimeiraLetradoDiafromData(agua[0].datatime);
          final dia1 = getPrimeiraLetradoDiafromData(agua[1].datatime);
          final dia2 = getPrimeiraLetradoDiafromData(agua[2].datatime);
          final dia3 = getPrimeiraLetradoDiafromData(agua[3].datatime);
          final dia4 = getPrimeiraLetradoDiafromData(agua[4].datatime);
          final dia5 = getPrimeiraLetradoDiafromData(agua[5].datatime);
          final dia6 = getPrimeiraLetradoDiafromData(agua[6].datatime);

          final agua0 = agua[0].aguabebida;
          final agua1 = agua[1].aguabebida;
          final agua2 = agua[2].aguabebida;
          final agua3 = agua[3].aguabebida;
          final agua4 = agua[4].aguabebida;
          final agua5 = agua[5].aguabebida;
          final agua6 = agua[6].aguabebida;

          List aguas = [agua0, agua1, agua2, agua3, agua4, agua5, agua6];
          print(aguas);

          return SizedBox(
            width: (100 / 430) * size.width,
            height: (106 / 930) * size.height,
            child: BarChart(
              BarChartData(
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        switch (value.toInt()) {
                          case 0:
                            return Text(dia0,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontSize: 12));
                          case 1:
                            return Text(dia1,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontSize: 12));
                          case 2:
                            return Text(dia2,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontSize: 12));
                          case 3:
                            return Text(dia3,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontSize: 12));
                          case 4:
                            return Text(dia4,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontSize: 12));
                          case 5:
                            return Text(dia5,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontSize: 12));
                          case 6:
                            return Text(dia6,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontSize: 12));
                          default:
                            return const Text('');
                        }
                      },
                    ),
                  ),
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                ),
                barGroups: List.generate(6, (i) {
                  return BarChartGroupData(
                    x: i,
                    barRods: [
                      BarChartRodData(
                        toY: aguas[i],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ],
                  );
                }),
              ),
            ),
          );
        } else {
          return const Center(child: Text('No data available'));
        }
      },
    );
  }
}
