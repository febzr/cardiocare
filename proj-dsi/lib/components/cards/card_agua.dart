import 'package:cardiocare/service/service.dart';
import 'package:flutter/material.dart';
import 'package:iconic/iconic.dart';

class CardAgua extends StatelessWidget {
  final double aguabebida;
  final int datatime;
  final String id;
  Function? state;

  CardAgua(
      {super.key,
      required this.aguabebida,
      required this.id,
      required this.datatime,
      this.state});

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
              /*Navigator.of(context).pushNamed('criador_de_pressao', arguments: {
                'aguabebida': aguabebida,
                'datatime': datatime,
                'id': id,
                'state': state
              }).then((_) {
                state!();
              });*/
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  timestampToDate(
                      DateTime.fromMillisecondsSinceEpoch(datatime)),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Row(children: [
                  IconButton(
                    onPressed: () {
                      /*Navigator.of(context).pushNamed('criador_de_pressao',
                          arguments: {
                            'aguabebida': aguabebida,
                            'datatime': datatime,
                            'id': id,
                            'state': state
                          }).then((_) {
                        state!();
                      });*/
                    },
                    icon: const Icon(Iconic.pencil),
                    color: Theme.of(context).primaryColor,
                    iconSize: (33 / 932) * size.height,
                  ),
                  IconButton(
                    onPressed: () {
                      service().apagaragua(id);
                      state!();
                    },
                    icon: const Icon(Iconic.trash_straight),
                    color: Theme.of(context).primaryColor,
                    iconSize: (33 / 932) * size.height,
                  ),
                ]), 
              ],
            ),
          )),
    );
  }
}
