import 'package:flutter/material.dart';

class customTextFieldsmall extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool pesquisa;

  const customTextFieldsmall(
      {super.key,
      required this.label,
      required this.hint,required this.controller, required this.pesquisa});

  @override
  State<customTextFieldsmall> createState() => _customTextFieldsmall();
}

class _customTextFieldsmall extends State<customTextFieldsmall> {
  bool labelcor = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: (374 / 430) * MediaQuery.of(context).size.width,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.005,left: MediaQuery.of(context).size.width * (5/430)),
              child: Text(widget.label,
                  style: labelcor
                      ? Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: Theme.of(context).colorScheme.error)
                      : Theme.of(context).textTheme.labelLarge)),
          TextFormField(
            controller: widget.controller,
            style: Theme.of(context).textTheme.labelMedium,
            decoration: InputDecoration(
              prefixIcon: widget.pesquisa? Icon(Icons.search,color: Theme.of(context).primaryColor,):null,
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
                    top: MediaQuery.of(context).size.height * 0.019,
                    bottom: MediaQuery.of(context).size.height * 0.019,
                    left: MediaQuery.of(context).size.width * 0.044)),
          )
        ]));
  }
}
