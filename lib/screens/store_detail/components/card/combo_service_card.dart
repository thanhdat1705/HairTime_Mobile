import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/store_detail/presenter/store_detail_screen_persenter.dart';
import 'package:project_hair_time_mobile/shared/models/stores/stores.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/contants.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/widgets/button/two_side_rounded_button.dart';
import 'package:project_hair_time_mobile/widgets/card/store_rating.dart';

class ComboServiceCard extends StatefulWidget {
  final String id;
  final String comboName;
  final String price;
  final IStoreDetailScreenPresenter presenter;

  const ComboServiceCard({
    Key key,
    this.comboName,
    this.price,
    this.presenter, this.id,
  }) : super(key: key);

  @override
  _ComboServiceCardState createState() => _ComboServiceCardState();
}

class _ComboServiceCardState extends State<ComboServiceCard> {
  bool _isSelected = false;
  Store store;

  @override
  void initState() {
    // checkSelected();
    checkComboExisted(this.widget.id);
    super.initState();
  }

  void checkComboExisted(String id) {
    if (this.widget.presenter.storeDetailScreenViewModel.listCheckSelectedCombo.contains(id)) {
      _isSelected = true;
    }
  }

  void initSelectedCombo() {

  }

  void unCheckedIsTrue(String comboName, String idCombo) {
    if(_isSelected == false) {
        this.widget.presenter.removeCheckedComboServiceInCard(idCombo);
    }
  }
  void addToCard(String id) {
    if (_isSelected == true) {
      this.widget.presenter.addComboServiceToCard(id);
    }
  }
  void checkSelected() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(15),
          vertical: getProportionateScreenHeight(15)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 10,
            color: kShadowColor,
          )
        ],
      ),
      height: SizeConfig.screenHeight * 0.25,
      width: SizeConfig.screenWidth * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/combo.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              // color: Colors.red,
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    maxLines: 3,
                    text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: this.widget.comboName + "\n",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: getProportionateScreenHeight(18)),
                        ),
                        TextSpan(
                          text: "\$" + this.widget.price,
                          style: TextStyle(color: Colors.grey[600], fontSize: getProportionateScreenHeight(16)),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.favorite,
                                size: getProportionateScreenHeight(12),
                                color: Colors.pink[300],
                              ),
                              Text("1,452,169 selected ones",
                                  style: TextStyle(
                                    fontSize: getProportionateScreenHeight(10),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: FlatButton(
                            onPressed: () {
                              checkSelected();
                              // setState(() {
                                this.widget.presenter.addListCheckSelectedCombo(this.widget.id);
                              // });
                              unCheckedIsTrue(this.widget.comboName, this.widget.id);
                              addToCard(this.widget.id);
                              print('selectd combo');
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(
                                    color: _isSelected
                                        ? Colors.red
                                        : Colors.black)),
                            color: _isSelected ? Colors.red : Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  _isSelected ? Icons.check : Icons.add,
                                  color: _isSelected ? Colors.white : Colors.black,
                                  size: 16,
                                ),
                                SizedBox(
                                    width: getProportionateScreenWidth(10)),
                                _isSelected
                                    ? Text(
                                        "Selected",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.white),
                                      )
                                    : Text(
                                        "Selection",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.black),
                                      ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
