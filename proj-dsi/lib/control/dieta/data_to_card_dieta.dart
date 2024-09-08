
import 'package:cardiocare/components/cards/card_dieta.dart'; 
import 'package:cardiocare/model/dieta/model_card_dieta.dart';

CardDieta2 dataToCardDieta(modelDieta data) {
  return CardDieta2(
    id: data.id, 
    alimentos: data.alimentos, 
    datatime: data.datatime, 
  );
}
