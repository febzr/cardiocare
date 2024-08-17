import 'package:cardiocare/components/bottombar/bottom_bar.dart';
import 'package:cardiocare/components/display/display_small.dart';
import 'package:cardiocare/components/drawer/drawer.dart';
import 'package:cardiocare/components/display/display_large.dart';
import 'package:cardiocare/components/graficos/home_barras.dart';
import 'package:cardiocare/components/graficos/home_circulo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class home extends StatefulWidget {
  @override
  _home createState() => _home();
}

class _home extends State<home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: customDrawer,
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              height: (160 / 932) * MediaQuery.of(context).size.height,
              child: SafeArea(
                  child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: (23 / 430) * MediaQuery.of(context).size.width,
                        right: (20 / 430) * MediaQuery.of(context).size.width),
                    width: (50 / 430) * MediaQuery.of(context).size.width,
                    height: (50 / 430) * MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: ClipOval(
                        child: Image.asset(
                      'assets/images/user.png',
                      fit: BoxFit.fill,
                    )),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'fulano de tal',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text('64 anos',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14))
                    ],
                  ),
                  Spacer(),
                  Container(
                      margin: EdgeInsets.only(
                          right:
                              (35 / 430) * MediaQuery.of(context).size.width),
                      child: IconButton(
                          onPressed: () {
                            _scaffoldKey.currentState!.openEndDrawer();
                          },
                          icon: Icon(
                            Icons.menu,
                            color: Theme.of(context).cardColor,
                            size: 30,
                          )))
                ],
              )),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                  top: (31 / 932) * MediaQuery.of(context).size.height,
                  bottom: (20 / 932) * MediaQuery.of(context).size.height),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          right:
                              (20 / 430) * MediaQuery.of(context).size.width),
                      child: Column(children: [
                        Padding(
                            padding: EdgeInsets.only(
                                bottom: (15 / 932) *
                                    MediaQuery.of(context).size.height),
                            child: displayLarge(
                              ontap: () {
                                Navigator.pushNamed(context, 'diario_de_pressao');
                              },
                              label: 'Diário de pressão',
                              image: 'assets/images/displaydiariodepressao.png',
                            )),
                        displaySmall(
                          ontap: () {
                            print('agua');
                          },
                          image: 'assets/images/displayconsumodeagua.png',
                          label: 'Consumo de Água',
                        )
                      ])),
                  Column(children: [
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: (15 / 932) *
                                MediaQuery.of(context).size.height),
                        child: displaySmall(
                            label: 'remédios',
                            image: 'assets/images/displayremedio.png',
                            ontap: () {
                              print('remedio');
                            })),
                    displayLarge(
                        label: 'Dieta',
                        image: 'assets/images/displaycomida.png',
                        ontap: () {
                          print('comida');
                        })
                  ])
                ],
              ),
            ),
            Container(
              width: (377 / 430) * MediaQuery.of(context).size.width,
              height: (260 / 932) * MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).primaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      (22 / 932),
                                  bottom: MediaQuery.of(context).size.height *
                                      (26 / 932)),
                              child: Text(
                                'pressão x dia',
                                style: Theme.of(context).textTheme.titleSmall,
                              )),
                          barGrafico()
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height *
                                (22 / 932)),
                        color: Colors.white,
                        width: 3,
                        height:
                            (100 / 932) * MediaQuery.of(context).size.height,
                      ),
                      Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      (22 / 932),
                                  bottom: MediaQuery.of(context).size.height *
                                      (26 / 932)),
                              child: Text(
                                'pressão x dia',
                                style: Theme.of(context).textTheme.titleSmall,
                              )),
                          homeCircular()
                        ],
                      )
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: (12 / 932) * MediaQuery.of(context).size.height,
                          left: (25 / 932) * MediaQuery.of(context).size.width),
                      child: Text(
                        'Gráficos',
                        style: Theme.of(context).textTheme.displayMedium,
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          left: (28 / 932) * MediaQuery.of(context).size.width),
                      child: Text(
                        'clique no card e veja os detalhes',
                        style: Theme.of(context).textTheme.titleSmall,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigatorBar(),
    );
  }
}
