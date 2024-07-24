import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class cardsData extends StatelessWidget {
  final TextEditingController controller;
  final String titulo;
  final String subtitulo;
  cardsData({super.key, required this.controller,required this.titulo,required this.subtitulo});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: (321/430)*size.width,
     
      margin: EdgeInsets.only(bottom: (18/932)*size.height),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titulo,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
              subtitulo,
                style: Theme.of(context).textTheme.labelMedium,
              )
            ],
          ),
          Container(
            width: (128 / 430) * size.width,
            height: (65/932)*size.height,
            child: TextFormField(
              
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
           
              inputFormatters: [LengthLimitingTextInputFormatter(6)],
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: (15 / 430) * size.width),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor))),
            ),
          )
        ],
      ),
    );
  }
}
