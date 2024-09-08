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


Future<modelagua> aguadodia() async {
  final dados = await service().getagua();
  final dia = dados.docs.first;
  
  modelagua datamodel = modelagua(
      id: dia['id'],
      aguabebida: dia['aguabebida'], 
      datatime: dia['datatime']);
      
  return datamodel;
}
