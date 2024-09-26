import 'package:flutter/material.dart';

class CustomCheckboxWithTitle extends StatefulWidget {
  final String title;  // Título acima do checkbox
  final String description;  // Texto ao lado do checkbox
  final Function(bool) onChanged;  // Callback para passar o valor true/false

  const CustomCheckboxWithTitle({
    Key? key,
    required this.title,
    required this.description,
    required this.onChanged,  // Recebe a função de callback
  }) : super(key: key);

  @override
  _CustomCheckboxWithTitleState createState() =>
      _CustomCheckboxWithTitleState();
}

class _CustomCheckboxWithTitleState extends State<CustomCheckboxWithTitle> {
  bool isChecked = false;  // Estado inicial do checkbox

  @override
  Widget build(BuildContext context) {
    return Container(
       width: (374 / 430) * MediaQuery.of(context).size.width,
       padding:EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.005,
                  left: MediaQuery.of(context).size.width * (5 / 430),
                ),
       
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,  // Exibe o título
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                  widget.onChanged(isChecked);  // Chama o callback com o valor atualizado
                },
              ),
              Expanded(
                child: Text(
                  widget.description,  // Exibe a descrição ao lado do checkbox
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}
