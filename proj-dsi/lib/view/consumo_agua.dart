import 'package:cardiocare/components/buttons/back_button.dart';
import 'package:cardiocare/components/graficos/barras_agua.dart';
import 'package:cardiocare/control/agua/dados_agua.dart';
import 'package:cardiocare/control/utils/datetime_para_dataehora.dart';
import 'package:cardiocare/control/utils/is_dataigual.dart';
import 'package:cardiocare/model/agua/model_agua.dart';
import 'package:cardiocare/service/service.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class WaterScreen extends StatefulWidget {
  WaterScreen({super.key});

  @override
  State<WaterScreen> createState() => _WaterScreen();
}

class _WaterScreen extends State<WaterScreen> {
  int bebida = 0;
  int meta = 2000;
  int add = 0;
  bool outro = false;
  String? valoroutro = '';
  late modelagua dia;
  int count = 0;

  isdiacadastrado() async {
    dia = (await aguadodia())!;
    return isDataIgual(
            datetime1: DateTime.now(),
            datetime2: DateTime.fromMillisecondsSinceEpoch(dia.datatime))
        .isigual();
  }

  carregaragua() async {
    if (await isdiacadastrado()) {
      setState(() {
        count = 1;

        bebida = double.parse(dia.aguabebida.toString()).toInt();
      });
    }
    ;
  }

  adicionar() {
    setState(() {
      bebida = bebida + add;
    });
  }

  retirar() {
    setState(() {
      if (bebida > add) {
        bebida = bebida - add;
      } else {
        bebida = 0;
      }
    });
  }

