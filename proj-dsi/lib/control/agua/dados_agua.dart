import 'package:cardiocare/components/cards/card_agua.dart';
import 'package:cardiocare/control/agua/data_to_agua.dart';
import 'package:cardiocare/model/agua/model_agua.dart';
import 'package:cardiocare/service/service.dart';

Future<List> listaagua() async {
  final dados = await service().getagua();
  final list = [];
  
  for (var doc in dados.docs) {
    
  modelagua datamodel = modelagua(
      id: doc['id'],
      aguabebida: doc['aguabebida'],
      datatime: doc['datatime']);
      
  CardAgua card = dataToCardagua(datamodel);

  list.add(card);
  }
  return list;
}

Future<modelagua?> aguadodia() async {
  final dados = await service().getagua(); // Supondo que 'dados' seja a lista de documentos do Firestore
  final hoje = DateTime.now();

  // Filtrando os documentos que têm o 'datatime' igual ao dia de hoje (ignora horas, minutos, etc)
  final diaDeHoje = dados.docs.firstWhere(
    (doc) {
      DateTime dataDoc = DateTime.fromMillisecondsSinceEpoch(doc['datatime']);
      return dataDoc.year == hoje.year && dataDoc.month == hoje.month && dataDoc.day == hoje.day;
    },
  );

  // Se não encontrar um documento, retornar null
  if (diaDeHoje == null) {
    return null; 
  }

  modelagua datamodel = modelagua(
      id: diaDeHoje['id'],
      aguabebida: diaDeHoje['aguabebida'],
      datatime: diaDeHoje['datatime']);

  return datamodel;
}