import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class PokemonFind extends StatefulWidget {
  //const PokemonFind({Key? key}) : super(key: key);

  @override
  _PokemonFindState createState() => _PokemonFindState();
}

class _PokemonFindState extends State<PokemonFind> {
  List? _output;
  File? _image;

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  loadModel() async {
    await Tflite.loadModel(
            model: 'assets/gdsc_pokemon_CNN.tflite', labels: 'assets/label.txt')
        .then((value) {
      setState(() {});
    });
  }

  Future classifyImage(File image) async {
    //print("TEST$image");
    var output = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0,
        imageStd: 256.0,
        numResults: 150,
        threshold: 0.2,
        asynch: true);
    setState(() {
      _output = output;
    });
  }

  recycleDialog() {
    _output != null
        ? showDialog(
            context: context,
            barrierDismissible:
                false, // barrierDismissible - Dialog를 제외한 다른 화면 터치 x
            builder: (BuildContext context) {
              return AlertDialog(
                // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      _output![0]['label'].toString().toUpperCase(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        background: Paint()..color = Colors.white,
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  Center(
                    child: new TextButton(
                      child: new Text("Ok"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              );
            })
        : showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "데이터가 없거나 잘못된 이미지 입니다.",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  Center(
                    child: new TextButton(
                      child: new Text("Ok"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              );
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('포켓몬 찾기'), // AppBar 제목
        centerTitle: true, // AppBar 가운데 정렬
        backgroundColor: Colors.redAccent, // AppBar 색상 선택
      ),
      body: Center(
        child: Column(
          children: [
            _image == null
                ? Container(
                    width: 450,
                    height: 450,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            barrierDismissible: true, // 창 밖 선택시 창 닫기
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('이미지'),
                                content: SingleChildScrollView(
                                  child: Text('이미지를 가져올 곳을 선택하시오.'),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                      child: Text('카메라'),
                                      onPressed: () {
                                        getImage(ImageSource.camera);
                                        Navigator.of(context).pop();
                                      }),
                                  TextButton(
                                    child: Text('갤러리'),
                                    onPressed: () {
                                      getImage(ImageSource.gallery);
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              );
                            });
                      },
                      child: Text('찾고 싶은 모케못 이미지 가져오기'),
                    ),
                  )
                : Image.file(File(_image!.path)),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  recycleDialog();
                  //Navigator.of(context).pushNamed('/found');
                },
                child: Text('o'),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  recycleDialog();
                  //Navigator.of(context).pushNamed('/notfound');
                },
                child: Text('x'),
              ),
            )
          ], // children end
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _DNavigation(context);
        },
        child: Icon(Icons.book), // 도감 아이콘
      ),
    );
  }

  Future getImage(ImageSource imageSource) async {
    XFile? ximage = await ImagePicker().pickImage(source: imageSource);
    recycleDialog();
    File image = File(ximage!.path);
    if (image == null) return;
    setState(() {
      _image = image;
    });
    await classifyImage(File(image.path));
  } // 이미지를 카메라나 갤러리에서 불러올지 선택하는 사항

  void _DNavigation(BuildContext context) async {
    final result = await Navigator.of(context).pushNamed('/dictionary');
  } // 도감의 새로운 창을 실행했을 때의 안내창

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }
}