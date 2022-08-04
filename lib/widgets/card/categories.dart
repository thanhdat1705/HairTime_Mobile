import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {
        "icon":
            "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/man.svg",
        "text": "Man"
      },
      {
        "icon":
            "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/woman.svg",
        "text": "Woman"
      },
      {
        "icon":
            "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/baby-boy.svg",
        "text": "Kid"
      },
      {
        "icon":
            "https://raw.githubusercontent.com/abuanwar072/E-commerce-Complete-Flutter-UI/48a19c61b9689cded0b92876ff0fa0dc5af8c332/assets/icons/Gift%20Icon.svg",
        "text": "Daily Gift"
      },
      {
        "icon":
            "https://raw.githubusercontent.com/abuanwar072/E-commerce-Complete-Flutter-UI/48a19c61b9689cded0b92876ff0fa0dc5af8c332/assets/icons/Discover.svg",
        "text": "More"
      },
    ];
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
                print('minh');
              },
            ),
          ),
        ],
      ),
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
