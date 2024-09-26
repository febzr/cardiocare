import 'package:cardiocare/components/cards/create_card_pressao.dart';
import 'package:cardiocare/view/Suporte.dart';
import 'package:cardiocare/view/dieta.dart';
import 'package:cardiocare/view/historico_agua.dart';
import 'package:cardiocare/view/perfil.dart';
import 'package:cardiocare/components/cards/create_card_dieta.dart';
import 'package:cardiocare/themes/theme_main.dart';
import 'package:cardiocare/view/cadastro.dart';
import 'package:cardiocare/view/confirmacao_de_registro.dart';
import 'package:cardiocare/view/diario_de_pressao.dart';
import 'package:cardiocare/view/remedio.dart';
import 'package:cardiocare/components/cards/create_card_remedio.dart';
import 'package:cardiocare/view/esqueci_minha_senha.dart';
import 'package:cardiocare/view/login.dart';
import 'package:cardiocare/view/home.dart';
import 'package:cardiocare/view/consumo_agua.dart';
import 'package:cardiocare/view/sobre.dart';
import 'package:cardiocare/view/mapa.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cardiocare/view/agua_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeMain,
      routes: {
        'login': (context) => Login(),
        'cadastro': (context) => cadastro(),
        'confirmacao_de_registro': (context) => const confirmaoDeRegistro(),
        'recuperar_senha': (context) => esqueciMinhaSenha(),
        'home': (context) => const home(),
        'diario_de_pressao': (context) => const diariodepressao(),
        'criador_de_pressao': (context) => createCard(),
        'dieta': (context) => const dieta(),
        'remedio': (context) => remedio(),
        'criador_de_dieta': (context) => const DietaScreen(),
        'criador_de_remedio': (context) => createCardRemedio(),
        'consumo_agua': (context) => WaterScreen(),
        'roteador': (context) => const roteador(),
        'perfil': (context) => const ProfileScreen(),
        'suporte': (context) => suporteslide(),
        'sobre': (context) => const sobreoapp(),
        'mapa': (context) => const mapa(),
        'historico de agua': (context) => const historicodeagua(),
        'agua_config': (context) => config_agua(),
      },
      home: roteador(),
    );
  }
}

class roteador extends StatelessWidget {
  const roteador({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return home();
          } else {
            return Login();
          }
        });
  }
}
