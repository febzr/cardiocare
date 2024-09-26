class modelremedio {
  final String remedio;
  final String? observacao;
  final String id;
  final String dosagem;
  final int? datetime;
  final String unidade;

  const modelremedio(
    
      {
      this.observacao, required this.id,required this.remedio,required this.dosagem, required this.datetime, required this.unidade});

    Map<String, dynamic> toMap() {
      return {
      'id':id,
      'remedio':remedio,
      'observacao': observacao,
      'dosagem':dosagem,
      'datetime':datetime,
      'unidade':unidade,
      
    };} 


}
