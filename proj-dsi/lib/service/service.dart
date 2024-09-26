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

  Future<QuerySnapshot> getpressaonovos() async {
    return await _firestore
        .collection('pessoa')
        .doc(userid)
        .collection('pressao')
        .orderBy('datatime', descending: true)
        .limit(3)
        .get();
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
    try {
      // Obtenha a data do modelagua
      final data = modelagua.datatime;

      // Verifique se já existe um documento com a mesma data
      final querySnapshot = await _firestore
          .collection('pessoa')
          .doc(userid)
          .collection('agua')
          .where('datatime', isEqualTo: data)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Se existir, some os valores
        final existingDoc = querySnapshot.docs.first;
        print('existingDoc: $existingDoc');
        final existingData = existingDoc.data();

        // Verifique se a chave 'quantidade' existe
        if (existingData != null && existingData.containsKey('aguabebida')) {
          final id = existingData['id'];
          final id2 = modelagua.id;

          print('id: $id');
          print('id2: $id2');

          final updatedData = {
            ...existingData,
            'aguabebida': id != id2
              ? existingData['aguabebida'] + modelagua.toMap()['aguabebida']
              : modelagua.toMap()['aguabebida']
          };

          // Atualize o documento existente
          await _firestore
              .collection('pessoa')
              .doc(userid)
              .collection('agua')
              .doc(existingDoc.id)
              .update(updatedData);
        } else {
          throw Exception("Estrutura de dados inesperada no documento existente.");
        }
      } else {
        // Se não existir, adicione o novo documento
        await _firestore
            .collection('pessoa')
            .doc(userid)
            .collection('agua')
            .doc(modelagua.id)
            .set(modelagua.toMap());
      }
    } catch (e) {
      print("Erro ao adicionar água: $e");
    }
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
  try {
    // Obtenha a data do modelcarddieta
    final data = modelcarddieta.datatime;

    // Verifique se já existe um documento com a mesma data
    final querySnapshot = await _firestore
        .collection('pessoa')
        .doc(userid)
        .collection('dieta')
        .where('datatime', isEqualTo: data)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Se existir, concatene os dados
      final existingDoc = querySnapshot.docs.first;
      final existingData = existingDoc.data();

      // Verifique se a chave 'alimentos' existe e é uma lista
      if (existingData != null && existingData.containsKey('alimentos') && existingData['alimentos'] is List) {
        final id = existingData['id'];
        final id2 = modelcarddieta.id;

        final updatedData = {
          ...existingData,
          'alimentos': id != id2
            ? [...existingData['alimentos'], ...modelcarddieta.toMap()['alimentos']]
            : modelcarddieta.toMap()['alimentos']
        };

        // Atualize o documento existente
        await _firestore
            .collection('pessoa')
            .doc(userid)
            .collection('dieta')
            .doc(existingDoc.id)
            .update(updatedData);
      } else {
        throw Exception("Estrutura de dados inesperada no documento existente.");
      }
    } else {
      // Se não existir, adicione o novo documento
      await _firestore
          .collection('pessoa')
          .doc(userid)
          .collection('dieta')
          .doc(modelcarddieta.id)
          .set(modelcarddieta.toMap());
    }
  } catch (e) {
    print("Erro ao adicionar dieta: $e");
  }
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

  Future<QuerySnapshot<Map<String, dynamic>>> get7ultimasaguas() async {
    return await _firestore
        .collection('pessoa')
        .doc(userid)
        .collection('agua')
        .orderBy('datatime', descending: false)
        .limit(7)
        .get();
  }

  deletarRemedio(String id) {}
}
