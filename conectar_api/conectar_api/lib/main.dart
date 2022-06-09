import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FlagModel(),
      child: MaterialApp(
        initialRoute: 'inicial',
        routes: {
          'inicial': (BuildContext context) => const Inicial(),
        },
      ),
    );
  }
}
