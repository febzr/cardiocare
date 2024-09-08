import 'package:flutter/material.dart';

class customButtonLarge extends StatelessWidget {
  final Function data;
  final String label;
  const customButtonLarge({super.key, required this.data, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*(341 / 430),
      height: MediaQuery.of(context).size.height*0.059,
        child: ElevatedButton(
            onPressed: () {
              data();
            },
            child: Text(label)));
  }
}
