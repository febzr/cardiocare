class modelDieta {
  final String id;
  final List alimentos;
  final int datatime;

  modelDieta({
    required this.id,
    required this.alimentos,
    required this.datatime,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'alimentos': alimentos,
      'datatime': datatime,
    };
  }
}
