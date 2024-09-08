import 'package:cardiocare/components/cards/card_dieta.dart';
import 'package:cardiocare/control/dieta/data_to_card_dieta.dart';
import 'package:cardiocare/model/dieta/model_card_dieta.dart';
import 'package:cardiocare/service/service.dart';

Future<List> listaCardieta() async {
  final dados = await service().getdieta();
  final list = [];
  
  for (var doc in dados.docs) {
    

  modelDieta datamodel = modelDieta(
      id: doc['id'],
      alimentos: doc['alimentos'],
      datatime: doc['datatime']);
      

  CardDieta2 card = dataToCardDieta(datamodel);
  list.add(card);
  }
  return list;
}

