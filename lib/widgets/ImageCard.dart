import 'package:flutter/material.dart';
class ImageCard extends StatefulWidget {
  String image_path;
  ImageCard({this.image_path});
  @override
  _ImageCardState createState() => _ImageCardState(image_path: image_path);
}

class _ImageCardState extends State<ImageCard> {
  String image_path;
  _ImageCardState({this.image_path});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(image_path), fit: BoxFit.cover),
          color:Colors.lightBlue[50],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0), bottomRight: Radius.circular(15.0), bottomLeft: Radius.circular(15.0) )
      ),
      height: 40,
      width: 40,
    );
  }
}
