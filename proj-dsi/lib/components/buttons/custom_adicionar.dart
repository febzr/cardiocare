import 'package:flutter/material.dart';

class customAdicionar extends StatelessWidget {
  final Function data;
  final double height;
  final double width;
  const customAdicionar({
    super.key,
    required this.data,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * width,
      height: MediaQuery.of(context).size.height * height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
        onPressed: () {
          data();
        },
        child: Text(
          '+ Adicionar',
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }
}
