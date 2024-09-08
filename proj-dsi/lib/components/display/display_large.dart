import 'package:flutter/material.dart';

class displayLarge extends StatelessWidget{
  final String label;
  final String image;
  final Function() ontap;
  const displayLarge({super.key,required this.label, required this.image,required this.ontap});

  
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      color: Colors.transparent,
      child: InkWell(
        onTap: ontap,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              width: (190/430)*MediaQuery.of(context).size.width,
              height: (207/932)*MediaQuery.of(context).size.height,
              decoration: BoxDecoration(borderRadius:  BorderRadius.circular(20),boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25), 
                 
                  blurRadius: 4,
                  offset: const Offset(0, 4)
                ),
              ],),
              child: 
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    
                    child: Image.asset(image,fit: BoxFit.cover,)
                  ),
            ),Container(margin: const EdgeInsets.only(left:10,bottom: 17),
            width: (139/430)*MediaQuery.of(context).size.width,
              child: Text(label,style: Theme.of(context).textTheme.displayMedium,)
            )
          ]
        )
      )
    );
  }
}