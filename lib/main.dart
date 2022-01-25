import 'package:flutter/material.dart';

import 'package:flutter_application_first_toy_project/pokemonFind.dart';
import 'package:flutter_application_first_toy_project/pokemonFound.dart';
import 'package:flutter_application_first_toy_project/pokemonNotFound.dart';
import 'package:flutter_application_first_toy_project/pokemonDictionary.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '이미지 분류 앱',
      initialRoute: '/',
      routes: {
        '/': (context) => PokemonFind(),
        '/found': (context) => PokemonFound(),
        '/notfound': (context) => PokemonNotFound(),
        '/dictionary': (context) => PokemonDictionary(),
      },
    );
  }
}