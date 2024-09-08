import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Para formatar datas
import 'package:cardiocare/components/buttons/custom_button_add.dart';
import 'package:cardiocare/components/buttons/custom_button_large.dart';
import 'package:cardiocare/components/inputs/custom_date_picker.dart';
import 'package:cardiocare/components/inputs/custom_hours_picker.dart';
import 'package:cardiocare/components/inputs/custom_text_field_extra.dart';
import 'package:cardiocare/components/buttons/back_button.dart';

class DietaScreen extends StatefulWidget {
  const DietaScreen({super.key});

  @override
  State<DietaScreen> createState() => _DietaScreenState();
}

class _DietaScreenState extends State<DietaScreen> {
  final TextEditingController _foodController = TextEditingController();
  TimeOfDay? selectedTime;
  DateTime? selectedDate;
  List<Map<String, String>> _foodItems = [];

  void _addFoodItem() {
    if (_foodController.text.isNotEmpty && selectedTime != null && selectedDate != null) {
      setState(() {
        _foodItems.add({
          'food': _foodController.text,
          'time': '${selectedTime!.hour.toString().padLeft(2, '0')}:${selectedTime!.minute.toString().padLeft(2, '0')}',
          'date': DateFormat('dd/MM/yy').format(selectedDate!),
        });
        _foodController.clear();
        selectedTime = null;
        selectedDate = null;
      });
    }
  }

  void _removeFoodItem(int index) {
    setState(() {
      _foodItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

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
                  padding: EdgeInsets.only(right: 24), // Distância ajustada
                  child: SizedBox(
                    width: (374 / 430) * screenWidth,
                    child: Column(
                      children: List.generate(_foodItems.length, (index) {
                        return Stack(
                          clipBehavior: Clip.none, // Permite o botão ficar fora do card
                          children: [
                            Card(
                              margin: EdgeInsets.only(
                                bottom: screenHeight * (8 / 932),
                                left: screenWidth * (16 / 430), // Ajusta o alinhamento do card
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * (16 / 430)),
                                title: Text(_foodItems[index]['food']!),
                                trailing: Text(_foodItems[index]['time']!),
                              ),
                            ),
                            Positioned(
                              right: -12, // Distância reduzida para o botão
                              top: (screenHeight * (16 / 932) / 2) - 12, // Ajusta a posição vertical
                              child: GestureDetector(
                                onTap: () => _removeFoodItem(index),
                                child: CircleAvatar(
                                  radius: 12, // Reduz o diâmetro do círculo
                                  backgroundColor: Colors.red,
                                  child: Icon(
                                    Icons.close,
                                    size: 14, // Ajusta o tamanho do ícone
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
                    data: () {
                      // Lógica para salvar a dieta
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
