import 'package:flutter/material.dart';
import 'package:iconic/iconic.dart';

class bottomNavigatorBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentRout = ModalRoute.of(context)?.settings.name;
    return Container(
      height: (75 / 932) * MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              width: (90 / 430) * MediaQuery.of(context).size.width,
              child: Material(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      if(currentRout!='roteador')
                      Navigator.pushReplacementNamed(context, 'roteador');
                    },
                    splashColor: Theme.of(context).splashColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Iconic.home_straight,
                            size: 24, color: Colors.white),
                        Text(
                          'home',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 8),
                        )
                      ],
                    ),
                  ))),
          Container(
              
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              width: (90 / 430) * MediaQuery.of(context).size.width,
              child: Material(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      if(currentRout!='diario_de_pressao'){
                      Navigator.pushNamed(context, 'diario_de_pressao');}
                    },
                    splashColor: Theme.of(context).splashColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      
                      children: [
                        Icon(Icons.map,
                            size: 24, color: Colors.white),
                        Text(
                          'Mapas',textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 8),
                        )
                      ],
                    ),
                  ))),
          Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              width: (77 / 430) * MediaQuery.of(context).size.width,
              child: Material(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      print(currentRout);
                    },
                    splashColor: Theme.of(context).splashColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Iconic.medicine,
                            size: 24, color: Colors.white),
                        Text(
                          'Medicamentos',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 8),
                        )
                      ],
                    ),
                  ))),
          Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              width: (77 / 430) * MediaQuery.of(context).size.width,
              child: Material(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      Navigator.of(context).pushNamed('perfil');
                    },
                    splashColor: Theme.of(context).splashColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person_outline,
                            size: 24, color: Colors.white),
                        Text(
                          'Perfil',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 8),
                        )
                      ],
                    ),
                  ))),
        ],
      ),
    );
  }
}
