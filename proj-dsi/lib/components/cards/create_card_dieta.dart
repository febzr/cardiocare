import 'package:cardiocare/components/buttons/back_button.dart';
import 'package:cardiocare/components/inputs/custom_date_picker.dart';
import 'package:cardiocare/components/inputs/custom_hours_picker.dart';
import 'package:cardiocare/components/buttons/custom_adicionar.dart';
import 'package:cardiocare/components/inputs/custom_text_field.dart.dart';
import 'package:flutter/material.dart';
import 'card_dieta.dart';

class CreateCardDieta extends StatefulWidget {
  const CreateCardDieta({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreateCardDietaState createState() => _CreateCardDietaState();
}

class _CreateCardDietaState extends State<CreateCardDieta> {
  final TextEditingController nameAlimentoController = TextEditingController();
  DateTime? data;
  TimeOfDay? time;
  final List<Map<String, String>> alimentos = [];

  void _removerAlimento(int index) {
    setState(() {
      alimentos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Row(
                    children: [backButton()],
                  ),
                  Row(
                    children: [
                      Container(
                        height: (100 / 932) * size.height,
                        width: (237 / 430) * size.width,
                        margin: EdgeInsets.only(
                          top: (62 / 932) * size.height,
                          left: size.width * (100 / 430),
                        ),
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
              SizedBox(
                height: 0.11 * size.height,
                width: 0.85 * size.width,
                child: customTextField(
                  controller: nameAlimentoController,
                  label: "Nome do Alimento",
                  hint: "Escreva aqui",
                  validador: (x) {
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 0.06 * size.height,
                width: 0.85 * size.width,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.019,
                    bottom: size.height * 0.005,
                  ),
                  child: Text(
                    "Data e Hora do Consumo",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
              Container(
                width: 0.85 * size.width,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customDatePicker(
                      onchange: (picker) {
                        data = picker;
                      },
                    ),
                    const Spacer(),
                    customHourPicker(
                      onchange: (picker) {
                        time = picker;
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: 0.8 * size.width,
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.03,
                    bottom: size.height * 0.03,
                  ),
                  child: customAdicionar(
                    data: () {
                      if (nameAlimentoController.text.trim().isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Erro"),
                              content: const Text(
                                  "Nome do alimento não pode ser vazio"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        setState(() {
                          alimentos.add({
                            'nome': nameAlimentoController.text,
                            'hora': time != null ? time!.format(context) : '',
                          });
                        });
                        nameAlimentoController.clear();
                        data = null;
                        time = null;
                      }
                    },
                    height: 0.06,
                    width: 0.4,
                  ),
                ),
              ),
              ...alimentos.asMap().entries.map((entry) {
                int index = entry.key;
                Map<String, String> alimento = entry.value;
                return cardDieta(
                  nameAlimento: alimento['nome']!,
                  horario: alimento['hora']!,
                  onDelete: () => _removerAlimento(index),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
