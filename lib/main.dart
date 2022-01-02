import 'package:flutter/material.dart';
import 'package:image_app/model/oflutter.dart';
import 'package:image_app/model/photoPorvider.dart';
import 'package:provider/provider.dart';

//import 'images.dart';
import 'yamml_photo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: RapidProvider()),
        ChangeNotifierProvider.value(value: PhotoProvider()),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Image App'),
          ),
          //body: const Images(),
          body: const YammlPhotos(),
        ),
      ),
    );
  }
}
