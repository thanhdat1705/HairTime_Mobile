import 'package:flutter/material.dart';

class BlogContainer extends StatelessWidget {
  final EdgeInsets marginContainer;
  final double heightContainer;
  final double widthContainer;
  final int itemCount;
  final Color splashColor;
  final Function onTap;
  final List<String> imgBlogList;
  const BlogContainer({
    Key key,
    this.marginContainer,
    @required this.heightContainer,
    @required this.widthContainer,
    @required this.itemCount,
    this.splashColor,
    @required this.onTap,
    @required this.imgBlogList,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.marginContainer,
      height: this.heightContainer,
      width: this.widthContainer,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: this.itemCount,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: this.onTap,
            splashColor: this.splashColor,
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              child: Image.network(this.imgBlogList[index]),
            ),
          );
        },
      ),
    );
  }
}
