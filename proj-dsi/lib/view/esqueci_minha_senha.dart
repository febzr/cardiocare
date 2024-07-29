import 'package:cardiocare/components/buttons/custom_button_large.dart';
import 'package:cardiocare/components/inputs/custom_text_field.dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class esqueciMinhaSenha extends StatelessWidget {
  final TextEditingController controlleremail = TextEditingController();
  final formKeyEmail = GlobalKey<FormState>();
  String? validadoremail(String? value) {
    if (value == null || value.isEmpty) {
      return 'preencha o seu email';
    } else if (RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return null;
    } else {
      return ' preencha um email valido';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      top: (132 / 932) * MediaQuery.of(context).size.height,
                      bottom: (24 / 932) * MediaQuery.of(context).size.height),
                  child: Image.asset('assets/images/recuperarsenha.png')),
              Container(
                width: (283/430)*MediaQuery.of(context).size.width,
                child: Text(
                  'Recuperação de Senha',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                )
              ),
              Container(
                width: (275/430)*MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: (31/932)*MediaQuery.of(context).size.height,bottom:(44/932)*MediaQuery.of(context).size.height ),
                child: Text(
                  'Esqueceu a senha? Sem problemas! Insira seu e-mail e te enviamos o link de recuperação',
                  style: Theme.of(context).textTheme.labelSmall,
                  textAlign: TextAlign.center,
                )
              ),
              Form(key: formKeyEmail,
                child: customTextField(
                    label: 'Email',
                    validador: validadoremail,
                    hint: 'digite seu e-mail',
                    controller: controlleremail)
              ),
             Padding(padding: EdgeInsets.only(top: (62/932)*MediaQuery.of(context).size.height,bottom:(100/932)*MediaQuery.of(context).size.height ),
               child: customButtonLarge(
                   data: () {
                    if(formKeyEmail.currentState!.validate()){
                     Navigator.pushReplacementNamed(context, 'login');}
                   },
                   label: 'RECUPERAR SENHA')
             ),
              Image.asset('assets/images/logo_bottom.png')
            ],
          ),
        ),
      ),
    );
  }
}
