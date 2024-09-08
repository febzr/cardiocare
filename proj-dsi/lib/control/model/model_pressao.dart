class modelPressao {
  final double sistole;
  final double diastole;
  final double pulso;
  final double peso;
  final String? observacao;
  final int datatime;
  final String id;
  const modelPressao(
    
      {required this.sistole,
      required this.diastole,
      required this.pulso,
      required this.peso,
      this.observacao,
      required this.datatime, required this.id});

    Map<String, dynamic> toMap() {
      return {
      'id':id,
      'sistole':sistole,
      'diastole': diastole,
      'pulso':pulso,
      'peso': peso,
      'observacao': observacao,
      'datatime': datatime
    };}


}
