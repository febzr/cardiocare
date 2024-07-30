class modelCardPressao {
  final double sistole;
  final double diastole;
  final double pulso;
  final double peso;
  final String? observacao;
  final int datatime;

  const modelCardPressao(
      {required this.sistole,
      required this.diastole,
      required this.pulso,
      required this.peso,
      this.observacao,
      required this.datatime});

  getmap() {
    return {
      'sistole':sistole,
      'diastole': diastole,
      'pulso':pulso,
      'peso': peso,
      'observacao': observacao,
      'datatime': datatime
    };
  }
}
