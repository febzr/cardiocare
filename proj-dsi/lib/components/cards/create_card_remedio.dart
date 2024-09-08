import 'package:cardiocare/components/buttons/back_button.dart';
import 'package:cardiocare/components/buttons/custom_button_large.dart';
import 'package:cardiocare/components/inputs/custom_text_field_small.dart';
import 'package:cardiocare/components/inputs/observacao.dart';
import 'package:cardiocare/model/remedio/model_remedio.dart';
import 'package:cardiocare/service/service.dart';


import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';


class createCardRemedio extends StatefulWidget{
  createCardRemedio({super.key});

  _createCardRemedio createState() => _createCardRemedio();
}

class _createCardRemedio extends State<createCardRemedio> {
  final TextEditingController remedio = TextEditingController();
  final TextEditingController observadacoes = TextEditingController();
  final ruledatas = RegExp(r'^\d{1,3}(\.\d{1,2})?$');
  int cont=0;

 

 

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null &&  cont<1) {
      cont=cont+1;
      remedio.text = args['remedio'].toString();
      observadacoes.text =
          args['observacao'] != null ? args['observacao'].toString() : '';
    }

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(children: [
        Stack(
          children: [
            const Row(
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
                      'Registro de Remédios',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ))
              ],
            )
          ],
        ),

       Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*(36/932)),
         child: Container(child:customTextFieldsmall(pesquisa: false,label: 'Nome do Medicamento', hint: 'Escreva aqui', controller: remedio) ,)
       ),
        Container(
          margin: EdgeInsets.only(top: (25 / 932) * size.height),
          child: observacao(controller: observadacoes, title: 'Observações'),
        ),
        Container(
            margin: EdgeInsets.only(
                top: (380 / 932) * MediaQuery.of(context).size.height,
                bottom: (33 / 932) * MediaQuery.of(context).size.height),
            child: customButtonLarge(
                data: () async{
                 
                  if (args != null) {
                    final rem = modelremedio(id: args['id'], remedio: remedio.text ,observacao: observadacoes.text);
                    await service().adicionarRemedio(rem);
                    
                  }
                  if (args == null) {
                    final rem = modelremedio(id: Uuid().v1(), remedio: remedio.text ,observacao: observadacoes.text);
                    await service().adicionarRemedio(rem);
                  }

                   Navigator.of(context).pop(context);

                },
                label: 'SALVAR'))
      ]))),
    );
  }
}
