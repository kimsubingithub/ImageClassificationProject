import 'dart:html';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PokemonFind extends StatefulWidget {
  const PokemonFind({Key? key}) : super(key: key);

  @override
  _PokemonFindState createState() => _PokemonFindState();
}

class _PokemonFindState extends State<PokemonFind> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('포켓몬 찾기'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: 300,
              height: 300,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('찾고 싶은 포켓몬 이미지 가져오기'),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/found');
                },
                child: Text('O'),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/notfound');
                },
                child: Text('X'),
              ),
            )
          ],
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
