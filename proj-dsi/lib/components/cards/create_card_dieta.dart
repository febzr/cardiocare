import 'package:flutter/material.dart';
import 'package:cardiocare/components/buttons/custom_button_add.dart';
import 'package:cardiocare/components/buttons/custom_button_large.dart';
import 'package:cardiocare/components/inputs/custom_date_picker.dart';
import 'package:cardiocare/components/inputs/custom_hours_picker.dart';
import 'package:cardiocare/components/inputs/custom_text_field_extra.dart';
import 'package:cardiocare/components/buttons/back_button.dart';
import 'package:cardiocare/model/dieta/model_card_dieta.dart';
import 'package:cardiocare/service/service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart'; // Importar FirebaseAuth

class DietaScreen extends StatefulWidget {
  const DietaScreen({super.key});

  @override
  State<DietaScreen> createState() => _DietaScreenState();
}

class _DietaScreenState extends State<DietaScreen> {
  final TextEditingController _foodController = TextEditingController();
  TimeOfDay? selectedTime = null;
  DateTime? selectedDate = null;
  int cont=0;
  List _foodItems = []; // Lista para armazenar os alimentos

  void _addFoodItem() {
    if (_foodController.text.isNotEmpty) {

      
      setState(() {
        _foodItems.add(
          {
          'food': _foodController.text,
          'time': selectedTime!=null?'${selectedTime!.hour.toString().padLeft(2, '0')}:${selectedTime!.minute.toString().padLeft(2, '0')}':'${TimeOfDay.now().hour.toString().padLeft(2, '0')}:${TimeOfDay.now().minute.toString().padLeft(2, '0')}',
        }); 
        _foodController.clear();
      });
    }
  }

  void _removeFoodItem(int index) {
    setState(() {
      _foodItems.removeAt(index);
    });
  }

  _saveDieta(args) async {


    if (_foodItems.isNotEmpty) {


      // Obtém o ID do usuário logado
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) {
        // Se não houver um usuário logado, exiba uma mensagem de erro ou retorne
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Usuário não autenticado')),
        );
        return;
      }

      // Salva os itens no Firebase
      final serviceInstance = service();
      if(args !=null){
        final dietaItem = modelDieta(
          id: args['id'], 
          alimentos:  _foodItems,
          datatime: (selectedDate == null?DateTime.now().millisecondsSinceEpoch : selectedDate!.millisecondsSinceEpoch),
        );

        // Adiciona o item à lista do serviço
        await serviceInstance.adicionarDieta(dietaItem);
      }else{
      final dietaItem = modelDieta(
          id: Uuid().v1(), // Usa o ID do usuário logado
          alimentos:  _foodItems,
          datatime: (selectedDate == null?DateTime.now().millisecondsSinceEpoch : selectedDate!.millisecondsSinceEpoch),
        );

        // Adiciona o item à lista do serviço
        await serviceInstance.adicionarDieta(dietaItem);}
      

      // Voltar para a tela anterior
       Navigator.of(context).pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null &&  cont<1) {
      cont=cont+1;
      _foodItems = args['alimentos'];
      DateTime dateTime =
          DateTime.fromMillisecondsSinceEpoch(args['datatime'], isUtc: true);

      selectedDate = dateTime;
    }

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Row(children: [backButton()]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: (180 / 430) * screenWidth,
                        margin: EdgeInsets.only(
                          top: screenHeight * (59 / 932),
                          bottom: screenHeight * (25 / 932),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Dieta',
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: (28 / 430) * screenWidth,
                  vertical: (22 / 932) * screenHeight,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customTextFieldExtra(
                      label: 'Nome do Alimento',
                      controller: _foodController,
                      hint: 'Escreva aqui',
                    ),
                    SizedBox(height: screenHeight * (16 / 932)),
                    Text(
                      'Data e hora do consumo',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(height: screenHeight * (8 / 932)),
                    Row(
                      children: [
                        customHourPicker(
                          onchange: (pickedTime) {
                            setState(() {
                              selectedTime = pickedTime;
                            });
                          },
                          times: selectedTime,
                        ),
                        SizedBox(width: screenWidth * (8 / 430)),
                        customDatePicker(
                          onchange: (pickedDate) {
                            setState(() {
                              selectedDate = pickedDate;
                            });
                          },
                          datas: selectedDate,
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * (16 / 932)),
                    Align(
                      alignment: Alignment.center,
                      child: customButtonAdd(
                        data: _addFoodItem,
                        label: 'ADICIONAR',
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.only(right: 24),
                  child: SizedBox(
                    width: (374 / 430) * screenWidth,
                    child: Column(
                      children: List.generate(_foodItems.length, (index) {
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Card(
                              margin: EdgeInsets.only(
                                bottom: screenHeight * (8 / 932),
                                left: screenWidth * (16 / 430),
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * (16 / 430)),
                                title: Text(_foodItems[index]['food']!),
                                trailing: Text(_foodItems[index]['time']!),
                              ),
                            ),
                            Positioned(
                              right: -12,
                              top: (screenHeight * (16 / 932) / 2) - 12,
                              child: GestureDetector(
                                onTap: () => _removeFoodItem(index),
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.red,
                                  child: Icon(
                                    Icons.close,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * (16 / 932),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: customButtonLarge(
                    data: ()async{await _saveDieta(args);}, // Chama a função que salva a dieta
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
