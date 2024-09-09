import 'package:firebase_auth/firebase_auth.dart';

class Cadastrar {
  final String? name;
  final String email;
  final String senha;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Cadastrar({required this.email, required this.senha, this.name});

  register() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: senha);
      if (name != null) {
        await userCredential.user!.updateDisplayName(name);
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  login() async {
    try {
        await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: senha,);

          return true;
    } on FirebaseAuthException catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> deslogar()async{
    return _firebaseAuth.signOut();
  }
}
