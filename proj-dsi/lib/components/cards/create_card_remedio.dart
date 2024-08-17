import 'package:cardiocare/components/buttons/back_button.dart';
import 'package:cardiocare/components/inputs/custom_date_picker.dart';
import 'package:cardiocare/components/inputs/custom_text_field.dart.dart';
import 'package:cardiocare/components/buttons/custom_adicionar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class createCardRemedio extends StatelessWidget {
  final ruledatas = RegExp(r'^\d{1,3}(\.\d{1,2})?$');
  final TextEditingController name_alimento = TextEditingController();

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
                      'Dieta',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ))
              ],
            )
          ],
        ),
        Container(
          child: customTextField(controller: name_alimento, label: "Nome do Alimento", hint: "Escreva aqui", validador: (x){}),
        ),
        Container(
          width: 0.8 * MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.007,
              bottom: MediaQuery.of(context).size.height * 0.005),
            child: Text("Data inicial e final",
                  style: Theme.of(context).textTheme.labelLarge)
            )),
        Container(
          width: 0.8 * MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            customDatePicker(onchange: (picker){data=picker;}),
            Spacer(),
            customDatePicker(onchange: (picker){time=picker;})
          ],)
        ),
        Container(
          width: 0.8 * MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.03,
              bottom: MediaQuery.of(context).size.height * 0.03),
            child: customAdicionar(data: () {
              if (name_alimento.text.isEmpty) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Erro"),
                        content: Text("Nome do alimento não pode ser vazio"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("OK"))
                        ],
                      );
                    });
              } else if (!ruledatas.hasMatch(name_alimento.text)) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Erro"),
                        content: Text("Nome do alimento não pode conter números"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("OK"))
                        ],
                      );
                    });
              } else {
                Navigator.of(context).pop();
              }
            }, height: 0.06, width: 0.4)
          )
        ),
        Container(
          width: 0.8 * MediaQuery.of(context).size.width,
          alignment: Alignment.center,
        )
      ]))),
    );
  }
}
