import 'package:cardiocare/components/buttons/custom_button_large.dart';
import 'package:cardiocare/components/inputs/custom_text_field.dart.dart';
import 'package:cardiocare/components/inputs/custom_text_field_senha.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controllerLogin = TextEditingController();
  final TextEditingController controllerSenha = TextEditingController();
  String? validatorlogin(String? value) {
    if (value == null || value.isEmpty) {
      return 'coloco um email';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'coloque um email valido';
    } else {
      return null;
    }
  }

  String? validatorsenha(String? value) {
    if (value == null || value.isEmpty) {
      return 'coloque uma senha';
    } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z]).{8,}$').hasMatch(value)) {
      return 'coloque a senha corretamente';
    } else {
      return null;
    }
  }

  Widget build(BuildContext context) {
   
    return Scaffold(
      
        body:Container(
          
          child: SingleChildScrollView(child: Container(
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
          children: [
            Padding(
                padding: EdgeInsets.only(
                    top: (100 / 932) * MediaQuery.of(context).size.height),
                child: Image.asset('assets/images/logo_login.png')),
            Padding(
                padding: EdgeInsets.only(
                    top: (20 / 932) * MediaQuery.of(context).size.height,
                    bottom: (10 / 932) * MediaQuery.of(context).size.height),
                child: Text(
                  'Login',
                  style: Theme.of(context).textTheme.titleLarge,
                )),
            Padding(
                padding: EdgeInsets.only(
                    bottom: (56 / 932) * MediaQuery.of(context).size.height),
                child: Container(
                    width: (270 / 430) * MediaQuery.of(context).size.width,
                    child: Text(
                      'Olá, seja bem-vindo de volta. Insira seu login e senha.',
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ))),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    customTextField(
                      controller: controllerLogin,
                      label: 'Email',
                      validador: validatorlogin,
                      hint: 'exemplo@gmail.com',
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: (12 / 932) * MediaQuery.of(context).size.height,
                            bottom:
                                (33 / 932) * MediaQuery.of(context).size.height),
                        child: customTextFieldsenha(
                            label: 'Senha',
                            validador: validatorsenha,
                            hint: '*********',
                            controller: controllerSenha)),
                    customButtonLarge(
                      data: () {
                        if (_formKey.currentState!.validate()) {
                         Navigator.pushReplacementNamed(context, 'home');
                        }
                        ;
                      },
                      label: 'ENTRAR',
                    ),
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: (38 / 932) * MediaQuery.of(context).size.height,
                    bottom: (15 / 932) * MediaQuery.of(context).size.height),
                child: InkWell(
                    child: Text(
                      'Cadastrar-se',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    onTap: () {
                       Navigator.of(context).pushNamed('cadastro');
                    })),
            InkWell(
                child: Text(
                  'Esqueci minha senha',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                onTap: () {
                   Navigator.of(context).pushReplacementNamed('recuperar_senha')
                 ;
                }),
            Padding(
                padding: EdgeInsets.only(
                    top: (50 / 932) * MediaQuery.of(context).size.height,bottom:(20 / 932) * MediaQuery.of(context).size.height ),
                child: Image.asset('assets/images/logo_bottom.png'))
          ],
              )
            ])))
        ));
  }
}
