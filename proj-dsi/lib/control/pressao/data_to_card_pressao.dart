import 'package:cardiocare/components/cards/card_pressao.dart';
import 'package:cardiocare/model/model_card_pressao.dart';

cardPressao dataToCardPressao(modelCardPressao data) {
  final card = cardPressao(
    listindex: data.listindex,
    sistole: data.sistole,
    diastole: data.diastole,
    pulso: data.pulso,
    peso: data.peso,
    datatime: data.datatime,
    observacao: data.observacao,
  );
  return card;
}
