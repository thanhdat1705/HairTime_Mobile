import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/store_detail/presenter/store_detail_screen_persenter.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/contants.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

class HappyComboCard extends StatefulWidget {
  final IStoreDetailScreenPresenter presenter;

  const HappyComboCard({Key key, this.presenter}) : super(key: key);
  @override
  _HappyComboCardState createState() => _HappyComboCardState();
}

class _HappyComboCardState extends State<HappyComboCard> {
  bool _isSelected = false;

  void checkSelected() {
    setState(() {
      _isSelected = !_isSelected;
    });
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
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(15),
          vertical: getProportionateScreenHeight(15)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue[50],
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
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)),
          image: DecorationImage(
            image: NetworkImage(
                "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/happy_combo.png"),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: getProportionateScreenHeight(20),
              right: getProportionateScreenWidth(48),
                          child: FlatButton(
                  onPressed: () {
                    checkSelected();
                    // setState(() {
                    this.widget.presenter.addListCheckSelectedCombo("16");
                    // });
                    unCheckedIsTrue("Happy Combo", "16");
                    addToCard("16");
                    print('selectd combo');
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                          color: _isSelected ? Colors.red : Colors.black)),
                  color: _isSelected ? Colors.red : Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        _isSelected ? Icons.check : Icons.add,
                        color: _isSelected ? Colors.white : Colors.black,
                        size: 16,
                      ),
                      SizedBox(width: getProportionateScreenWidth(10)),
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
      ),
    );
  }
}
