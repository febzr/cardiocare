import 'package:flutter/material.dart';

class CustomButtonDelete extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomButtonDelete({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.close, color: Colors.red),
      onPressed: onPressed,
    );
  }
}
