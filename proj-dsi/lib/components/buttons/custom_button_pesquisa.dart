import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class customButtonPesquisa extends StatelessWidget {
  final Function data;
  final String label;
  final double height;
  final double width;
  const customButtonPesquisa({super.key, required this.data, required this.label, required this.height, required this.width});

  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * width,
      height: MediaQuery.of(context).size.height * height,
        child: ElevatedButton(
            onPressed: () {
              data();
            },
            child: Text(label)));
  }
}