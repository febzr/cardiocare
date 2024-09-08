import 'package:flutter/material.dart';

class backButton extends StatelessWidget{
  final Function? fuc;
  const backButton({super.key, this.fuc});

  @override
  Widget build(BuildContext context) {
    return  Container(
                    margin: EdgeInsets.only(
                        top: (24 / 932) * MediaQuery.of(context).size.height,
                        left: (18 / 430) * MediaQuery.of(context).size.width),
                    
                    decoration: ShapeDecoration(
                        color: Theme.of(context).cardColor,
                        shape: const CircleBorder()),
                    child: IconButton(
                      padding: EdgeInsets.all(
                        (13 / 932) * MediaQuery.of(context).size.height),
                        onPressed: () {
                          if(fuc!=null){
                            fuc!();
                          }
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).primaryColor,
                          size: 30,
                        )));
  }
}