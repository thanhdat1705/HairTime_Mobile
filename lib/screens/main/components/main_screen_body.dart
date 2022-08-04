import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:project_hair_time_mobile/screens/calendar_page/calendar_page.dart';
import 'package:project_hair_time_mobile/screens/chat/home_chat_screen.dart';
import 'package:project_hair_time_mobile/screens/main/components/booking_recently_container.dart';
import 'package:project_hair_time_mobile/screens/main/components/hot_combo_container.dart';
import 'package:project_hair_time_mobile/screens/main/components/top_favorite_store_container.dart';
import 'package:project_hair_time_mobile/screens/main/components/top_reviews_store_container.dart';
import 'package:project_hair_time_mobile/screens/main/services/main_screen_service.dart';
import 'package:project_hair_time_mobile/screens/map/map/home_map.dart';
import 'package:project_hair_time_mobile/screens/methods_payment/data/methods_payment_data.dart';
import 'package:project_hair_time_mobile/screens/notify/notify_screen.dart';
import 'package:project_hair_time_mobile/screens/thanks_you/thanks_you_screen.dart';
import 'package:project_hair_time_mobile/screens/ticket_user_service/ticket_user_screen.dart';
import 'package:project_hair_time_mobile/shared_data/hot_combo_service_list.dart';
import 'package:project_hair_time_mobile/shared_data/recommend_stores_list.dart';
import 'package:project_hair_time_mobile/shared_data/stores_list.dart';
import 'package:project_hair_time_mobile/screens/main/components/recommend_container.dart';
import 'package:project_hair_time_mobile/screens/main/components/service_container.dart';
import 'package:project_hair_time_mobile/screens/main/components/weekdays_sales_container.dart';
import 'package:project_hair_time_mobile/screens/main/presenter/main_presenter.dart';
import 'package:project_hair_time_mobile/screens/profile/profile_screen.dart';
import 'package:project_hair_time_mobile/screens/search_store/search_screen.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/shared_data/top_favorite_stores_list.dart';
import 'package:project_hair_time_mobile/shared_data/booking_store_recently_list.dart';
import 'package:project_hair_time_mobile/shared_data/top_review_stores_list.dart';
import 'package:project_hair_time_mobile/widgets/banner/autoscroll_horizontal_banner.dart';
import 'package:project_hair_time_mobile/widgets/bottom_bar/curved_navigation_bar.dart';
import 'package:project_hair_time_mobile/widgets/filed/search_filed.dart';
import 'package:project_hair_time_mobile/widgets/popup_menu_button/CustomPopUpMenuButton.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/shared_variables.dart';

import '../main_screen.dart';

class MainPage extends StatefulWidget {
  final MainPresenter presenter;
  final discountData;
  MainPage(
    this.presenter, {
    Key key,
    this.discountData,
  }) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  CarouselController carouselController = CarouselController();
  Widget firstStore;
  Widget secondStore;
  Widget thirdStore;
  Widget fourthStore;

  Widget hotComboFirstStore;
  Widget hotComboSecondStore;
  Widget hotComboThirdStore;
  Widget hotComboFourthdStore;

  Widget recommendFirstStore;
  Widget recommendSecondStore;
  Widget recommendThirdStore;
  Widget recommendFourthdStore;

  Widget topReviewFirstStore;
  Widget topReviewSecondStore;
  Widget topReviewThirdStore;
  Widget topReviewFourthdStore;

  Widget topFavoriteFirstStore;
  Widget topFavoriteSecondStore;
  Widget topFavoriteThirdStore;
  Widget topFavoriteFourthdStore;

  String _defaultLocation = 'Hồ Chí Minh';
  bool _chosenLocation = false;

