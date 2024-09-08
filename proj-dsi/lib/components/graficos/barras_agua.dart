import 'package:flutter/material.dart';

class barraagua extends StatefulWidget {
   double agua_consumida; 
   final double meta;
  barraagua({super.key, required this.agua_consumida, required this.meta});
  fuc(x){
    agua_consumida = x;
  }
  @override
  _barraagua createState() => _barraagua(agua: agua_consumida,meta: meta);
}

class _barraagua extends State<barraagua> {
  double agua;
  double meta;
  
  _barraagua({required this.agua,required this.meta});
  @override
  
  Widget build(BuildContext context) {
    avanco(){
      return (agua/meta)*((329 / 430) * MediaQuery.of(context).size.width);
    }

    if(widget.agua_consumida!= agua){
      setState(() {
        agua=widget.agua_consumida;
      });
    }
    return Container(
      child: Stack(alignment: Alignment.centerLeft, children: [
        Container(
          width: (329 / 430) * MediaQuery.of(context).size.width,
          height: (12 / 932) * MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor, // Cor da borda
                width: 2.0, // Largura da borda
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Stack(children: [
            Container(
              width: avanco(),
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            ),
          ]),
        ),
        Container(
          margin: EdgeInsets.only(
              left: (((329) / 430) * MediaQuery.of(context).size.width) *
                  (0.14 * 1)),
          width: (25/430)*MediaQuery.of(context).size.width,
          height: (25/430)*MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: avanco() >=
                    (((329) / 430) * MediaQuery.of(context).size.width) *
                        (0.14 * 1)
                ? Theme.of(context).primaryColor
                : Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(
              color: Theme.of(context).primaryColor, // Cor da borda
              width: 2.0, // Largura da borda
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 4), // deslocamento da sombra
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              left: (((329) / 430) * MediaQuery.of(context).size.width) *
                  (0.14 * 2)),
          width: (25/430)*MediaQuery.of(context).size.width,
          height: (25/430)*MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: avanco() >=
                    (((329) / 430) * MediaQuery.of(context).size.width) *
                        (0.14 * 2 )
                ? Theme.of(context).primaryColor
                : Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(
              color: Theme.of(context).primaryColor, // Cor da borda
              width: 2.0, // Largura da borda
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 4), // deslocamento da sombra
              ),
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.only(
              left: (((329) / 430) * MediaQuery.of(context).size.width) *
                  (0.14 * 3)),
          width: (25/430)*MediaQuery.of(context).size.width,
          height: (25/430)*MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: avanco() >=
                    (((329) / 430) * MediaQuery.of(context).size.width) *
                        (0.14 * 3)
                ? Theme.of(context).primaryColor
                : Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(
              color: Theme.of(context).primaryColor, // Cor da borda
              width: 2.0, // Largura da borda
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 4), // deslocamento da sombra
              ),
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.only(
              left: (((329) / 430) * MediaQuery.of(context).size.width) *
                  (0.14 * 4)),
          width: (25/430)*MediaQuery.of(context).size.width,
          height: (25/430)*MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: avanco() >=
                    (((329) / 430) * MediaQuery.of(context).size.width) *
                        (0.14 * 4)
                        
                ? Theme.of(context).primaryColor
                : Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(
              color: Theme.of(context).primaryColor, // Cor da borda
              width: 2.0, // Largura da borda
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 4), // deslocamento da sombra
              ),
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.only(
              left: (((329) / 430) * MediaQuery.of(context).size.width) *
                  (0.14 * 5)),
          width: (25/430)*MediaQuery.of(context).size.width,
          height: (25/430)*MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: avanco() >=
                    (((329) / 430) * MediaQuery.of(context).size.width) *
                        (0.14 * 5)
                ? Theme.of(context).primaryColor
                : Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(
              color: Theme.of(context).primaryColor, // Cor da borda
              width: 2.0, // Largura da borda
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 4), // deslocamento da sombra
              ),
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.only(
              left: (((329) / 430) * MediaQuery.of(context).size.width) *
                  (0.14 * 6)),
          width: (25/430)*MediaQuery.of(context).size.width,
          height: (25/430)*MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: avanco() >=
                    (((329) / 430) * MediaQuery.of(context).size.width) *
                        (0.14 * 6)
                ? Theme.of(context).primaryColor
                : Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(
              color: Theme.of(context).primaryColor, // Cor da borda
              width: 2.0, // Largura da borda
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 4), // deslocamento da sombra
              ),
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.only(
              left: (((329) / 430) * MediaQuery.of(context).size.width) *
                  (0.14 * 7)),
          width: (36/430)*MediaQuery.of(context).size.width,
          height: (36/430)*MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: avanco() >=
                    (((329) / 430) * MediaQuery.of(context).size.width) 
                        
                ? Theme.of(context).primaryColor
                : Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(
              color: Theme.of(context).primaryColor, // Cor da borda
              width: 2.0, // Largura da borda
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 4), // deslocamento da sombra
              ),
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.only(
              left: ((((329) / 430) * MediaQuery.of(context).size.width) *
                  (0.14 * 7))+((36/430)*MediaQuery.of(context).size.width - ((25/430)*MediaQuery.of(context).size.width))/2),
          width: (25/430)*MediaQuery.of(context).size.width,
          height: (25/430)*MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:  Theme.of(context).primaryColor,
              
            border: Border.all(
              color: Theme.of(context).primaryColor, // Cor da borda
              width: 2.0, // Largura da borda
            ),
            
          ),
        ),
        


      ]),
    );
  }
}
