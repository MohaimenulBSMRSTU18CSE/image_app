// ignore: file_names
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:image_app/model/photo_class.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:image_app/model/yamml_photo.dart';

class PhotoProvider with ChangeNotifier {
  List<Photo> _photoList = [];
  Future<void> getPhoto() async {
    http.Response response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      var getDatas = json.decode(response.body) as List;
      _photoList = getDatas.map((json) => Photo.formJson(json)).toList();
      // List<Photo> _photos = [];
      // getDatas.forEach((element) {
      //   Photo photo = Photo(
      //     id: element['id'],
      //     title: element['title'],
      //     url: element['url'],
      //     thumbnailUrl: element['thumbnailUrl'],
      //   );
      //   _photos.add(photo);
      // });
      // _photoList = _photos;
      notifyListeners();
    } else {
      throw Exception("Failed data");
    }
  }

  List<Photo> get photos {
    return [..._photoList];
  }
}
