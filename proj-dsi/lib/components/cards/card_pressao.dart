import 'package:cardiocare/service/service.dart';
import 'package:flutter/material.dart';
import 'package:iconic/iconic.dart';

class cardPressao extends StatelessWidget {
  final double sistole;
  final double diastole;
  final double pulso;
  final double peso;
  final String? observacao;
  final int datatime;
  final String id;
  Function? state;

  cardPressao({
    super.key,
    required this.sistole,
    required this.diastole,
    required this.pulso,
    required this.peso,
    this.observacao,
    required this.datatime,
    required this.id,
    this.state,
  });

  getdatetime() {
    final a = DateTime.fromMillisecondsSinceEpoch(datatime);
    return a;
  }

  timestampToDate(data) {
    return '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year}';
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: (374 / 430) * size.width,
      height: (100 / 932) * size.height,
      margin: EdgeInsets.only(bottom: (22 / 932) * size.height),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).shadowColor,
                blurRadius: 4,
                offset: const Offset(0, 4))
          ],
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Material(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          splashColor: Theme.of(context).splashColor,
          onTap: () {
            Navigator.of(context).pushNamed('criador_de_pressao', arguments: {
              'sistole': sistole,
              'diastole': diastole,
              'pulso': pulso,
              'peso': peso,
              'observacao': observacao,
              'datatime': datatime,
              'id': id,
              'state': state
            }).then((_) {
              state!();
            });
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: (16 / 430) * size.width),
                child: Text(
                  timestampToDate(
                      DateTime.fromMillisecondsSinceEpoch(datatime)),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              IconButton(
                onPressed: () {
                  service().apagarpressao(id);
                  state!();
                },
                icon: const Icon(Iconic.trash_straight),
                color: Theme.of(context).primaryColor,
                iconSize: (33 / 932) * size.height,
                padding: EdgeInsets.only(right: (16 / 430) * size.width),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
