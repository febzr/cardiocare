import 'package:flutter/material.dart';

class customFloatingActionbutton extends StatelessWidget {
  final Function() onpress;
  customFloatingActionbutton({super.key,required this.onpress});

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
          hoverColor: Colors.blue,
          child: Icon(
            Icons.add_rounded,

            size: MediaQuery.of(context).size.width * (48 / 430),
            color: Colors.white,
          ),
        ));
  }
}
