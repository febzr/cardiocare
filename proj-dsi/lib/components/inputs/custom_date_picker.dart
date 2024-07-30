import 'package:flutter/material.dart';

class customDatePicker extends StatefulWidget {
  
  final Function onchange;
  customDatePicker({required this.onchange});

 
  State<customDatePicker> createState() => _customdatepicker();
}

class _customdatepicker extends State<customDatePicker> {
  DateTime? data;
  
  String getDateorMessage(DateTime ?data){
    if(data == null){
      return 'DD-MM-AA'; 
    }
    
    return '${data.day.toString().padLeft(2,'0')}-${data.month.toString().padLeft(2,'0')}-${data.year}';
  }
  Future<void> _selecDate() async {
    
    DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(1970),
        lastDate: DateTime(2100),
        initialDate: (data!=null)?data:DateTime.now());
  if(picked !=null){
    setState(() {
        data = picked;
        widget.onchange(picked);
    });
  }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (50 / 932) * MediaQuery.of(context).size.height,
      width: (183 / 430) * MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*(12/430)),
      decoration: BoxDecoration(
        
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Theme.of(context).primaryColor)),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: InkWell(
          onTap: ()async{_selecDate();},
          splashColor: Theme.of(context).splashColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Text(
                getDateorMessage(data),
                style: Theme.of(context).textTheme.labelMedium,
              ),Icon(
                Icons.calendar_month_outlined,
                color: Theme.of(context).primaryColor,
                size: (30 / 932) * MediaQuery.of(context).size.height,
              )
            ],
          ),
        ),
      ),
    );
  }
}
