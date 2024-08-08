import 'package:cardiocare/image/perfil/imagedisplay.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconic/iconic.dart';
import '../../service/signout.dart';

Drawer customDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          height: (250 / 932) * MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: Container(
            margin: EdgeInsets.only(
                left: (11 / 430) * MediaQuery.of(context).size.width),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Imagedisplay(width: 74, height: 74),
                  Padding(padding: EdgeInsets.only(
                        top: (10 / 932) * MediaQuery.of(context).size.height),
                    child: Text('${FirebaseAuth.instance.currentUser!.displayName}',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontFamily: 'inter',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold)),
                  ),
                  Padding(padding: EdgeInsets.only(top:(5/932)*MediaQuery.of(context).size.height),
                    
                    child: Text('${FirebaseAuth.instance.currentUser!.email}',
                        style: Theme.of(context).textTheme.displayLarge)
                  ),
                ]),
          ),
        ),
        ListTile(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.account_circle_outlined,
                  size: (30 / 432) * MediaQuery.of(context).size.width,
                  color: Theme.of(context).primaryColor),
              SizedBox(
                width: (10 / 430) * MediaQuery.of(context).size.width,
              ),
              Text(
                'Perfil',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.w500),
              )
            ],
          ),
          onTap: () {
            Navigator.of(context).pushNamed('perfil');
          },
        ),
        ListTile(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.accessibility,
                  size: (30 / 432) * MediaQuery.of(context).size.width,
                  color: Theme.of(context).primaryColor),
              SizedBox(
                width: (10 / 430) * MediaQuery.of(context).size.width,
              ),
              Text(
                'Acessibilidade',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.w500),
              )
            ],
          ),
          onTap: () {Navigator.of(context).pushNamed('acessibilidade');},
        ),
        ListTile(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.help_outline,
                  size: (30 / 432) * MediaQuery.of(context).size.width,
                  color: Theme.of(context).primaryColor),
              SizedBox(
                width: (10 / 430) * MediaQuery.of(context).size.width,
              ),
              Text(
                'Suporte',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.w500),
              )
            ],
          ),
          onTap: () {Navigator.of(context).pushNamed('suporte');},
        ),
        ListTile(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.info_outline,
                  size: (30 / 432) * MediaQuery.of(context).size.width,
                  color: Theme.of(context).primaryColor),
              SizedBox(
                width: (10 / 430) * MediaQuery.of(context).size.width,
              ),
              Text(
                'Sobre o Aplicativo',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.w500),
              )
            ],
          ),
          onTap: () {Navigator.of(context).pushNamed('sobre');},
        ),
        ListTile(
          title: Row(
            children: [
              Icon(
                Icons.logout,
                size: (30 / 432) * MediaQuery.of(context).size.width,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                width: (10 / 430) * MediaQuery.of(context).size.width,
              ),
              Text(
                'sair ',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.w500),
              )
            ],
          ),
          onTap: () {
            sair().deslogar();
          },
        ),
      ],
    ),
  );
}
