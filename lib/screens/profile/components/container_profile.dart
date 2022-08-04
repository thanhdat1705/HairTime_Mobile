import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/shared_variables.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

class ContainerProfile extends StatelessWidget {
  final bool typeOfPic;
  final String svgFirstPicture;
  final String imagePicture;
  final String textName;
  final Function onTap;
  const ContainerProfile({
    Key key,
    @required this.typeOfPic,
    @required this.svgFirstPicture,
    @required this.imagePicture,
    @required this.textName,
    @required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Container(
        height: getProportionateScreenHeight(100),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                height: getProportionateScreenHeight(40),
                width: getProportionateScreenWidth(50),
                child: ClipRRect(
                  child: this.typeOfPic
                      ? SvgPicture.network(this.svgFirstPicture)
                      : Image.network(this.imagePicture),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                width: getProportionateScreenWidth(200),
                child: Text(
                  this.textName,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(18),
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: ClipRRect(
                child: Container(
                  height: getProportionateScreenHeight(25),
                  width: getProportionateScreenWidth(25),
                  child: SvgPicture.network(DOUBLEARROWRIGHTPIC),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
