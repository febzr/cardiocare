import 'package:cardiocare/components/buttons/back_button.dart';
import 'package:cardiocare/components/buttons/custom_Floating_Action_Buttom.dart';
import 'package:cardiocare/components/inputs/custom_data_picker_null.dart';




import '../model/teste_cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class diariodepressao extends StatefulWidget {
  diariodepressao({super.key});

  State<diariodepressao> createState() => _diarioDePressao();
}

class _diarioDePressao extends State<diariodepressao> {
  @override
  Widget build(BuildContext context) {
    DateTime? data = null;
    return Scaffold(
      floatingActionButton: customFloatingActionbutton(onpress: (){Navigator.of(context).pushNamed('criador_de_pressao');},),
      body: Container(
        width: double.infinity,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(children: [
                Row(children: [backButton()]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    width: (180 / 430) * MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * (59 / 932),
                        bottom:
                            MediaQuery.of(context).size.height * (25 / 932)),
                    alignment: Alignment.center,
                    child: Text(
                      'Diário de Pressão',
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
                      },
                    ))
              ]),
              Expanded(
                child: Container(
                    width: (374 / 430) * MediaQuery.of(context).size.width,
                    child: FutureBuilder(
                        future: listaCardPressao(),
                        builder: ((context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Erro: ${snapshot.error}');
                          } else {
                            return RefreshIndicator(
                                onRefresh: () async {
                                  setState(() {});
                                },
                                child: ListView(children: [
                                  for (var i in snapshot.data!) i
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
