// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconic/iconic.dart';

class cardDieta extends StatelessWidget {
  final String name_alimento;
  final int datatime;
  final List<String> comidas;

  cardDieta(
      {super.key,
      required this.name_alimento,
      required this.datatime,
      required this.comidas});

  timestampToDate(data){
    return '${data.day.toString().padLeft(2,'0')}/${data.month.toString().padLeft(2,'0')}/${data.year}';
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: (374 / 430) * size.width,
      height: (100 / 932) * size.height,
      margin: EdgeInsets.only(bottom: (22/932)*size.height),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).shadowColor,
                blurRadius: 4,
                offset: Offset(0, 4))
          ],
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            splashColor: Theme.of(context).splashColor,
            onTap: () {
              print('card');
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  timestampToDate(DateTime.fromMillisecondsSinceEpoch(this.datatime)),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Row(children: [
                  IconButton(
                    onPressed: () {
                      
                    },
                    icon: Icon(Iconic.pencil),
                    color: Theme.of(context).primaryColor,
                    iconSize: (33 / 932) * size.height,
                  ),
                  IconButton(
                    onPressed: () {
                      print('excluir');
                    },
                    icon: Icon(Iconic.trash_straight),
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
