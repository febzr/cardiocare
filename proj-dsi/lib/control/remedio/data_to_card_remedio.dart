import 'package:cardiocare/components/cards/card_remedio.dart';
import 'package:cardiocare/model/remedio/model_remedio.dart';

cardRemedio dataToCardRemedio(modelremedio data) {
  final card = cardRemedio(
    id: data.id,
    observacoes: data.observacao,
    name_remedio: data.remedio
  );
  return card;
}
