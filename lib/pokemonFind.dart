import 'dart:html';
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PokemonFind extends StatefulWidget {
  const PokemonFind({Key? key}) : super(key: key);

  @override
  _PokemonFindState createState() => _PokemonFindState();
}

class _PokemonFindState extends State<PokemonFind> {
  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('포켓몬 찾기'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        child: Column(
          children: [
            //
            Container(
              width: 300,
              height: 300,
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true, // 밖 선택시 닫기
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('이미지'),
                        content: SingleChildScrollView(
                          child: Text('이미지를 가져올 곳을 선택하시오.'),
                        ),
                        actions: <Widget> [
                          ElevatedButton(
                            child: Text('카메라'),
                            onPressed: () {
                              getImage(ImageSource.camera);
                              Navigator.of(context).pop();
                            },
                          ),
                          ElevatedButton(
                            child: Text('갤러리'),
                            onPressed: () {
                              getImage(ImageSource.gallery);
                              Navigator.of(context).pop();
                              //Image.asset(_image!.path, fit: BoxFit.contain);
                            },
                          ),
                        ],
                      );
                    });
                },
                child: Text('찾고 싶은 포켓몬 이미지 가져오기'),
              ),
            ),
            //
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

  Future getImage(ImageSource imageSource) async {
    final XFile? image = await _picker.pickImage(source: imageSource);

    setState(() {
      _image = XFile(image!.path);
    });
  }

  void _DNavigation(BuildContext context) async {
    final result = await Navigator.of(context).pushNamed('/dictionary');
  }
}