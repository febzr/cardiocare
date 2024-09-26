import 'package:cardiocare/components/buttons/back_button.dart';
import 'package:flutter/material.dart';

class sobreoapp extends StatelessWidget {
  const sobreoapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Stack(children: [
          Padding(
              padding: EdgeInsets.only(
                  top: (30 / 932) * MediaQuery.of(context).size.height),
              child: const backButton()),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                margin: EdgeInsets.only(
                    top: (89 / 932) * MediaQuery.of(context).size.height),
                child: Text(
                  'Sobre o app',
                  style: Theme.of(context).textTheme.titleMedium,
                ))
          ])
        ]),
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.3),
                )
              ]),
          width: (300/430)*MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal:(12/430)*MediaQuery.of(context).size.width,vertical:(16/932)*MediaQuery.of(context).size.height),
          child: Column(
            children: [
              Text(
                'Esse aplicativo intitulado CardioCare foi feito para a cadeira de desenvolvimento de sistemas de informação, ministrada pelo professor Gabriel Alves. O CardioCare tem como objetivo ser um aplicativo de auxílio para quem sofre com problemas cardiovasculares, servindo como um aplicativo de registro de pressão, consumo de água, dieta e medicamentos, com a finalidade de tornar a relação médico-paciente mais clara e tornar o diagnóstico e tratamento da doença mais fácil e cômodo para o paciente.',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),textAlign: TextAlign.center,
              ),
              Text('Desenvolvido pelos alunos:',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),textAlign: TextAlign.center),
              Text('Gabriel Firmino',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),textAlign: TextAlign.center),
              Text(' Khadidja Moraes',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),textAlign: TextAlign.center),
              Text('Luiz Felipe Bezerra',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),textAlign: TextAlign.center),
              Text(' Raphael Cordeiro',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),textAlign: TextAlign.center),
              Text(' Yago Ferraz.',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),textAlign: TextAlign.center)
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              bottom: (20 / 932) * MediaQuery.of(context).size.height),
          child: Image.asset(
            'assets/images/logo_bottom.png',
          ),
        ),
      ],
    )));
  }
}
