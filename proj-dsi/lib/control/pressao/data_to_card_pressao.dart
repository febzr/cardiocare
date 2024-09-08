import 'package:cardiocare/components/cards/card_pressao.dart';
import 'package:cardiocare/model/pressao/model_pressao.dart';

cardPressao dataToCardPressao(modelPressao data) {
  final card = cardPressao(
    id: data.id,
    sistole: data.sistole,
    diastole: data.diastole,
    pulso: data.pulso,
    peso: data.peso,
    datatime: data.datatime,
    observacao: data.observacao,
  );
  return card;
}
