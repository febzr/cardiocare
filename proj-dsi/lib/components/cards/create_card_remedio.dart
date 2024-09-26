import 'package:cardiocare/components/buttons/back_button.dart';
import 'package:cardiocare/components/buttons/custom_button_large.dart';
import 'package:cardiocare/components/inputs/checkbox.dart';
import 'package:cardiocare/components/inputs/custom_date_picker.dart';
import 'package:cardiocare/components/inputs/custom_hours_picker.dart';
import 'package:cardiocare/components/inputs/custom_text_field_small.dart';
import 'package:cardiocare/components/inputs/custom_text_field_unidade.dart';
import 'package:cardiocare/components/inputs/observacao.dart';
import 'package:cardiocare/control/utils/datetime_para_dataehora.dart';
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
  final TextEditingController uo = TextEditingController();
  final ruledatas = RegExp(r'^\d{1,3}(\.\d{1,2})?$');
  int cont=0;
  String selectedUnitFromDropdown = 'uni';
  bool isCheckboxSelected = false;
  DateTime? data;
  TimeOfDay? hora;
  int? datafinal;
 

 

  @override
  Widget build(BuildContext context) {
    
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
        print(args);
    if (args != null &&  cont<1) {
      cont=cont+1;
      remedio.text = args['remedio'].toString();
      observadacoes.text =
          args['observacao'] != null ? args['observacao'].toString() : '';

      uo.text = args['dosagem'];
      selectedUnitFromDropdown = args['unidade'];
      DateTime dataantiga =
          DateTime.fromMillisecondsSinceEpoch(args['datatime'], isUtc: true);

      
      final horarios =
          datetimeParaDataEHora(originalDateTime: dataantiga.toLocal());
      data = horarios.getdata();
      hora = horarios.gettime();


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

       Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*(36/932),bottom:MediaQuery.of(context).size.height*(18/932) ),
         child: Container(child:customTextFieldsmall(pesquisa: false,label: 'Nome do Medicamento', hint: 'Escreva aqui', controller: remedio) ,)
       ),
       CustomTextFieldUnidade(inicial: selectedUnitFromDropdown, label: 'Dosagem', hint: 'dose', controller: uo,onUnitChanged:  (String unidade) {
                setState(() {
                  selectedUnitFromDropdown = unidade;
                });
              },),
              Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*(19/930)),
                child: CustomCheckboxWithTitle(title: 'Última ingestão', description: 'Marque se você acabou de tomar o medicamento', onChanged:(bool isSelected) {
                  setState(() {
                    isCheckboxSelected = isSelected;
                  });
                },
                          ),
              ),
              Container(
                 width: (374 / 430) * MediaQuery.of(context).size.width,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [customDatePicker(datas:data, onchange: (selecionado){data = selecionado;}),customHourPicker(times:hora, onchange: (picker){hora = picker;})],)
              ),
              
 
        Container(
          margin: EdgeInsets.only(top: (25 / 932) * size.height),
          child: observacao(controller: observadacoes, title: 'Observações'),
        ),
        Container(
            margin: EdgeInsets.only(
                top: (200 / 932) * MediaQuery.of(context).size.height,
                bottom: (33 / 932) * MediaQuery.of(context).size.height),
            child: customButtonLarge(
                data: () async{
                 
                  if (args != null) {
  // Declaração da variável datafinal
  int datafinal;

  if (isCheckboxSelected) {
    // Se o checkbox estiver selecionado, pega a data atual
    datafinal = DateTime.now().millisecondsSinceEpoch;
  } else if (data != null && hora != null) {
    // Se data e hora forem fornecidas, combina os dois
    datafinal = DateTime(data!.year, data!.month, data!.day, hora!.hour, hora!.minute).millisecondsSinceEpoch;
  } else {
    // Caso contrário, usa a data atual
    datafinal = DateTime.now().millisecondsSinceEpoch;
  }

  // Cria o objeto modelremedio e o adiciona ao serviço
  final rem = modelremedio(
    id: args['id'],
    remedio: remedio.text,
    observacao: observadacoes.text,
    dosagem: uo.text,
    datetime: datafinal,
    unidade: selectedUnitFromDropdown,
  );
  await service().adicionarRemedio(rem);
}

if (args == null) {
  // Declaração da variável datafinal para o caso em que args é nulo
  int datafinal;

  if (isCheckboxSelected) {
    datafinal = DateTime.now().millisecondsSinceEpoch;
  } else if (data != null && hora != null) {
    datafinal = DateTime(data!.year, data!.month, data!.day, hora!.hour, hora!.minute).millisecondsSinceEpoch;
  } else {
    datafinal = DateTime.now().millisecondsSinceEpoch;
   
  }
  // Cria o objeto modelremedio com um novo ID e o adiciona ao serviço
  final rem = modelremedio(
    id: Uuid().v1(),
    remedio: remedio.text,
    observacao: observadacoes.text,
    dosagem: uo.text,
    datetime: datafinal,
    unidade: selectedUnitFromDropdown,
  );
  await service().adicionarRemedio(rem);
}


                   Navigator.of(context).pop(context);

                },
                label: 'SALVAR'))
      ]))),
    );
  }
}
