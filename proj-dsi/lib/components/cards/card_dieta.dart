import 'package:cardiocare/service/service.dart';
import 'package:flutter/material.dart';
import 'package:iconic/iconic.dart';

class CardDieta2 extends StatelessWidget {
  final int datatime;
  final String id;
  Function? state;
  List alimentos = [];

  CardDieta2({
    super.key,
    required this.alimentos,
    required this.datatime,
    required this.id,
    this.state,
  });

  DateTime getdatetime() {
    return DateTime.fromMillisecondsSinceEpoch(datatime);
  }

  String timestampToDate(DateTime data) {
    return '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year}';
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dismissible(
      key: Key(id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        service().apagarDieta(id);
        state!();
      },
      background: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: const Icon(
          Iconic.trash_straight,
          color: Colors.white,
        ),
      ),
      child: Container(
        width: (374 / 430) * size.width,
        height: (100 / 932) * size.height,
        margin: EdgeInsets.only(bottom: (22 / 932) * size.height),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            splashColor: Theme.of(context).splashColor,
            onTap: () {
              Navigator.of(context).pushNamed('criador_de_dieta', arguments: {
                'datatime': datatime,
                'id': id,
                'state': state,
                'alimentos': alimentos,
              }).then((_) {
                state!();
              });
            },
            child: Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * (25 / 430),
                left: MediaQuery.of(context).size.width * (25 / 430),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    timestampToDate(getdatetime()),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      service().apagarDieta(id);
                      state!();
                    },
                    icon: const Icon(Iconic.trash_straight),
                    color: Theme.of(context).primaryColor,
                    iconSize: (33 / 932) * size.height,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
