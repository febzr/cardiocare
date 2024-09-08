import 'package:flutter/material.dart';

class customButtonAdd extends StatelessWidget {
  final Function data;
  final String label;
  const customButtonAdd({super.key, required this.data, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * (235 / 430),
      height: MediaQuery.of(context).size.height * 0.046,
      child: ElevatedButton(
        onPressed: () {
          data();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white, // Cor de fundo do botão
          foregroundColor: Colors.red, // Cor do texto do botão
          elevation: 0, // Remove a sombra do botão, se necessário
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Ajuste o raio conforme necessário
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza o conteúdo
          mainAxisSize: MainAxisSize.min, // Ajusta o tamanho do Row ao tamanho do conteúdo
          children: [
            Icon(Icons.add, color: Colors.red), // Ícone de "+"
            SizedBox(width: 8), // Espaçamento entre o ícone e o texto
            Text(
              label,
              style: TextStyle(
                color: Colors.red, // Cor do texto
              ),
            ),
          ],
        ),
      ),
    );
  }
}
