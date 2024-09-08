import 'package:cardiocare/model/agua/model_agua.dart';
import 'package:cardiocare/model/pressao/model_pressao.dart';
import 'package:cardiocare/model/dieta/model_card_dieta.dart';
import 'package:cardiocare/model/remedio/model_remedio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class service {
  String userid = FirebaseAuth.instance.currentUser!.uid;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> adicionarpressao(modelPressao modelcardpressao) async {
    await _firestore
        .collection('pessoa')
        .doc(userid)
        .collection('pressao')
        .doc(modelcardpressao.id)
        .set(modelcardpressao.toMap());
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getpressao() async {
    final dados = await _firestore
        .collection('pessoa')
        .doc(userid)
        .collection('pressao')
        .get();
    return dados;
  }
 
  Future<void> apagarpressao(String id) async {
    await _firestore
        .collection('pessoa')
        .doc(userid)
        .collection('pressao')
        .doc(id)
        .delete();
  }



  Future<void> adicionaragua(modelagua modelagua) async {
    await _firestore
        .collection('pessoa')
        .doc(userid)
        .collection('agua')
        .doc(modelagua.id)
        .set(modelagua.toMap());
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getagua() async {
    final dados = await _firestore
        .collection('pessoa')
        .doc(userid)
        .collection('agua')
        .get();
    return dados;
  }
 
  Future<void> apagaragua(String id) async {
    await _firestore
        .collection('pessoa')
        .doc(userid)
        .collection('agua')
        .doc(id)
        .delete();
  }

 Future<void> adicionarDieta(modelDieta modelcarddieta) async {
    await _firestore
        .collection('pessoa')
        .doc(userid)
        .collection('dieta')
        .doc(modelcarddieta.id) // Usando id como ID
        .set(modelcarddieta.toMap());
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getdieta() async {
    final dados = await _firestore
        .collection('pessoa')
        .doc(userid)
        .collection('dieta')
        .get();
    return dados;
  }

  Future<void> apagarDieta(String id) async {
    await _firestore
        .collection('pessoa')
        .doc(userid)
        .collection('dieta')
        .doc(id)
        .delete();
  }

Future<void> adicionarRemedio(modelremedio modelremedio) async {
    await _firestore
        .collection('pessoa')
        .doc(userid)
        .collection('remedio')
        .doc(modelremedio.id) // Usando id como ID
        .set(modelremedio.toMap());
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getRemedio() async {
    final dados = await _firestore
        .collection('pessoa')
        .doc(userid)
        .collection('remedio')
        .get();
    return dados;
  }

  Future<void> apagarRemedio(String id) async {
    await _firestore
        .collection('pessoa')
        .doc(userid)
        .collection('remedio')
        .doc(id)
        .delete();
  }
}





