import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

textwords(value){
  if (value==-1){
    return 0;
  }
  else{return value;}
}
class observacao extends StatefulWidget{
  final TextEditingController controller;
  final String title;
  
  observacao({super.key,required this.controller,required this.title});
  
  @override
  _observacao createState()=> _observacao();
}

class _observacao extends State<observacao> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
        width: (374 / 430) * MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: (5/430)*MediaQuery.of(context).size.width ,bottom: (12/932)*MediaQuery.of(context).size.height),
              child: Text(widget.title,style: Theme.of(context).textTheme.labelLarge,)
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10,top: 5),
                  child: Text('${textwords(widget.controller.selection.baseOffset)}/100',style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 12),),
                  alignment: Alignment.topRight,
                ),
                TextField(
                  onChanged: (value){setState(() {
                    
                  });},
                  inputFormatters: [LengthLimitingTextInputFormatter(100),],
                  controller: widget.controller,
                  keyboardType: TextInputType.name,
                  
                  maxLines:3,
                  style: Theme.of(context).textTheme.labelMedium,
                  decoration: InputDecoration(hintText: 'Escreva aqui',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor))),
                )
              ]
            )
          ],
        ));
  }
}
