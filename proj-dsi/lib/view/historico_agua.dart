import 'package:cardiocare/components/buttons/back_button.dart';
import 'package:cardiocare/components/buttons/custom_Floating_Action_Buttom.dart';
import 'package:cardiocare/components/cards/card_agua.dart';
import 'package:cardiocare/components/inputs/custom_data_picker_null.dart';
import 'package:cardiocare/control/agua/dados_agua.dart';
import 'package:cardiocare/control/utils/is_dataigual.dart';
import 'package:flutter/material.dart';

class historicodeagua extends StatefulWidget {
  const historicodeagua({super.key});

  @override
  State<historicodeagua> createState() => _historicodeagua();
}

class _historicodeagua extends State<historicodeagua> {
  @override
  DateTime? data;

  setsetstate(CardAgua i) {
    i.state = () {
      setState(() {});
    };
    return i;
  }

  bool dataisigual(CardAgua i, DateTime? d) {
    DateTime t = i.getdatetime();

    final r = isDataIgual(datetime1: t, datetime2: d);
    return r.isigual();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: customFloatingActionbutton(
        icone: Icon(
          Icons.add_rounded,
          size: MediaQuery.of(context).size.width * (48 / 430),
          color: Colors.white,
        ),
        onpress: () {
          Navigator.of(context).pushNamed('criador_de_pressao').then((_) {
            setState(() {});
          });
        },
      ),
      body: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(children: [
                const Row(children: [backButton()]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    width: (180 / 430) * MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * (59 / 932),
                        bottom:
                            MediaQuery.of(context).size.height * (25 / 932)),
                    alignment: Alignment.center,
                    child: Text(
                      'Historico de Agua',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  )
                ])
              ]),
              Row(children: [
                Padding(
                    padding: EdgeInsets.only(
                        left: (28 / 430) * MediaQuery.of(context).size.width,
                        bottom:
                            (22 / 932) * MediaQuery.of(context).size.height),
                    child: customDatePickerNull(
                      onchange: (picker) {
                        data = picker;
                        setState(() {
                          data = picker;
                        });
                      },
                    ))
              ]),
              Expanded(
                child: SizedBox(
                    width: (374 / 430) * MediaQuery.of(context).size.width,
                    child: FutureBuilder(
                        future: listaagua(),
                        builder: ((context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Erro: ${snapshot.error}');
                          } else {
                            
                            for (var i in snapshot.data!) {
                              i.state = () {
                                setState(() {});
                              };
                            }
                            ;

                            return RefreshIndicator(
                                onRefresh: () async {
                                  setState(() {});
                                },
                                child: ListView(children: [
                                  for (var i in snapshot.data!)
                                    (data == null)
                                        ? setsetstate(i)
                                        : (dataisigual(setsetstate(i), data)
                                            ? setsetstate(i)
                                            : const SizedBox.shrink())
                                ]));
                          }
                        }))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
