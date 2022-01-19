import 'package:flutter/material.dart';

class PokemonFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('포멧몬 찾기 성공'),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('포켓몬 찾기 성공!'),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _DNavigation(context);
        },
        child: Icon(Icons.book),
      ),
    );
  }

  void _DNavigation(BuildContext context) async {
    final result = await Navigator.of(context).pushNamed('/dictionary');
  }
}