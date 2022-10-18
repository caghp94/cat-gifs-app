import 'package:cats_gif_app/dependency_injector.dart';
import 'package:cats_gif_app/src/cat_generator/presentation/screens/cat_generator_screen.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: CatGeneratorScreen(),
    );
  }
}
