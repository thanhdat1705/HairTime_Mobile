import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/shared_data/list_reviewer.dart';
import 'package:project_hair_time_mobile/widgets/card/card_store.dart';
import 'package:project_hair_time_mobile/screens/store_detail/components/card/rating_card.dart';
import 'package:project_hair_time_mobile/widgets/card/store_rating.dart';
import 'package:tuple/tuple.dart';
import 'package:intl/intl.dart';

class ReviewPage extends StatefulWidget {
  final String title;

  const ReviewPage({Key key, this.title}) : super(key: key);
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  List<Widget> itemsData = [];

  @override
  void initState() {
    getListReviewer();
    super.initState();
  }

  void getListReviewer() {
    List<dynamic> responseList = REVIEWER_DATA;
    List<Widget> listStoresData = [];
    responseList.forEach((pos) {
      listStoresData.add(
        RatingCard(
          name: pos["name"],
          star: pos["star"],
          date: pos["date"],
          imageURL: pos["imageURL"],
        ),
      );
    });
    setState(() {
      itemsData = listStoresData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        _buildSliverContent(itemsData),
      ],
    );
  }
}

SliverFillRemaining _buildSliverContent(List<Widget> itemsData) {
  return SliverFillRemaining(
    child: Container(
      color: Colors.white,
      height: 500,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: itemsData == null ? 0 : itemsData.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return itemsData[index];
        },
      ),
    ),
  );
}
