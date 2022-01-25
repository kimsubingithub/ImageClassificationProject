import 'package:flutter/material.dart';

class PokemonFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('포멧몬 찾기 성공'), // AppBar 제목
        centerTitle: true, // AppBar 가운데 정렬
        backgroundColor: Colors.redAccent, // AppBar 색상 선택
      ),
      body: Column(
        children: [
          Text('포켓몬 찾기 성공!'),
          Container(
            width: 450,
            height: 450,
          ),
          Text('이름'),
          Text('속성'),
        ],
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