class modelCardDieta {
  final String name_alimento;
  final int datatime;
  final List<String> comidas;

  modelCardDieta(
      {required this.name_alimento,
      required this.datatime,
      required this.comidas, 
      });

  getmap() {
    return {
      'name_alimento':name_alimento,
      'datatime': datatime,
      'comidas':comidas,
    };
  }
}
