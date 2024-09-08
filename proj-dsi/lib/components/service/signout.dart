import 'package:firebase_auth/firebase_auth.dart';
class sair{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  
  
  
  
  Future<void> deslogar()async{
    return _firebaseAuth.signOut();
    
  }
  }