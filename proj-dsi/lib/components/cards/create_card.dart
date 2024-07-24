import 'package:cardiocare/components/buttons/back_button.dart';
import 'package:cardiocare/components/cards/cards_data.dart';
import 'package:cardiocare/components/inputs/custom_date_picker.dart';
import 'package:cardiocare/components/inputs/custom_hours_picker.dart';
import 'package:cardiocare/components/inputs/observacao.dart';
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
    DateTime? data;
    TimeOfDay? time;
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
              top: (43 / 932) * size.height, bottom: (22 / 932) * size.height),
          width: (374 / 430) * size.width,
          decoration: BoxDecoration(
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
          child: observacao(controller: observadacoes, title: 'Observações'),
        ),
        ElevatedButton(
            onPressed: () {
              print('${data}  ${time} ');
            },
            child: Text('data')),
        customDatePicker(onchange: (picker){data=picker;}),
        customHourPicker(onchange: (picker){time=picker;})
      ]))),
    );
  }
}
