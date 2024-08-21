import 'package:cardiocare/components/buttons/custom_button_large.dart';
import 'package:flutter/material.dart';

class confirmaoDeRegistro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: (187 / 932) * MediaQuery.of(context).size.height,
                  bottom: (50 / 932) * MediaQuery.of(context).size.height),
              child: Container(
                  width: (332 / 430) * MediaQuery.of(context).size.width,
                  child: Text(
                    'Seu cadastro foi realizado com sucesso!',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  )),
            ),
            Image.asset('assets/images/confirmacaodecadastro.png'),
            Padding(
              padding: EdgeInsets.only(top:(67/932)*MediaQuery.of(context).size.height,bottom:(137/932)*MediaQuery.of(context).size.height),
              child: customButtonLarge(data: (){Navigator.of(context).pushReplacementNamed('roteador');}, label: 'LOGIN')
            ),
            Image.asset('assets/images/logo_bottom.png')
          ],
        ),
      ),
    );
  }
}
