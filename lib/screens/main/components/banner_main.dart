import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerMain extends StatefulWidget {
  @override
  _BannerMainState createState() => _BannerMainState();
}

class _BannerMainState extends State<BannerMain> {
  // ScrollController _scrollController = ScrollController();
  CarouselController buttonCarouselController = CarouselController();

  final List<String> imgList = [
    'https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/banner_3.jpg',
    'https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/banner_1.jpg',
    'https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/banner_2.jpg',
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 2),
        scrollDirection: Axis.horizontal,
      ),
      items: imgList
          .map(
            (item) => Container(
              child: Image.network(
                item,
                fit: BoxFit.fill,
              ),
            ),
          )
          .toList(),
    );
  }
}
