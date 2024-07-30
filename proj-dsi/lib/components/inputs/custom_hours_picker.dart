import 'package:flutter/material.dart';

class customHourPicker extends StatefulWidget {
  final Function onchange;
  customHourPicker({required this.onchange});

  State<customHourPicker> createState() => _customHourpicker();
}

class _customHourpicker extends State<customHourPicker> {
  TimeOfDay? data;

  String getDateorMessage(TimeOfDay? data) {
    if (data == null) {
      return '00:00';
    }

    return '${data.hour.toString().padLeft(2, '0')}:${data.minute.toString().padLeft(2, '0')}';
  }

  Future<void> _selecDate() async {
    TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) {
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
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * (12 / 430)),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getDateorMessage(data),
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Icon(
                Icons.alarm,
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
