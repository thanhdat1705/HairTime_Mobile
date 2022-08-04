import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_hair_time_mobile/screens/search_store/components/search_header.dart';
import 'package:project_hair_time_mobile/screens/search_store/data/data.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/contants.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/shared_data/service_list.dart';
import 'package:project_hair_time_mobile/widgets/banner/discount_banner.dart';
import 'package:project_hair_time_mobile/widgets/card/card_store.dart';
import 'package:project_hair_time_mobile/widgets/card/categories.dart';
import 'package:project_hair_time_mobile/widgets/title/section_title.dart';

class SearchBody extends StatefulWidget {
  final String storeName;
  final String address;
  final String phone;
  final String description;
  final double ratingNum;
  final String guestCheckout;
  final String imageUrl;
  final bool isLike;

  const SearchBody({
    Key key,
    this.storeName = "Barber Vu Tri",
    this.address = "175 Phan Đình Phùng, P.17, Q.Phú Nhuận, TP.HCM",
    this.phone = "0909696969",
    this.description =
        "Minimum age requirement for the Spa is 15 years.No Children under 12 are allowed in CONCEPT COIFFURE. For treatments, please advise if you are pregnant as not all treatments are appropriate.",
    this.ratingNum = 4.6,
    this.guestCheckout = "35",
    this.isLike = true,
    this.imageUrl =
        'https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/baber.jpg',
  }) : super(key: key);
  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  //---- Show tag Chip ---
  List<String> _dynamicChips;
  @override
  void initState() {
    super.initState();
    _dynamicChips = [];
  }
  //--- End --------------

  //---- Show Categories -------
  showCategories() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            categories.length,
            (index) => CategoriesCard(
              icon: categories[index]["icon"],
              text: categories[index]["text"],
              press: () {
                setState(() {
                  _dynamicChips.add(categories[index]["text"]);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
  //---- End Show Categories----

  dynamicChips() {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: List<Widget>.generate(_dynamicChips.length, (index) {
        return Chip(
          label: Text(_dynamicChips[index]),
          onDeleted: () {
            setState(() {
              _dynamicChips.removeAt(index);
            });
          },
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    dynamicChips();
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            SearchHeader(),
            SizedBox(height: getProportionateScreenHeight(30)),
            // DiscountBanner(),
            // SizedBox(height: getProportionateScreenHeight(30)),
            // Categories(),
            showCategories(),
            SizedBox(height: getProportionateScreenHeight(30)),
            dynamicChips(),
            SizedBox(height: getProportionateScreenHeight(30)),
            SectionTitle(
              text: "Result search for you",
              press: () {},
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CardStore(
                        address: this.widget.address,
                        description: this.widget.description,
                        guestCheckout: this.widget.guestCheckout,
                        isLike: this.widget.isLike,
                        phone: this.widget.phone,
                        ratingNum: this.widget.ratingNum,
                        storeName: this.widget.storeName,
                        imageUrl: this.widget.imageUrl,
                        priceStart: "\$1.29",
                        priceEnd: "\$9.5",
                        distanceFromLocation: "2.4km",
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(10),
                      ),
                      CardStore(
                        address:
                            "2 Phan Văn Trị, Phường 14, Bình Thạnh, TP.HCM",
                        description: this.widget.description,
                        guestCheckout: this.widget.guestCheckout,
                        isLike: false,
                        phone: this.widget.phone,
                        ratingNum: this.widget.ratingNum,
                        storeName: "Liem Barber Shop",
                        imageUrl:
                            "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/barber-shop.jpg",
                        priceStart: "\$2.0",
                        priceEnd: "\$15.5",
                        distanceFromLocation: "0.4km",
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CardStore(
                        address: this.widget.address,
                        description: this.widget.description,
                        guestCheckout: this.widget.guestCheckout,
                        isLike: this.widget.isLike,
                        phone: this.widget.phone,
                        ratingNum: this.widget.ratingNum,
                        storeName: "Barber Asia",
                        imageUrl:
                            "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/barberShop_1.jpg",
                        priceStart: "\$5.29",
                        priceEnd: "\$20.5",
                        distanceFromLocation: "2.8km",
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(10),
                      ),
                      CardStore(
                        address: this.widget.address,
                        description: this.widget.description,
                        guestCheckout: this.widget.guestCheckout,
                        isLike: this.widget.isLike,
                        phone: this.widget.phone,
                        ratingNum: this.widget.ratingNum,
                        storeName: "Barber Nguyen Trai",
                        imageUrl:
                            "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/Logo_Stores/menBoutique.PNG",
                        priceStart: "\$2.09",
                        priceEnd: "\$16.0",
                        distanceFromLocation: "1.4km",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                decoration: BoxDecoration(
                  color: Color(0xFFFFECDF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.network(icon),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
