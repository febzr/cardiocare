import 'package:cardiocare/components/cards/card_pressao.dart';
import 'package:cardiocare/control/pressao/data_to_card_pressao.dart';
import 'package:cardiocare/model/pressao/model_pressao.dart';
import 'package:cardiocare/service/service.dart';

Future<List> listaCardPressao() async {
  final dados = await service().getpressao();
  final list = [];
  
  for (var doc in dados.docs) {
    

  modelPressao datamodel = modelPressao(
      id: doc['id'],
      observacao: doc['observacao'],
      sistole: doc['sistole'],
      diastole: doc['diastole'],
      pulso: doc['pulso'], 
      peso: doc['peso'],
      datatime: doc['datatime']);
      

  cardPressao card = dataToCardPressao(datamodel);
  list.add(card);
  }
  return list;
}

