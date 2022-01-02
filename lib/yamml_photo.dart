import 'package:flutter/material.dart';
import 'package:image_app/model/oflutter.dart';
import 'package:provider/provider.dart';

class YammlPhotos extends StatefulWidget {
  const YammlPhotos({Key? key}) : super(key: key);

  @override
  State<YammlPhotos> createState() => _YammlPhotosState();
}

class _YammlPhotosState extends State<YammlPhotos> {
  bool _isloading = true;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (_isloading == true) {
      Provider.of<RapidProvider>(context).getRapidData().then((_) {
        setState(() {
          _isloading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final datas = Provider.of<RapidProvider>(context, listen: false).myPhoto;
    //print(datas.length);
    return datas.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: datas.length,
            itemBuilder: (context, int index) {
              return Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      datas[index].images,
                    ),
                  ),
                ),
                child: Text(datas[index].name),
              );
            },
          );
  }
}
