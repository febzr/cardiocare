import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class customDatePickerNull extends StatefulWidget {
  final Function onchange;
  customDatePickerNull({required this.onchange});

  State<customDatePickerNull> createState() => _customdatepickerNull();
}

class _customdatepickerNull extends State<customDatePickerNull> {
  DateTime? data;

  String getDateorMessage(DateTime? data) {
    if (data == null) {
      return 'Pesquisar data';
    }

    return '${data.day.toString().padLeft(2, '0')}-${data.month.toString().padLeft(2, '0')}-${data.year}';
  }

  Future<void> _selecDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(1970),
        lastDate: DateTime(2100),
        initialDate: (data != null) ? data : DateTime.now());
    if (picked != null) {
      setState(() {
        data = picked;
        widget.onchange(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topRight, children: [
      
      Container(
        height: (50 / 932) * MediaQuery.of(context).size.height,
        width: (183 / 430) * MediaQuery.of(context).size.width,
        margin: EdgeInsets.only( right: ((23/430)*MediaQuery.of(context).size.width)/2,top: ((23/932)*MediaQuery.of(context).size.height)/2),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Theme.of(context).primaryColor)),
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            onTap: () async {
              _selecDate();
            },
            splashColor: Theme.of(context).splashColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.calendar_month,
                  color: Theme.of(context).primaryColor,
                  size: (30 / 932) * MediaQuery.of(context).size.height,
                ),
                Text(
                  getDateorMessage(data),
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            ),
          ),
        ),
      ),
      Stack(alignment: Alignment.topRight,
        children: [
          
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(100)) ),
            width: (23/430)*MediaQuery.of(context).size.width,
                          height: (23/932)*MediaQuery.of(context).size.height,
            child: Material(
              borderRadius: BorderRadius.circular(100),
              child: InkWell(
                onTap: (){setState(() {
                  data = null;
        widget.onchange(null);
                });},
                splashColor: Theme.of(context).splashColor,
                
                  child: Container(
                          
                          width: (23/430)*MediaQuery.of(context).size.width,
                          height: (23/932)*MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(shape: BoxShape.circle,color: Color.fromARGB(255, 205, 19, 19)),
                          child: Icon(Icons.close,color: Colors.white,size: 12,)
                          )
                )
            )
          )
          
        ]
      )
    ]);
  }
}
