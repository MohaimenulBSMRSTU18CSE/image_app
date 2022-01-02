import 'package:flutter/material.dart';
import 'package:image_app/model/photoPorvider.dart';
import 'package:provider/provider.dart';

class Images extends StatefulWidget {
  const Images({Key? key}) : super(key: key);

  @override
  State<Images> createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    Provider.of<PhotoProvider>(context).getPhoto();
    super.didChangeDependencies();
  }

  // @override
  // void initState() {
  //   // TODO: implement initState

  //   super.initState();
  //   Provider.of<PhotoProvider>(context, listen: false).getPhoto();
  // }

  @override
  Widget build(BuildContext context) {
    final photos = Provider.of<PhotoProvider>(context, listen: false).photos;
    return ListView.builder(
      itemCount: photos.length,
      itemBuilder: (context, int index) {
        return Text(photos[index].title);
      },
    );
  }
}
