class modelremedio {
  final String remedio;
  final String? observacao;
  final String id;
  const modelremedio(
    
      {
      this.observacao, required this.id,required this.remedio});

    Map<String, dynamic> toMap() {
      return {
      'id':id,
      'remedio':remedio,
      'observacao': observacao,
    };} 


}
