import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  double height;
  double padding;
  List<AssetImage> ImageList;
  ImageSlider(this.height,this.padding,this.ImageList);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.padding),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          height: widget.height,
          child: Carousel(
            borderRadius: true,
            autoplayDuration: Duration(seconds: 2),
            showIndicator: false,
            boxFit: BoxFit.fill,
            images: widget.ImageList,
          ),
        ),
      ),
    );
  }
}
