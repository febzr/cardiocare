import 'package:flutter/material.dart';


class SwitchExample extends StatefulWidget {
  @override
  _SwitchExampleState createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _isSwitched,
      onChanged: (value) {
        setState(() {
          _isSwitched = value;
        });
      },
      activeColor: Colors.white,
       materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      inactiveThumbColor: Colors.white, // Cor do "thumb" quando o switch está desativado
      activeTrackColor: Theme.of(context).primaryColor, // Cor da trilha quando o switch está desativado
      inactiveTrackColor:Colors.grey ,
    );
  }
}
