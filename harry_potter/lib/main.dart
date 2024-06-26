import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/controllers/character_controller.dart';
import 'app/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> CharacterController())

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
         primarySwatch: Colors.blue
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

