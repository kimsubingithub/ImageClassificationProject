import 'package:flutter/material.dart';

class PokemonDictionary extends StatelessWidget {
  const PokemonDictionary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('포켓몬 도감'),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('포켓몬 도감!'),
          ),
        ),
      ),
    );
  }
}