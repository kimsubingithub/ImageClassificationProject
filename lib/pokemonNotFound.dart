import 'package:flutter/material.dart';

class PokemonNotFound extends StatelessWidget {
  const PokemonNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('포켓몬 찾기 실패'), // AppBar 제목
        centerTitle: true, // AppBar 가운데 정렬
        backgroundColor: Colors.redAccent, // AppBar 색상 선택
      ),
      body: Center(
        child: Text('포멧몬 찾기 실패!'),
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
