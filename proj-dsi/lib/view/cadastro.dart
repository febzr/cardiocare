import 'package:cardiocare/components/buttons/back_button.dart';
import 'package:cardiocare/components/buttons/custom_button_large.dart';
import 'package:cardiocare/components/inputs/custom_text_field.dart.dart';
import 'package:cardiocare/components/inputs/custom_text_field_senha.dart';
import 'package:cardiocare/service/autenticacao_service.dart';
import 'package:flutter/material.dart';

class cadastro extends StatelessWidget {
  final formKeyCadastro = GlobalKey<FormState>();
  final TextEditingController controllerNome = TextEditingController();
  final TextEditingController controlleremail = TextEditingController();
  final TextEditingController controllertelefone = TextEditingController();
  final TextEditingController controllersenha = TextEditingController();

  cadastro({super.key});

  String? validadornome(String? value) {
    if (value == null || value.isEmpty) {
      return 'preencha o seu nome';
    } else if (RegExp(r'^[a-zA-Z]{2,}\s[a-zA-Z]+$').hasMatch(value)) {
      return null;
    } else {
      return ' preencha nome e sobrenome';
    }
  }

  String? validadoremail(String? value) {
    if (value == null || value.isEmpty) {
      return 'preencha o seu email';
    } else if (RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return null;
    } else {
      return ' preencha um email valido';
    }
  }

  String? validadortelefone(String? value) {
    if (value == null || value.isEmpty) {
      return 'preencha o seu telefone';
    } else if (RegExp(r'\d{11}').hasMatch(value)) {
      return null;
    } else {
      return ' preencha seu telefone no formato correto';
    }
  }

  String? validadorsenha(String? value) {
    if (value == null || value.isEmpty) {
      return 'coloque uma senha';
    } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z]).{8,}$').hasMatch(value)) {
      return 'coloque uma senha com letras maiusculas e minusculas';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack( children: [
                const Row(
                  children: [
                    backButton(),
                  ]
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: (60/932)*MediaQuery.of(context).size.height),
                      width: (103 / 430) * MediaQuery.of(context).size.width,
                      height: (72 / 932) * MediaQuery.of(context).size.height,
                      child: Image.asset(
                        'assets/images/usuarios_cadastro.png',
                        fit: BoxFit.fill,
                      ))
                ]
              )]),
              Padding(
                  padding: EdgeInsets.only(
                      top: (15 / 932) * MediaQuery.of(context).size.height,
                      bottom: (5 / 932) * MediaQuery.of(context).size.height),
                  child: Text(
                    'Cadastro',
                    style: Theme.of(context).textTheme.titleLarge,
                  )),
              SizedBox(
                  width: ((254 / 430) * MediaQuery.of(context).size.width),
                  child: Text('Preencha os dados solicitados com atenção',
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center)),
              Padding(
                  padding: EdgeInsets.only(
                      top: (5 / 932) * MediaQuery.of(context).size.height),
                  child: Form(
                      key: formKeyCadastro,
                      child: Column(children: [
                        customTextField(
                            label: 'Nome',
                            validador: validadornome,
                            hint: 'fulano de tal',
                            controller: controllerNome),
                        Padding(
                          padding: EdgeInsets.only(
                              top: (10 / 932) *
                                  MediaQuery.of(context).size.height,
                              bottom: (10 / 932) *
                                  MediaQuery.of(context).size.height),
                          child: customTextField(
                              label: 'Email',
                              validador: validadoremail,
                              hint: 'fulana@email.com',
                              controller: controlleremail),
                        ),
                        customTextField(
                            label: 'Telefone',
                            validador: validadortelefone,
                            hint: '(xx) xxxxx-xxxx',
                            controller: controllertelefone),
                        Padding(
                            padding: EdgeInsets.only(
                                top: (5 / 932) *
                                    MediaQuery.of(context).size.height,
                                bottom: (41 / 932) *
                                    MediaQuery.of(context).size.height),
                            child: customTextFieldsenha(
                                label: 'Senha',
                                validador: validadorsenha,
                                hint: '***********',
                                controller: controllersenha))
                      ]))),
              customButtonLarge(
                  data: () async {
                    if (formKeyCadastro.currentState!.validate()) {
                      final auth = Cadastrar(email: controlleremail.text, senha: controllersenha.text, name: controllerNome.text);
                      final feito = await auth.register();
                      if (feito==true){
                      Navigator.of(context).pushReplacementNamed('confirmacao_de_registro');}
                    }
                    
                  },
                  label: 'CADASTRAR'),
              Padding(
                padding: EdgeInsets.only(
                    top: (20 / 932) * MediaQuery.of(context).size.height,
                    bottom: (20 / 932) * MediaQuery.of(context).size.height),
                child: Image.asset('assets/images/logo_bottom.png'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
