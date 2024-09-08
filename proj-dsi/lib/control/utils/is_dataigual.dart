class isDataIgual{

  final DateTime? datetime1;
  final DateTime? datetime2;

  isDataIgual({required this.datetime1,required this.datetime2});

  bool isigual(){
     final bool e = datetime1!.day == datetime2!.day &&
         datetime1!.month == datetime2!.month &&
         datetime1!.year == datetime2!.year;
    return e;
  }
}