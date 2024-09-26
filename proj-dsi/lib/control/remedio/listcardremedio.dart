import 'package:cardiocare/components/cards/card_remedio.dart';
import 'package:cardiocare/control/remedio/data_to_card_remedio.dart';
import 'package:cardiocare/model/remedio/model_remedio.dart';
import 'package:cardiocare/service/service.dart';

Future<List> listaCardremedio() async {
  final dados = await service().getRemedio();
  final list = [];
  
  for (var doc in dados.docs) {
    

  modelremedio datamodel = modelremedio(
      id: doc['id'],
      observacao: doc['observacao'],
      remedio: doc['remedio'],
      dosagem: doc['dosagem'],
      datetime: doc['datetime'],
      unidade: doc['unidade'],);

  cardRemedio card = dataToCardRemedio(datamodel);
  list.add(card);
  }
  return list;
}

