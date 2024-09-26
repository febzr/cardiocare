import 'package:cardiocare/components/buttons/back_button.dart';
import 'package:cardiocare/components/buttons/custom_button_large.dart';
import 'package:cardiocare/components/inputs/custom_date_picker.dart';
import 'package:cardiocare/components/inputs/custom_text_field_extra.dart';
import 'package:cardiocare/model/agua/model_agua.dart';
import 'package:cardiocare/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart'; 

class config_agua extends StatefulWidget {
  @override
  _config_aguaState createState() => _config_aguaState();
}

class _config_aguaState extends State<config_agua> {
  final TextEditingController _aguacontroller = TextEditingController();
  DateTime? selectedDate; // Variável para armazenar a data selecionada
  String? consumoAgua; // Variável para armazenar o valor do consumo de água
  String? id; // Variável para armazenar o id do documento
  int cont=0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    String id = Uuid().v1();

    // Recebe os argumentos passados pela tela anterior
    final args = ModalRoute.of(context)!.settings.arguments as Map?;

    // Preenche os campos com os valores passados
    if (args != null && cont<1) {
      cont=cont+1;
      _aguacontroller.text = args['aguabebida'].toString();
      selectedDate = DateTime.fromMillisecondsSinceEpoch(args['datatime']);
      id = args['id'];
    }

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Alinha tudo à esquerda
            children: [
              Stack(children: [
                const Row(children: [backButton()]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    width: (180 / 430) * screenWidth,
                    margin: EdgeInsets.only(
                      top: screenHeight * (59 / 932),
                      bottom: screenHeight * (25 / 932),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Consumo de Água',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  )
                ])
              ]),
              SizedBox(height: screenHeight * (8 / 932)),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * (28 / 430)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * (8 / 932)),
                    customTextFieldExtra(
                      label: 'Consumo de Água',
                      hint: 'Escreva aqui',
                      controller: _aguacontroller,
                    ),
                    SizedBox(height: screenHeight * (16 / 932)),
                    Text(
                      'Data de consumo',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium?.fontSize,
                      ),
                    ),
                    SizedBox(height: screenHeight * (8 / 932)),
                    customDatePicker(
                      onchange: (pickedDate) {
                        setState(() {
                          selectedDate = pickedDate;
                        });
                      },
                      datas: selectedDate,
                    ),
                    SizedBox(height: screenHeight * 0.50),
                  ],
                ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * (16 / 932),
              ),
              child: Align(
              alignment: Alignment.center,
              child: customButtonLarge(
                data: () async {
                  await service().adicionaragua(modelagua(aguabebida: double.parse(_aguacontroller.text.toString()), datatime: selectedDate!.millisecondsSinceEpoch, id: id.toString()))
                  .then((value) => Navigator.pop(context));
                },
                label: 'SALVAR',
              ),
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
