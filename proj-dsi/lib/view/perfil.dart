import 'package:cardiocare/components/bottombar/bottom_bar.dart';
import 'package:cardiocare/components/buttons/back_button.dart';
import 'package:cardiocare/components/buttons/custom_Floating_Action_Buttom.dart';
import 'package:cardiocare/image/perfil/imagedisplay.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigatorBar(),
      body: Container(
        child: Column(
          children: [
            Container(
              height: (400 / 932) * MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        color: Color.fromARGB(63, 0, 0, 0))
                  ],
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Column(children: [
                Stack(children: [
                  Padding(
                      padding: EdgeInsets.only(
                          top: (30 / 932) * MediaQuery.of(context).size.height),
                      child: const backButton()),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                        margin: EdgeInsets.only(
                            top: (89 / 932) *
                                MediaQuery.of(context).size.height),
                        child: Text(
                          'Perfil',
                          style: Theme.of(context).textTheme.displaySmall,
                        ))
                  ])
                ]),
                Padding(
                    padding: EdgeInsets.only(
                        top: (23 / 932) * MediaQuery.of(context).size.height),
                    child: const Imagedisplay(
                      width: 106,
                      height: 106,
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: (26 / 932) * MediaQuery.of(context).size.height),
                    child: Text(
                        '${FirebaseAuth.instance.currentUser!.displayName}',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontStyle: FontStyle.normal,
                                fontFamily: 'inter'))),
                Padding(
                    padding: EdgeInsets.only(
                        top: (12 / 932) * MediaQuery.of(context).size.height),
                    child: Text(
                      '${FirebaseAuth.instance.currentUser!.email}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ))
              ]),
            ),
            Container(
                margin: EdgeInsets.only(
                    left: (47 / 430) * MediaQuery.of(context).size.width,
                    top: (46 / 932) * MediaQuery.of(context).size.height),
                child: Row(children: [
                  Icon(
                    Icons.account_box_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 41,
                  ),
                  SizedBox(
                    width: (20 / 430) * MediaQuery.of(context).size.width,
                  ),
                  Text(
                    '${FirebaseAuth.instance.currentUser!.displayName}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  )
                ])),
            
            Container(
                margin: EdgeInsets.only(
                    left: (47 / 430) * MediaQuery.of(context).size.width,
                    top: (20 / 932) * MediaQuery.of(context).size.height),
                child: Row(children: [
                  Icon(
                    Icons.email_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 41,
                  ),
                  SizedBox(
                    width: (20 / 430) * MediaQuery.of(context).size.width,
                  ),
                  Text(
                    '${FirebaseAuth.instance.currentUser!.email}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  )
                ])),
          ],
        ),
      ),
      /*floatingActionButton: customFloatingActionbutton(
        onpress: () {},
        icone: const Icon(
          Icons.edit_outlined,
          size: 33,
        ),
      ),*/
    );
  }
}
