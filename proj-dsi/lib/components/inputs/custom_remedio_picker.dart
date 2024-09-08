import 'package:flutter/material.dart';

class customRemedioPicker extends StatefulWidget {
  final String hint;
  final String? Function(String?) validador;
  final TextEditingController controller;
  final double height;
  final double width;

  const customRemedioPicker(
      {super.key,
      required this.validador,
      required this.hint,
      required this.controller,
      required this.height,
      required this.width});

  @override
  State<customRemedioPicker> createState() => _customTextField();
}

class _customTextField extends State<customRemedioPicker> {
  bool labelcor = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: (341 / 430) * MediaQuery.of(context).size.width,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextFormField(
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
                fillColor: Theme.of(context).cardColor,
                filled: true,
                hintStyle: Theme.of(context).textTheme.labelMedium,
                hintText: widget.hint,
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor,width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor,width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  
                ),
                contentPadding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.024,
                    bottom: MediaQuery.of(context).size.height * 0.024,
                    left: MediaQuery.of(context).size.width * 0.044)),
          )
        ]));
  }
}
