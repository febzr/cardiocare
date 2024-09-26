import 'package:cardiocare/components/cards/card_agua.dart';
import 'package:cardiocare/components/cards/card_pressao.dart';
import 'package:cardiocare/control/agua/data_to_agua.dart';
import 'package:cardiocare/control/pressao/data_to_card_pressao.dart';
import 'package:cardiocare/model/pressao/model_pressao.dart';
import 'package:cardiocare/model/agua/model_agua.dart';
import 'package:cardiocare/service/service.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<List> listaCard3Novos() async {
  final dados = await service().getpressaonovos();
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

Future<List> lista7agua() async {
  final dados = await service().get7ultimasaguas();
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

getPrimeiraLetradoDiafromData(int data) {
  initializeDateFormatting('pt_BR');
  var dataFormatada = DateTime.fromMillisecondsSinceEpoch(data);
  var formatter = DateFormat('E', 'pt_BR');
  return formatter.format(dataFormatada).substring(0, 1).toUpperCase();
}