  Future<String?> _showNumericInputDialog(BuildContext context) {
    final TextEditingController textController = TextEditingController();
    print(DateTime.now());
    print(DateTime.fromMillisecondsSinceEpoch(dia.datatime));

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Valor Personalizado'),
          content: TextField(
            controller: textController,
            keyboardType: TextInputType.number, // Só aceita números
            decoration: InputDecoration(
                hintText: 'Digite um número',
                hintStyle: Theme.of(context).textTheme.labelMedium),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                String userInput = textController.text;
                Navigator.of(context)
                    .pop(userInput); // Retorna o valor digitado
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (count < 1) {
      carregaragua();
    }
    barraagua barra = barraagua(
      agua_consumida: double.parse(bebida.toString()),
      meta: double.parse(meta.toString()),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: (30 / 932) * MediaQuery.of(context).size.height),
                    child: backButton(
                      fuc: () async {
                        try {
                          if (await isdiacadastrado()) {
                            service().adicionaragua(modelagua(
                                aguabebida: double.parse(bebida.toString()),
                                datatime: dia.datatime,
                                id: dia.id));
                          } else {
                            service().adicionaragua(modelagua(
                                aguabebida: double.parse(bebida.toString()),
                                datatime: DateTime.now().millisecondsSinceEpoch,
                                id: Uuid().v1()));
                          }
                        } catch (e) {
                          service().adicionaragua(modelagua(
                              aguabebida: double.parse(bebida.toString()),
                              datatime: DateTime.now().millisecondsSinceEpoch,
                              id: Uuid().v1()));
                        }
                      },
                    )),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      width: (180 / 430) * MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(
                          top: (89 / 932) * MediaQuery.of(context).size.height),
                      child: Text(
                        'Consumo de Água',
                        style: Theme.of(context).textTheme.titleMedium,
                      ))
                ])
              ]),
              Padding(
                  padding: EdgeInsets.only(
                      top: (44 / 932) * MediaQuery.of(context).size.height),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                            text: TextSpan(
                                children: [
                              TextSpan(
                                text: '${meta}ml',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                                text: '$bebida/',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        fontFamily: 'inter',
                                        fontStyle: FontStyle.normal)))
                      ],
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: (26 / 932) * MediaQuery.of(context).size.height),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [barra])),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        right: (33 / 430) * MediaQuery.of(context).size.width),
                    width: (54 / 430) *
                        MediaQuery.of(context).size.width, // Largura do círculo
                    height: (54 / 430) *
                        MediaQuery.of(context)
                            .size
                            .width, // Altura do círculo (igual à largura para ser um círculo)
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .primaryColor, // Cor de fundo usando a cor primária
                      shape: BoxShape.circle, // Define o formato circular
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.25), // Cor da sombra com opacidade
                          blurRadius: 4, // Desfocagem da sombra
                          spreadRadius: 0, // Quanto a sombra se espalha
                          offset: Offset(0, 4), // Deslocamento da sombra
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(Icons.remove), // Ícone de mais no centro
                      color: Colors.white, // Cor do ícone
                      onPressed: () {
                        retirar();
                      },
                    ),
                  ),
                  Center(
                    child: Container(
                      width: (188 / 430) * MediaQuery.of(context).size.width,
                      height: (326 / 932) * MediaQuery.of(context).size.height,
                      child: Image.asset(
                        'assets/gifs/copo.gif', // Substitua pelo caminho do seu GIF
                        fit: BoxFit
                            .fill, // Ajusta o GIF para cobrir todo o Container
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: (33 / 430) * MediaQuery.of(context).size.width),
                    width: (54 / 430) *
                        MediaQuery.of(context).size.width, // Largura do círculo
                    height: (54 / 430) *
                        MediaQuery.of(context)
                            .size
                            .width, // Altura do círculo (igual à largura para ser um círculo)
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .primaryColor, // Cor de fundo usando a cor primária
                      shape: BoxShape.circle, // Define o formato circular
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.25), // Cor da sombra com opacidade
                          blurRadius: 4, // Desfocagem da sombra
                          spreadRadius: 0, // Quanto a sombra se espalha
                          offset: Offset(0, 4), // Deslocamento da sombra
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add), // Ícone de mais no centro
                      color: Colors.white, // Cor do ícone
                      onPressed: () {
                        adicionar();
                      },
                    ),
                  ),
                ],
              ),
              Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width:
                              (160 / 420) * MediaQuery.of(context).size.width,
                          height:
                              (60 / 932) * MediaQuery.of(context).size.height,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                      backgroundColor: add == 200
                                          ? Theme.of(context).primaryColor
                                          : Colors.white)
                                  .copyWith(
                                      side:
                                          MaterialStateProperty.all(BorderSide(
                                color: Theme.of(context)
                                    .primaryColor, // Cor da borda
                                width: 2, // Largura da borda
                              ))),
                              onPressed: () {
                                setState(() {
                                  add = 200;
                                  outro = false;
                                });
                              },
                              child: Text(
                                '200ml',
                                style: TextStyle(
                                    color: add == 200
                                        ? Colors.white
                                        : Theme.of(context).primaryColor),
                              ))),
                      SizedBox(
                        width: (34 / 420) * MediaQuery.of(context).size.width,
                      ),
                      SizedBox(
                          width:
                              (160 / 420) * MediaQuery.of(context).size.width,
                          height:
                              (60 / 932) * MediaQuery.of(context).size.height,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                      backgroundColor: add == 300
                                          ? Theme.of(context).primaryColor
                                          : Colors.white)
                                  .copyWith(
                                      side:
                                          MaterialStateProperty.all(BorderSide(
                                color: Theme.of(context)
                                    .primaryColor, // Cor da borda
                                width: 2, // Largura da borda
                              ))),
                              onPressed: () {
                                setState(() {
                                  add = 300;
                                  outro = false;
                                });
                              },
                              child: Text(
                                '300ml',
                                style: TextStyle(
                                    color: add == 300
                                        ? Colors.white
                                        : Theme.of(context).primaryColor),
                              )))
                    ],
                  ),
                  SizedBox(
                    height: (24 / 920) * MediaQuery.of(context).size.height,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width:
                              (160 / 420) * MediaQuery.of(context).size.width,
                          height:
                              (60 / 932) * MediaQuery.of(context).size.height,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                      backgroundColor: add == 350
                                          ? Theme.of(context).primaryColor
                                          : Colors.white)
                                  .copyWith(
                                      side:
                                          MaterialStateProperty.all(BorderSide(
                                color: Theme.of(context)
                                    .primaryColor, // Cor da borda
                                width: 2, // Largura da borda
                              ))),
                              onPressed: () {
                                setState(() {
                                  add = 350;
                                  outro = false;
                                });
                              },
                              child: Text(
                                '350ml',
                                style: TextStyle(
                                    color: add == 350
                                        ? Colors.white
                                        : Theme.of(context).primaryColor),
                              ))),
                      SizedBox(
                        width: (34 / 420) * MediaQuery.of(context).size.width,
                      ),
                      SizedBox(
                          width:
                              (160 / 420) * MediaQuery.of(context).size.width,
                          height:
                              (60 / 932) * MediaQuery.of(context).size.height,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                      backgroundColor: outro
                                          ? Theme.of(context).primaryColor
                                          : Colors.white)
                                  .copyWith(
                                      side:
                                          MaterialStateProperty.all(BorderSide(
                                color: Theme.of(context)
                                    .primaryColor, // Cor da borda
                                width: 2, // Largura da borda
                              ))),
                              onPressed: () async {
                                setState(() async {
                                  String? result =
                                      await _showNumericInputDialog(context);
                                  if (result != null) {
                                    add = int.parse(result);
                                  }
                                  outro = true;
                                  valoroutro = result;
                                });
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${outro == true ? '${valoroutro}ml' : 'valor'}',
                                    style: TextStyle(
                                        color: outro
                                            ? Colors.white
                                            : Theme.of(context).primaryColor),
                                  ),
                                  outro
                                      ? SizedBox()
                                      : Text(
                                          'personalizado',
                                          style: TextStyle(
                                              color: outro
                                                  ? Colors.white
                                                  : Theme.of(context)
                                                      .primaryColor),
                                        )
                                ],
                              )))
                    ],
                  )
                ],
              )),
              Padding(
                  padding: EdgeInsets.only(
                      top: (45 / 920) * MediaQuery.of(context).size.height),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width:
                              (185 / 420) * MediaQuery.of(context).size.width,
                          height:
                              (60 / 930) * MediaQuery.of(context).size.height,
                          child: Column(
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.pushNamed(
                                          context, 'historico de agua')
                                      .then((_) {
                                    Navigator.of(context).pop();
                                    Navigator.pushNamed(
                                        context, 'consumo_agua');
                                  });
                                },
                                icon: Icon(Icons.history),
                                label: Text('HISTÓRICO'),
                              ),
                            ],
                          ))
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