  @override
  void initState() {
    super.initState();
    this._chosenLocation = false;
    this.firstStore = (WeekdaysSaleContainer(
      storeImage: haircutStoresList[0]["storeLogo"],
      storeService: haircutStoresList[0]["storeService"],
      servicePrice: haircutStoresList[0]["servicePrice"],
      promotionPrice: haircutStoresList[0]["promotionPrice"],
      distanceFromLocation: haircutStoresList[0]["distanceFromLocation"],
      ratingStar: haircutStoresList[0]["ratingStar"],
      storeName: haircutStoresList[0]["storeName"],
      storeDiscount: haircutStoresList[0]["storeDiscountImg"],
      storeAddress: haircutStoresList[0]["storeAddress"],
      index: 0,
    ));
    this.secondStore = (WeekdaysSaleContainer(
      storeImage: haircutStoresList[1]["storeLogo"],
      storeService: haircutStoresList[1]["storeService"],
      servicePrice: haircutStoresList[1]["servicePrice"],
      promotionPrice: haircutStoresList[1]["promotionPrice"],
      distanceFromLocation: haircutStoresList[1]["distanceFromLocation"],
      ratingStar: haircutStoresList[1]["ratingStar"],
      storeName: haircutStoresList[1]["storeName"],
      storeDiscount: haircutStoresList[1]["storeDiscountImg"],
      storeAddress: haircutStoresList[1]["storeAddress"],
      index: 1,
    ));
    this.thirdStore = (WeekdaysSaleContainer(
      storeImage: haircutStoresList[2]["storeLogo"],
      storeService: haircutStoresList[2]["storeService"],
      servicePrice: haircutStoresList[2]["servicePrice"],
      promotionPrice: haircutStoresList[2]["promotionPrice"],
      distanceFromLocation: haircutStoresList[2]["distanceFromLocation"],
      ratingStar: haircutStoresList[2]["ratingStar"],
      storeName: haircutStoresList[2]["storeName"],
      storeDiscount: haircutStoresList[2]["storeDiscountImg"],
      storeAddress: haircutStoresList[2]["storeAddress"],
      index: 2,
    ));
    this.fourthStore = (WeekdaysSaleContainer(
      storeImage: haircutStoresList[3]["storeLogo"],
      storeService: haircutStoresList[3]["storeService"],
      servicePrice: haircutStoresList[3]["servicePrice"],
      promotionPrice: haircutStoresList[3]["promotionPrice"],
      distanceFromLocation: haircutStoresList[3]["distanceFromLocation"],
      ratingStar: haircutStoresList[3]["ratingStar"],
      storeName: haircutStoresList[3]["storeName"],
      storeDiscount: haircutStoresList[3]["storeDiscountImg"],
      storeAddress: haircutStoresList[3]["storeAddress"],
      index: 3,
    ));

    // Hot ComboF

    // Hot Store
    this.recommendFirstStore = (RecommendContainer(
      hotServiceStore: recommendStoresList[0]["hotServiceStore"],
      servicePrice: recommendStoresList[0]["servicePrice"],
      imageUrl: recommendStoresList[0]["storeLogo"],
      storeName: recommendStoresList[0]["storeName"],
      distanceFromLocation: recommendStoresList[0]["distanceFromLocation"],
      reviewsStore: recommendStoresList[0]["reviewsStore"],
      bookingRecently: recommendStoresList[0]["bookingRecently"],
      storeAddress: recommendStoresList[0]["storeAddress"],
      index: 0,
    ));
    this.recommendSecondStore = (RecommendContainer(
      hotServiceStore: recommendStoresList[1]["hotServiceStore"],
      servicePrice: recommendStoresList[1]["servicePrice"],
      imageUrl: recommendStoresList[1]["storeLogo"],
      storeName: recommendStoresList[1]["storeName"],
      distanceFromLocation: recommendStoresList[1]["distanceFromLocation"],
      reviewsStore: recommendStoresList[1]["reviewsStore"],
      bookingRecently: recommendStoresList[1]["bookingRecently"],
      storeAddress: recommendStoresList[1]["storeAddress"],
      index: 1,
    ));
    this.recommendThirdStore = (RecommendContainer(
      hotServiceStore: recommendStoresList[2]["hotServiceStore"],
      servicePrice: recommendStoresList[2]["servicePrice"],
      imageUrl: recommendStoresList[2]["storeLogo"],
      storeName: recommendStoresList[2]["storeName"],
      distanceFromLocation: recommendStoresList[2]["distanceFromLocation"],
      reviewsStore: recommendStoresList[2]["reviewsStore"],
      bookingRecently: recommendStoresList[2]["bookingRecently"],
      storeAddress: recommendStoresList[2]["storeAddress"],
      index: 2,
    ));
    this.recommendFourthdStore = (RecommendContainer(
      hotServiceStore: recommendStoresList[3]["hotServiceStore"],
      servicePrice: recommendStoresList[3]["servicePrice"],
      imageUrl: recommendStoresList[3]["storeLogo"],
      storeName: recommendStoresList[3]["storeName"],
      distanceFromLocation: recommendStoresList[3]["distanceFromLocation"],
      reviewsStore: recommendStoresList[3]["reviewsStore"],
      bookingRecently: recommendStoresList[3]["bookingRecently"],
      storeAddress: recommendStoresList[3]["storeAddress"],
      index: 3,
    ));

    // Top Good Reviews Store
    this.topReviewFirstStore = (TopReviewsStoreContainer(
      imageUrl: topReviewsStoresList[0]["storeLogo"],
      storeName: topReviewsStoresList[0]["storeName"],
      hotServiceStore: topReviewsStoresList[0]["hotServiceStore"],
      servicePrice: topReviewsStoresList[0]["servicePrice"],
      storeAddress: topReviewsStoresList[0]["storeAddress"],
      priceStart: topReviewsStoresList[0]["priceStart"],
      priceEnd: topReviewsStoresList[0]["priceEnd"],
      reviewsStore: topReviewsStoresList[0]["reviewsStore"],
      distanceFromLocation: topReviewsStoresList[0]["distanceFromLocation"],
      index: 0,
    ));
    this.topReviewSecondStore = (TopReviewsStoreContainer(
      imageUrl: topReviewsStoresList[1]["storeLogo"],
      storeName: topReviewsStoresList[1]["storeName"],
      hotServiceStore: topReviewsStoresList[1]["hotServiceStore"],
      servicePrice: topReviewsStoresList[1]["servicePrice"],
      storeAddress: topReviewsStoresList[1]["storeAddress"],
      priceStart: topReviewsStoresList[1]["priceStart"],
      priceEnd: topReviewsStoresList[1]["priceEnd"],
      reviewsStore: topReviewsStoresList[1]["reviewsStore"],
      distanceFromLocation: topReviewsStoresList[1]["distanceFromLocation"],
      index: 1,
    ));
    this.topReviewThirdStore = (TopReviewsStoreContainer(
      imageUrl: topReviewsStoresList[2]["storeLogo"],
      storeName: topReviewsStoresList[2]["storeName"],
      hotServiceStore: topReviewsStoresList[2]["hotServiceStore"],
      servicePrice: topReviewsStoresList[2]["servicePrice"],
      storeAddress: topReviewsStoresList[2]["storeAddress"],
      priceStart: topReviewsStoresList[2]["priceStart"],
      priceEnd: topReviewsStoresList[2]["priceEnd"],
      reviewsStore: topReviewsStoresList[2]["reviewsStore"],
      distanceFromLocation: topReviewsStoresList[2]["distanceFromLocation"],
      index: 2,
    ));
    this.topReviewFourthdStore = (TopReviewsStoreContainer(
      imageUrl: topReviewsStoresList[3]["storeLogo"],
      storeName: topReviewsStoresList[3]["storeName"],
      hotServiceStore: topReviewsStoresList[3]["hotServiceStore"],
      servicePrice: topReviewsStoresList[3]["servicePrice"],
      storeAddress: topReviewsStoresList[3]["storeAddress"],
      priceStart: topReviewsStoresList[3]["priceStart"],
      priceEnd: topReviewsStoresList[3]["priceEnd"],
      reviewsStore: topReviewsStoresList[3]["reviewsStore"],
      distanceFromLocation: topReviewsStoresList[3]["distanceFromLocation"],
      index: 3,
    ));

    // Top Favorite Store
    this.topFavoriteFirstStore = (TopFavoriteStoreContainer(
      hotServiceStore: topFavoriteStoreList[0]["hotServiceStore"],
      servicePrice: topFavoriteStoreList[0]["servicePrice"],
      imageUrl: topFavoriteStoreList[0]["storeLogo"],
      storeName: topFavoriteStoreList[0]["storeName"],
      storeAddress: topFavoriteStoreList[0]["storeAddress"],
      priceStart: topFavoriteStoreList[0]["priceStart"],
      priceEnd: topFavoriteStoreList[0]["priceEnd"],
      likesNumber: topFavoriteStoreList[0]["likesNumber"],
      reviewsStore: topFavoriteStoreList[0]["reviewsStore"],
      distanceFromLocation: topFavoriteStoreList[0]["distanceFromLocation"],
      index: 0,
    ));
    this.topFavoriteSecondStore = (TopFavoriteStoreContainer(
      hotServiceStore: topFavoriteStoreList[1]["hotServiceStore"],
      servicePrice: topFavoriteStoreList[1]["servicePrice"],
      imageUrl: topFavoriteStoreList[1]["storeLogo"],
      storeName: topFavoriteStoreList[1]["storeName"],
      storeAddress: topFavoriteStoreList[1]["storeAddress"],
      priceStart: topFavoriteStoreList[1]["priceStart"],
      priceEnd: topFavoriteStoreList[1]["priceEnd"],
      likesNumber: topFavoriteStoreList[1]["likesNumber"],
      reviewsStore: topFavoriteStoreList[1]["reviewsStore"],
      distanceFromLocation: topFavoriteStoreList[1]["distanceFromLocation"],
      index: 1,
    ));
    this.topFavoriteThirdStore = (TopFavoriteStoreContainer(
      hotServiceStore: topFavoriteStoreList[2]["hotServiceStore"],
      servicePrice: topFavoriteStoreList[2]["servicePrice"],
      imageUrl: topFavoriteStoreList[2]["storeLogo"],
      storeName: topFavoriteStoreList[2]["storeName"],
      storeAddress: topFavoriteStoreList[2]["storeAddress"],
      priceStart: topFavoriteStoreList[2]["priceStart"],
      priceEnd: topFavoriteStoreList[2]["priceEnd"],
      likesNumber: topFavoriteStoreList[2]["likesNumber"],
      reviewsStore: topFavoriteStoreList[2]["reviewsStore"],
      distanceFromLocation: topFavoriteStoreList[2]["distanceFromLocation"],
      index: 2,
    ));
    this.topFavoriteFourthdStore = (TopFavoriteStoreContainer(
      hotServiceStore: topFavoriteStoreList[3]["hotServiceStore"],
      servicePrice: topFavoriteStoreList[3]["servicePrice"],
      imageUrl: topFavoriteStoreList[3]["storeLogo"],
      storeName: topFavoriteStoreList[3]["storeName"],
      storeAddress: topFavoriteStoreList[3]["storeAddress"],
      priceStart: topFavoriteStoreList[3]["priceStart"],
      priceEnd: topFavoriteStoreList[3]["priceEnd"],
      likesNumber: topFavoriteStoreList[3]["likesNumber"],
      reviewsStore: topFavoriteStoreList[3]["reviewsStore"],
      distanceFromLocation: topFavoriteStoreList[3]["distanceFromLocation"],
      index: 3,
    ));
  }

