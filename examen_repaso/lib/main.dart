import 'package:examen_repaso/models/flagModel.dart';
import 'package:examen_repaso/pages/battleship.dart';
import 'package:examen_repaso/pages/choose_country.dart';
import 'package:examen_repaso/pages/login.dart';
import 'package:examen_repaso/pages/register.dart';
import 'package:examen_repaso/utils/roots.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FlagModel(),
      child: MaterialApp(
        initialRoute: Roots.chooseCountry,
        routes: {
          Roots.login: (BuildContext context) => Login(),
          Roots.register: (BuildContext context) => Register(),
          Roots.battleship: (BuildContext context) => const Battleship(),
          Roots.chooseCountry: (BuildContext context) => const Choose_Country(),
        },
      ),
    );
  }
}
