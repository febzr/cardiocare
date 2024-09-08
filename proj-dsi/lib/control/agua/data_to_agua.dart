import 'package:cardiocare/components/cards/card_agua.dart';
import 'package:cardiocare/model/agua/model_agua.dart';


CardAgua dataToCardagua(modelagua data) {
  final card = CardAgua(
    id: data.id,
    datatime: data.datatime,
    aguabebida: data.aguabebida ,

  );
  return card;
}
