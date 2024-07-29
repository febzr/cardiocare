import 'package:flutter/material.dart';

class displayLarge extends StatelessWidget{
  final String label;
  final String image;
  final Function() ontap;
  const displayLarge({super.key,required this.label, required this.image,required this.ontap});

  
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.ontap,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            width: (178/430)*MediaQuery.of(context).size.width,
            height: (207/932)*MediaQuery.of(context).size.height,
            decoration: BoxDecoration(borderRadius:  BorderRadius.circular(20)),
            child: 
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  
                  child: Image.asset(this.image,fit: BoxFit.cover,)
                ),
          ),Container(margin: EdgeInsets.only(left:10,bottom: 17),
          width: (139/430)*MediaQuery.of(context).size.width,
            child: Text(this.label,style: Theme.of(context).textTheme.displayMedium,)
          )
        ]
      )
    );
  }
}