  void _onTapTextField() {
    setState(() {
      this._chosenLocation = false;
    });
  }

  Dialog _map() {
    return new Dialog(
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return HomeMap();
        },
      ),
    );
  }

  Widget dialogCancel() {
    return AlertDialog(
      title: Text("Please tell us the reason"),
      content: TextField(
        maxLength: null,
        maxLines: null,
      ),
      actions: [
        FlatButton(
          child: Text('OK'),
          onPressed: () {
            cancelBill = false;

            initMainScreen(context);
          },
        ),
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: getProportionateScreenWidth(420),
                    height: getProportionateScreenHeight(180),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: getProportionateScreenHeight(150),
                          width: getProportionateScreenWidth(420),
                          child: AutoScrollBanner(
                            imageList: IMGBANNERLIST,
                            scrollTime: Duration(seconds: 2),
                            carouselController: carouselController,
                            heightImage: null,
                            widthImage: getProportionateScreenWidth(420),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 130, 20, 0),
                          height: getProportionateScreenHeight(40),
                          width: getProportionateScreenWidth(420),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: <Widget>[
                              SearchFiled(
                                widthContainer:
                                    getProportionateScreenWidth(180),
                                heightContainer:
                                    getProportionateScreenHeight(40),
                                boxDecorationColor: Colors.white,
                                opacityBoxDecorationColor: 1,
                                borderRadiusBoxDecoration: 5,
                                onChanged: null,
                                readOnlyTextField: this._chosenLocation,
                                onTap: this._onTapTextField,
                                hintText: 'Search ...',
                                searchIconColor: Colors.grey,
                                widthHorizontalContentPadding:
                                    getProportionateScreenWidth(30),
                                widthVerticalContentPadding:
                                    getProportionateScreenWidth(10),
                              ),
                              Container(
                                width: getProportionateScreenWidth(150),
                                height: getProportionateScreenHeight(40),
                                margin: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                                child: CustomPopupMenuButton<String>(
                                  height: 200,
                                  offset: Offset(0, 50),
                                  itemBuilder: (context) {
                                    return this
                                        .widget
                                        .presenter
                                        .getProvicensName()
                                        .map(
                                      (str) {
                                        return PopupMenuItem(
                                          value: str,
                                          child: Text(str),
                                        );
                                      },
                                    ).toList();
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.location_on,
                                        size: getProportionateScreenWidth(24),
                                        color: Colors.red,
                                      ),
                                      Container(
                                        width: getProportionateScreenWidth(100),
                                        height:
                                            getProportionateScreenHeight(40),
                                        alignment: Alignment.center,
                                        child: Text(
                                          this._defaultLocation,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Icon(Icons.arrow_drop_down),
                                    ],
                                  ),
                                  onSelected: (location) {
                                    setState(
                                      () {
                                        this._chosenLocation = true;
                                        this._defaultLocation = location;
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    height: getProportionateScreenHeight(100),
                    width: getProportionateScreenWidth(420),
                    child: Row(
                      children: <Widget>[
                        ServiceContainer(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchScreen()),
                            );
                          },
                          heightContainer: getProportionateScreenHeight(80),
                          widthContainer: getProportionateScreenWidth(55),
                          heightSvgContainer: getProportionateScreenHeight(50),
                          widthSvgContainer: getProportionateScreenWidth(55),
                          svgPicture: HAIRCUTSERVICEIMG,
                          svgPictureColor: Colors.tealAccent[700],
                          serviceName: 'Haircut',
                        ),
                        ServiceContainer(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchScreen()),
                            );
                          },
                          heightContainer: getProportionateScreenHeight(80),
                          widthContainer: getProportionateScreenWidth(55),
                          heightSvgContainer: getProportionateScreenHeight(50),
                          widthSvgContainer: getProportionateScreenWidth(55),
                          svgPicture: MASSAGESERVICEIMG,
                          svgPictureColor: Colors.redAccent[100],
                          serviceName: 'Facial',
                        ),
                        ServiceContainer(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchScreen()),
                            );
                          },
                          heightContainer: getProportionateScreenHeight(80),
                          widthContainer: 100,
                          heightSvgContainer: getProportionateScreenHeight(50),
                          widthSvgContainer: 100,
                          svgPicture: HAIRWASHINGSERVICEIMG,
                          svgPictureColor: Colors.deepPurpleAccent[100],
                          serviceName: 'Hair washing',
                        ),
                        ServiceContainer(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchScreen()),
                            );
                          },
                          heightContainer: getProportionateScreenHeight(80),
                          widthContainer: 100,
                          heightSvgContainer: getProportionateScreenHeight(50),
                          widthSvgContainer: 100,
                          svgPicture: HAIRDYESERVICEIMG,
                          svgPictureColor: Colors.indigoAccent[100],
                          serviceName: 'Hair coloring',
                        ),
                      ],
                    ),
                  ),

                  Visibility(
                      // cancelBill
                      visible: cancelBill,
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                            height: SizeConfig.screenHeight * 0.4 - 50,
                            width: SizeConfig.screenWidth,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  offset: Offset(0, 3),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        MdiIcons.calendar,
                                        color: Colors.grey[800],
                                        size: 40,
                                      ),
                                      SizedBox(
                                          width:
                                              getProportionateScreenWidth(10)),
                                      Text(
                                        'Your barber appointment',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.grey[800],
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                      height: getProportionateScreenHeight(5)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          width:
                                              getProportionateScreenWidth(10)),
                                      Container(
                                        height: 5,
                                        width: 5,
                                        margin: EdgeInsets.only(top: 8),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[800],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50))),
                                      ),
                                      SizedBox(
                                          width:
                                              getProportionateScreenWidth(5)),
                                      Text(
                                        'Salon: ',
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.grey[800],
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Container(
                                        width:
                                            SizeConfig.screenWidth * 0.7 - 20,
                                        child: Text(
                                          'Liem Barber Shop - 2 Phan Van Tri, Phuong 14, Binh Thanh, TP.HCM',
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.grey[800],
                                              fontWeight: FontWeight.w600),
                                          maxLines: 2,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                      height: getProportionateScreenHeight(5)),
                                  Row(
                                    children: [
                                      SizedBox(
                                          width:
                                              getProportionateScreenWidth(10)),
                                      Container(
                                        height: 5,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[800],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50))),
                                      ),
                                      SizedBox(
                                          width:
                                              getProportionateScreenWidth(5)),
                                      Text(
                                        'Time: ',
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.grey[800],
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        '16:11 Thu 12 Nov 2020',
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.grey[800],
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                      height: getProportionateScreenHeight(5)),
                                  Row(
                                    children: [
                                      SizedBox(
                                          width:
                                              getProportionateScreenWidth(10)),
                                      Container(
                                        height: 5,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[800],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50))),
                                      ),
                                      SizedBox(
                                          width:
                                              getProportionateScreenWidth(5)),
                                      Text(
                                        'Number of seat: ',
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.grey[800],
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        '2',
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.grey[800],
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                      height: getProportionateScreenHeight(5)),
                                  Row(
                                    children: [
                                      SizedBox(
                                          width:
                                              getProportionateScreenWidth(10)),
                                      Container(
                                        height: 5,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[800],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50))),
                                      ),
                                      SizedBox(
                                          width:
                                              getProportionateScreenWidth(5)),
                                      Text(
                                        'Still 0 days from 06:30 until appointment',
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.grey[800],
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    CalendarPage(
                                                  servicesId: '5',
                                                  amount: '3',
                                                  discountData:
                                                      this.widget.discountData,
                                                  methodPayment:
                                                      methodPaymentList[0],
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            height:
                                                getProportionateScreenHeight(
                                                    40),
                                            width: getProportionateScreenWidth(
                                                180),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 2)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Change appointment',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17),
                                                ),
                                                Icon(Icons.av_timer),
                                              ],
                                            ),
                                          )),
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (_) => _map(),
                                          );
                                        },
                                        child: Container(
                                          height:
                                              getProportionateScreenHeight(40),
                                          width:
                                              getProportionateScreenWidth(130),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 2)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Way to store',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                ),
                                              ),
                                              Icon(Icons.location_on),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) => this.dialogCancel(),
                                          barrierDismissible: false);
                                    },
                                    child: Container(
                                      // color: Colors.red,
                                      width: SizeConfig.screenWidth,
                                      alignment: Alignment.center,
                                      margin:
                                          EdgeInsets.only(top: 5, bottom: 5),
                                      child: Text('Cancel schedule',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              decoration:
                                                  TextDecoration.underline)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            right: 30,
                            child: GestureDetector(
                              onTap: () {
                                GeneralHelper.navigateToScreen(
                                    context, new NotifyScreen(), true);
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                // color: Colors.yellow,
                                child: Stack(
                                  children: [
                                    Icon(
                                      Icons.notifications,
                                      size: 35,
                                    ),
                                    Positioned(
                                        right: 0,
                                        child: Container(
                                          height: 20,
                                          width: 20,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50))),
                                          child: Text('2',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white)),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )),

                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                    child: Text(
                      'Big promotion on weekdays',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: getProportionateScreenWidth(18),
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.red,
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    // width: getProportionateScreenWidth(400),
                    width: SizeConfig.screenWidth,
                    height: getProportionateScreenHeight(480),
                    child: Column(
                      children: <Widget>[
                        Container(
                          // color: Colors.yellow,
                          width: SizeConfig.screenWidth,
                          height: getProportionateScreenHeight(230),
                          // margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              this.firstStore,
                              Spacer(),
                              this.secondStore,
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: SizeConfig.screenWidth,
                          height: getProportionateScreenHeight(230),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              this.thirdStore,
                              Spacer(),
                              this.fourthStore,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                      vertical: getProportionateScreenHeight(10),
                    ),
                    child: Text(
                      'Hot Combo',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: getProportionateScreenWidth(18),
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    height: getProportionateScreenHeight(220),
                    margin: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(18),
                    ),
                    child: ListView.builder(
                      itemCount: hotComboList.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return new HotComboContainer(
                          imageUrl: hotComboList[index]["storeLogo"],
                          storeName: hotComboList[index]["storeName"],
                          storeAddress: hotComboList[index]["storeAddress"],
                          hotComboService: hotComboList[index]
                              ["hotComboService"],
                          comboPrice: hotComboList[index]["comboPrice"],
                          distanceFromLocation: hotComboList[index]
                              ["distanceFromLocation"],
                          reviewsStore: hotComboList[index]["reviewsStore"],
                          index: index,
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                      vertical: getProportionateScreenHeight(20),
                    ),
                    child: Text(
                      'Hot Store',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: getProportionateScreenWidth(18),
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.red,
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    height: getProportionateScreenHeight(490),
                    width: SizeConfig.screenWidth,
                    // color: Colors.red,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: SizeConfig.screenWidth,
                          height: getProportionateScreenHeight(240),
                          // margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          // color: Colors.yellow,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              this.recommendFirstStore,
                              Spacer(),
                              this.recommendSecondStore,
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: SizeConfig.screenWidth,
                          height: getProportionateScreenHeight(240),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              this.recommendThirdStore,
                              Spacer(),
                              this.recommendFourthdStore,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.symmetric(
                  //     horizontal: getProportionateScreenWidth(20),
                  //     vertical: getProportionateScreenHeight(20),
                  //   ),
                  //   child: Text(
                  //     'Top Good Reviews Store',
                  //     style: TextStyle(
                  //       color: Colors.orange,
                  //       fontSize: getProportionateScreenWidth(18),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  //   width: SizeConfig.screenWidth,
                  //   height: getProportionateScreenHeight(490),
                  //   color: Colors.red,
                  //   child: Column(
                  //     children: <Widget>[
                  //       Container(
                  //         width: getProportionateScreenWidth(400),
                  //         height: getProportionateScreenHeight(240),
                  //         color: Colors.blue,
                  //         child: Row(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: <Widget>[
                  //             this.topReviewFirstStore,
                  //             Spacer(),
                  //             this.topReviewSecondStore,
                  //           ],
                  //         ),
                  //       ),
                  //       Spacer(),
                  //       Container(
                  //         width: getProportionateScreenWidth(400),
                  //         height: getProportionateScreenHeight(240),
                  //         child: Row(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: <Widget>[
                  //             this.topReviewThirdStore,
                  //             Spacer(),
                  //             this.topReviewFourthdStore,
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                      vertical: getProportionateScreenHeight(10),
                    ),
                    child: Text(
                      'Top Favorite Store',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: getProportionateScreenWidth(18),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    width: SizeConfig.screenWidth,
                    height: getProportionateScreenHeight(500),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: getProportionateScreenWidth(400),
                          height: getProportionateScreenHeight(240),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              this.topFavoriteFirstStore,
                              Spacer(),
                              this.topFavoriteSecondStore,
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: getProportionateScreenWidth(400),
                          height: getProportionateScreenHeight(240),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              this.topFavoriteThirdStore,
                              Spacer(),
                              this.topFavoriteFourthdStore,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                      vertical: getProportionateScreenHeight(10),
                    ),
                    child: Text(
                      'Booking Recently',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: getProportionateScreenWidth(18),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: getProportionateScreenHeight(20)),
                    child: Container(
                      width: SizeConfig.screenWidth,
                      height: getProportionateScreenHeight(250),
                      margin: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(18),
                      ),
                      child: ListView.builder(
                        itemCount: bookingStoreRecentlyList.length,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return new BookingStoreRecentlyContainer(
                            reviewsStore: bookingStoreRecentlyList[index]
                                ["reviewsStore"],
                            imageUrl: bookingStoreRecentlyList[index]
                                ["storeLogo"],
                            storeName: bookingStoreRecentlyList[index]
                                ["storeName"],
                            storeAddress: bookingStoreRecentlyList[index]
                                ["storeAddress"],
                            priceStart: bookingStoreRecentlyList[index]
                                ["priceStart"],
                            priceEnd: bookingStoreRecentlyList[index]
                                ["priceEnd"],
                            bookingTime: bookingStoreRecentlyList[index]
                                ["bookingTime"],
                            distanceFromLocation:
                                bookingStoreRecentlyList[index]
                                    ["distanceFromLocation"],
                            index: index,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: false,
              child: Positioned(
                right: 10,
                bottom: 20,
                child: GestureDetector(
                  onTap: () {
                    showGeneralDialog(
                        barrierColor: Colors.black.withOpacity(0.5),
                        transitionBuilder: (context, a1, a2, widget) {
                          return Transform.scale(
                            scale: a1.value,
                            child: Opacity(
                              opacity: a1.value,
                              child: new TicketUserServiceScreen(),
                            ),
                          );
                        },
                        transitionDuration: Duration(milliseconds: 200),
                        barrierDismissible: false,
                        barrierLabel: '',
                        context: context,
                        pageBuilder: (context, animation1, animation2) {});
                    // showDialog(
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     return new BillDetailsScreen();
                    //   },
                    // );
                    // GeneralHelper.navigateToScreen(
                    //     context, new BillDetailsScreen(), false);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    height: 50,
                    width: 50,
                    child: new Icon(
                      Icons.book_online,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomizedCurvedNavigationBar(
          index: 0,
          onTap: (index) {
            switch (index) {
              case 0:
                break;
              case 1:
                GeneralHelper.navigateToScreen(
                    context, new SearchScreen(), true);
                break;
              case 2:
                GeneralHelper.navigateToScreen(
                    context, new NotifyScreen(), true);
                break;
              case 3:
                GeneralHelper.navigateToScreen(
                    context, new HomeChatScreen(), true);
                break;
              case 4:
                GeneralHelper.navigateToScreen(
                    context, new ProfileScreen(), true);
                break;
            }
          },
        ),
      ),
    );
  }
}
