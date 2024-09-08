import 'package:flutter/material.dart';

class customTextFieldExtra extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController controller;

  const customTextFieldExtra(
      {super.key,
      required this.label,
      required this.hint,
      required this.controller});

  @override
  State<customTextFieldExtra> createState() => _customTextFieldExtra();
}

class _customTextFieldExtra extends State<customTextFieldExtra> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (374 / 430) * MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.004,
            ),
            child: Text(
              widget.label,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          SizedBox(
            height: (50 / 932) * MediaQuery.of(context).size.height, // Altura proporcional ao tamanho da tela
            child: TextFormField(
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
                contentPadding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.012,
                  bottom: MediaQuery.of(context).size.height * 0.012,
                  left: MediaQuery.of(context).size.width * 0.044,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
