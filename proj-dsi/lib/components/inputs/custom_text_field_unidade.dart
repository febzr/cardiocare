import 'package:flutter/material.dart';

class CustomTextFieldUnidade extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final Function(String) onUnitChanged; // Callback para unidade selecionada
  final String inicial;

  const CustomTextFieldUnidade({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.onUnitChanged, // Callback passado pelo pai
    required this.inicial,
  });

  @override
  State<CustomTextFieldUnidade> createState() => _CustomTextFieldUnidadeState();
}

class _CustomTextFieldUnidadeState extends State<CustomTextFieldUnidade> {
  String? selectedUnit; // Variável para armazenar a unidade selecionada
  List<String> units = ['uni', 'g', 'mg', 'ml']; // Lista de unidades

  @override
  void initState() {
    super.initState();
    selectedUnit = widget.inicial; // Inicializa com a unidade inicial
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: (374 / 430) * MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.005,
                  left: MediaQuery.of(context).size.width * (5 / 430),
                ),
                child: Text(
                  widget.label,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              TextFormField(
                controller: widget.controller,
                style: Theme.of(context).textTheme.labelMedium,
                decoration: InputDecoration(
                  fillColor: Theme.of(context).cardColor,
                  filled: true,
                  hintStyle: Theme.of(context).textTheme.labelMedium,
                  hintText: widget.hint,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  contentPadding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.019,
                    bottom: MediaQuery.of(context).size.height * 0.019,
                    left: MediaQuery.of(context).size.width * 0.044,
                  ),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        color: Theme.of(context).primaryColor,
                        width: 1, // Largura da barra de divisão
                        height: MediaQuery.of(context).size.height * 0.059,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: DropdownButton<String>(
                          value: selectedUnit,
                          underline: SizedBox(), // Remove a linha padrão
                          icon: const Icon(Icons.arrow_drop_down),
                          items: units.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedUnit = newValue; // Atualiza a unidade selecionada
                            });
                            // Chama o callback para enviar a unidade para o widget pai
                            widget.onUnitChanged(newValue!);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
