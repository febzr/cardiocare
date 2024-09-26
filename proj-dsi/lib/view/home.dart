// ignore_for_file: prefer_const_constructors

import 'package:cardiocare/components/bottombar/bottom_bar.dart';
import 'package:cardiocare/components/display/display_small.dart';
import 'package:cardiocare/components/drawer/drawer.dart';
import 'package:cardiocare/components/display/display_large.dart';
import 'package:cardiocare/components/graficos/home_barras.dart';
import 'package:cardiocare/components/graficos/home_circulo.dart';
import 'package:cardiocare/image/perfil/imagedisplay.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  _home createState() => _home();
}

class _home extends State<home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: customDrawer(context),
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              height: (150 / 932) * MediaQuery.of(context).size.height,
              child: SafeArea(
                  child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: (23 / 430) * MediaQuery.of(context).size.width,
                        right: (20 / 430) * MediaQuery.of(context).size.width),
               
                    child: Imagedisplay(width: 50, height: 50)
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       '${ FirebaseAuth.instance.currentUser!.displayName}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text('${ FirebaseAuth.instance.currentUser!.email}',
                          style: Theme.of(context).textTheme.displayLarge)
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
                  top: (20 / 932) * MediaQuery.of(context).size.height,
                  bottom: (37 / 932) * MediaQuery.of(context).size.height),
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
                            Navigator.pushNamed(context, 'consumo_agua');
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
                            label: 'Remédios',
                            image: 'assets/images/displayremedio.png',
                            ontap: () {
                              Navigator.pushNamed(context, 'remedio');
                            })),
                    displayLarge(
                        label: 'Dieta',
                        image: 'assets/images/displaycomida.png',
                        ontap: () {
                          Navigator.pushNamed(context, 'dieta');
                        })
                  ])
                ],
              ),
            ),
            Container(
              width: (377 / 430) * MediaQuery.of(context).size.width,
              height: (250 / 932) * MediaQuery.of(context).size.height,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25), 
                 
                  blurRadius: 4,
                  offset: Offset(0, 4)
                ),
              ],
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
                                'Água x dia',
                                style: Theme.of(context).textTheme.titleSmall,
                              )),
                          Container(width: MediaQuery.of(context).size.width*0.33,height: MediaQuery.of(context).size.height*0.11,
                            child: BarGrafico()
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height *
                                (37 / 932)),
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
                          Container(width: MediaQuery.of(context).size.width*0.33,height: MediaQuery.of(context).size.height*0.11,
                            child: homeCircular()
                          )
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
