import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'yamml_photo.dart';
import 'package:http/http.dart' as http;

class RapidProvider with ChangeNotifier {
  List<PhotoYamml> _listYamml = [];
  Future<void> getRapidData() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      //"x-rapidapi-key": 'bbecd16c3cmshffb906f7b0b245bp120dc1jsn8f50f2064bd1',
      "x-rapidapi-key": '00300722cfmsh29f41a26655b667p1acbd0jsndeeed68c07cb',
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });
    //Map data = json.decode(response.body);
    if (response.statusCode == 200) {
      //final getphoto = json.decode(response.body).cast<String, dynamic>();
      //_listYamml = getphoto.map((e) => PhotoYamml.formJson(e)).toList();
      final getphoto = json.decode(response.body);
      List _temp = [];
      for (var i in getphoto['feed']) {
        _temp.add(i['content']['details']);
      }
      _listYamml = _temp.map((json) => PhotoYamml.formJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception();
    }
  }

  List<PhotoYamml> get myPhoto {
    return [..._listYamml];
  }
}
