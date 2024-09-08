class modelagua {
  final double aguabebida;
  final int datatime;
  final String id;
  const modelagua(
      {
      required this.aguabebida,
      required this.datatime, required this.id});

    Map<String, dynamic> toMap() {
      return {
      'id':id,
      'aguabebida':aguabebida,
      'datatime': datatime
    };}


}
