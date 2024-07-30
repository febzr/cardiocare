import 'package:flutter/material.dart';

class customTextFieldsenha extends StatefulWidget {
  final String label;
  final String hint;
  final String? Function(String?) validador;
  final TextEditingController controller;

  const customTextFieldsenha(
      {super.key,
      required this.label,
      required this.validador,
      required this.hint,
      required this.controller});

  State<customTextFieldsenha> createState() => _customTextFieldSenha();
}

class _customTextFieldSenha extends State<customTextFieldsenha> {
  bool labelcor = false;
  bool senhaVisivel = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: (341 / 430) * MediaQuery.of(context).size.width,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.005),
              child: Text(widget.label,
                  style: labelcor
                      ? Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: Theme.of(context).errorColor)
                      : Theme.of(context).textTheme.labelLarge)),
          TextFormField(
            obscureText: !senhaVisivel,
            controller: widget.controller,
            validator: (value) {
              String? result = widget.validador(value);
              if (result == null) {
                setState(() {
                  labelcor = false;
                });
              } else {
                setState(() {
                  labelcor = true;
                });
              }
              return result;
            },
            style: Theme.of(context).textTheme.labelMedium,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        senhaVisivel = !senhaVisivel;
                      });
                    },
                    icon: Icon(senhaVisivel
                        ? Icons.visibility
                        : Icons.visibility_off)),
                fillColor: Theme.of(context).cardColor,
                filled: true,
                hintStyle: Theme.of(context).textTheme.labelMedium,
                hintText: widget.hint,
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                contentPadding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.024,
                    bottom: MediaQuery.of(context).size.height * 0.024,
                    left: MediaQuery.of(context).size.width * 0.044)),
          )
        ]));
  }
}
