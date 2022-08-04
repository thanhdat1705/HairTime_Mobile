import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AutoScrollBanner extends StatelessWidget {
  final List<String> imageList;
  final Duration scrollTime;
  final CarouselController carouselController;
  final double heightImage;
  final double widthImage;
  const AutoScrollBanner({
    Key key,
    @required this.imageList,
    @required this.scrollTime,
    @required this.carouselController,
    @required this.heightImage,
    @required this.widthImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new CarouselSlider(
      carouselController: this.carouselController,
      options: CarouselOptions(
        autoPlay: true,
        enableInfiniteScroll: false,
        viewportFraction: 1.0,
        autoPlayInterval: this.scrollTime,
        scrollDirection: Axis.horizontal,
      ),
      items: this
          .imageList
          .map(
            (item) => Container(
              child: Image.network(
                item,
                fit: BoxFit.fill,
                height: this.heightImage,
                width: this.widthImage,
              ),
            ),
          )
          .toList(),
    );
  }
}
