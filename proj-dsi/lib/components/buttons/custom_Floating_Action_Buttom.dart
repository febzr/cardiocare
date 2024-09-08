import 'package:flutter/material.dart';

class customFloatingActionbutton extends StatelessWidget {
  final Function() onpress;
  final Icon icone;
  const customFloatingActionbutton({super.key,required this.onpress,required this.icone});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * (80 / 430),
        height: MediaQuery.of(context).size.width * (80 / 430),
        child: FloatingActionButton(
          onPressed: onpress,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
          backgroundColor: Theme.of(context).primaryColor,
          hoverColor: Theme.of(context).primaryColor,
          child: icone,
        ));
  }
}
