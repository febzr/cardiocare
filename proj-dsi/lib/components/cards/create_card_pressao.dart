import 'package:cardiocare/components/buttons/back_button.dart';
import 'package:cardiocare/components/buttons/custom_button_large.dart';
import 'package:cardiocare/components/cards/cards_data.dart';
import 'package:cardiocare/components/inputs/custom_date_picker.dart';
import 'package:cardiocare/components/inputs/custom_hours_picker.dart';
import 'package:cardiocare/components/inputs/observacao.dart';
import 'package:cardiocare/control/utils/datetime_para_dataehora.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class createCard extends StatelessWidget {
  final TextEditingController sistole = TextEditingController();
  final TextEditingController diastole = TextEditingController();
  final TextEditingController pulso = TextEditingController();
  final TextEditingController peso = TextEditingController();
  final TextEditingController observadacoes = TextEditingController();
  final ruledatas = RegExp(r'^\d{1,3}(\.\d{1,2})?$');

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    DateTime? data;
    TimeOfDay? time;
    if (args != null) {
      sistole.text = args['sistole'].toString();
      diastole.text = args['diastole'].toString();
      peso.text = args['peso'].toString();
      pulso.text = args['pulso'].toString();
      observadacoes.text =
          args['observacao'] != null ? args['observacao'].toString() : '';
      DateTime dateTime =
          DateTime.fromMillisecondsSinceEpoch(args['datatime'], isUtc: true);
      final horarios =
          datetimeParaDataEHora(originalDateTime: dateTime.toLocal());
      data = horarios.getdata();
      time = horarios.gettime();
    }

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(children: [
        Stack(
          children: [
            Row(
              children: [backButton()],
            ),
            Row(
              children: [
                Container(
                    width: (237 / 430) * size.width,
                    margin: EdgeInsets.only(
                        top: (62 / 932) * size.height,
                        left: size.width * (100 / 430)),
                    child: Text(
                      'Registro de Pressão',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ))
              ],
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: (32 / 932) * size.height),
          padding: EdgeInsets.only(
              top: (33 / 932) * size.height, bottom: (4 / 932) * size.height),
          width: (374 / 430) * size.width,
          decoration: BoxDecoration( boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25), 
                 
                  blurRadius: 4,
                  offset: Offset(0, 4)
                ),
              ],
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              cardsData(
                controller: sistole,
                titulo: 'Sistole',
                subtitulo: 'mmHg',
              ),
              cardsData(
                  controller: diastole, titulo: 'Diastole', subtitulo: 'mmHg'),
              cardsData(controller: pulso, titulo: 'Pulso', subtitulo: 'BPM'),
              cardsData(controller: peso, titulo: 'Peso', subtitulo: 'KG')
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: (19 / 932) * size.height),
          child: observacao(controller: observadacoes, title: 'Observações'),
        ),
        Row(children: [
          Container(
              margin: EdgeInsets.only(
                  left: (33 / 430) * MediaQuery.of(context).size.width,
                  top: (12 / 932) * size.height,
                  bottom: (9 / 932) * size.height),
              child: Text('Data e Hora',
                  style: Theme.of(context).textTheme.labelLarge)),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          customDatePicker(
              datas: data,
              onchange: (picker) {
                data = picker;
              }),
          SizedBox(width: (10 / 430) * size.height),
          customHourPicker(
              times: time,
              onchange: (picker) {
                time = picker;
              })
        ]),
        Container(
            margin: EdgeInsets.only(
                top: (33 / 932) * MediaQuery.of(context).size.height,
                bottom: (33 / 932) * MediaQuery.of(context).size.height),
            child: customButtonLarge(
                data: () {
                  Navigator.of(context).pop(context);
                  if (args != null) {
                    final a = args['state'];
                    a();
                  }

                  ;
                },
                label: 'SALVAR'))
      ]))),
    );
  }
}
