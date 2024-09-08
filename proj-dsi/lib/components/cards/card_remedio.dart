
import 'package:cardiocare/service/service.dart';
import 'package:flutter/material.dart';
import 'package:iconic/iconic.dart';

class cardRemedio extends StatelessWidget {
  final String name_remedio;
  final String? observacoes;
  final String id;
  Function? state;

  cardRemedio({
    super.key,
    this.state,
    required this.name_remedio,
    this.observacoes,
    required this.id,
  });


String truncateString(String text, int maxLength) {
  if (text.length <= maxLength) {
    return text;
  } else {
    return '${text.substring(0, maxLength - 3)}...'; // 3 para as reticências
  }
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
              Navigator.of(context).pushNamed('criador_de_remedio', arguments: {
                'remedio': name_remedio,
                'observacao': observacoes,
                'id': id,
                'state': state
              }).then((_) {
                state!();
              });
            },
            child: Padding(padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*(25/430),left: MediaQuery.of(context).size.width*(25/430)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    truncateString(name_remedio, (MediaQuery.of(context).size.width / 34).floor()),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Spacer(),
                  Row(children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('criador_de_remedio',
                            arguments: {
                              'remedio': name_remedio,
                              'observacao': observacoes,
                              'id': id,
                              'state': state
                            }).then((_) {
                          state!();
                        });
                      },
                      icon: const Icon(Iconic.pencil),
                      color: Theme.of(context).primaryColor,
                      iconSize: (33 / 932) * size.height,
                    ),
                    IconButton(
                      onPressed: () {
                        service().apagarRemedio(id);
                        state!();
                      },
                      icon: const Icon(Iconic.trash_straight),
                      color: Theme.of(context).primaryColor,
                      iconSize: (33 / 932) * size.height,
                    ),
                  ]),
                ],
              )
            ),
          )),
    );
  }
}
