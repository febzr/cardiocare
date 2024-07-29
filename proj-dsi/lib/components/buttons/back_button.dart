import 'package:flutter/material.dart';

class backButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Container(
                    margin: EdgeInsets.only(
                        top: (24 / 932) * MediaQuery.of(context).size.height,
                        left: (18 / 430) * MediaQuery.of(context).size.width),
                    
                    decoration: ShapeDecoration(
                        color: Theme.of(context).cardColor,
                        shape: CircleBorder()),
                    child: IconButton(
                      padding: EdgeInsets.all(
                        (13 / 932) * MediaQuery.of(context).size.height),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).primaryColor,
                          size: 30,
                        )));
  }
}