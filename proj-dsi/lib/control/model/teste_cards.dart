import 'dart:math';

import 'package:cardiocare/components/cards/card_pressao.dart';
import 'package:cardiocare/control/pressao/data_to_card_pressao.dart';
import 'package:cardiocare/model/model_card_pressao.dart';

Future<List> listaCardPressao() async {
  final list = [];
  modelCardPressao datamodel = modelCardPressao(
      observacao: 'oi',
      sistole: Random(42).nextDouble() * 255,
      diastole: Random(42).nextDouble() * 255,
      pulso: Random(42).nextDouble() * 255, 
      peso: Random(42).nextDouble() * 255,
      datatime: (Random(42).nextInt(1719518356)+15992000000)*100);
      cardPressao card = dataToCardPressao(datamodel);
  list.add(card);

  for (var i = 0; i < Random().nextInt(30)+1; i++) {
    
  
  modelCardPressao datamodel = modelCardPressao(
      listindex: i,
      observacao: 'oi',
      sistole: Random().nextDouble() * 255,
      diastole: Random().nextDouble() * 255,
      pulso: Random().nextDouble() * 255, 
      peso: Random().nextDouble() * 255,
      datatime: (Random().nextInt(1719518356)+15992000000)*100);
      

  cardPressao card = dataToCardPressao(datamodel);
  list.add(card);
  }
  return list;
}

