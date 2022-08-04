import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/chatting/chat_screen.dart';
import 'package:project_hair_time_mobile/screens/main/services/main_screen_service.dart';
import 'package:project_hair_time_mobile/screens/service_detail/service_detail_screen.dart';
import 'package:project_hair_time_mobile/screens/store_detail/components/popup/popup_phone.dart';
import 'package:project_hair_time_mobile/screens/store_detail/components/store_detail_footer.dart';
import 'package:project_hair_time_mobile/screens/store_detail/components/tab/about_page.dart';
import 'package:project_hair_time_mobile/screens/store_detail/components/tab/location_page.dart';
import 'package:project_hair_time_mobile/screens/store_detail/components/tab/review_page.dart';
import 'package:project_hair_time_mobile/screens/store_detail/components/tab/service_page.dart';
import 'package:project_hair_time_mobile/screens/store_detail/presenter/store_detail_screen_persenter.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/contants.dart';
import 'package:project_hair_time_mobile/shared_data/service_list.dart';
import 'package:tuple/tuple.dart';

//List<dynamic> globalListService = new List();

class DetailBody extends StatefulWidget {
  final IStoreDetailScreenPresenter presenter;
  final String storeName;
  final String address;
  final String phone;
  final String description;
  final double ratingNum;
  final String guestCheckout;
  final String imageUrl;
  bool isLike;
  int servicePage;

  DetailBody({
    Key key,
    this.storeName,
    this.address,
    this.phone,
    this.description,
    this.ratingNum,
    this.guestCheckout,
    this.isLike,
    this.presenter,
    this.imageUrl,
    this.servicePage,
  }) : super(key: key);

  @override
  _DetailBodyState createState() => _DetailBodyState();
}

typedef Offset OffsetHandle(Animation animation);
enum MenuOption { Home, Share, Cancel }

class _DetailBodyState extends State<DetailBody>
    with SingleTickerProviderStateMixin {
  // StoreDetailBodyViewModel _storeDetailBodyViewModel;
  // IStoreDetailBodyPresenter _storeDetailBodyPresenter;
  // final List<Tuple3> _pages = [
  //   Tuple3('About', AboutPage(ratingNum: 4.5),
  //       Icon(Icons.description_outlined, size: 15)),
  //   Tuple3('Service', ServicePage(), Icon(Icons.local_mall_outlined, size: 15)),
  //   Tuple3('Review', ReviewPage(), Icon(Icons.rate_review_outlined, size: 15)),
  //   Tuple3(
  //       'Location', LocationPage(), Icon(Icons.location_on_outlined, size: 15)),
  // ];

  TabController _tabController;
  ScrollController _scrollController;
  List<Tuple3> _tabList;
  bool lastStatus = true;

  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  bool get isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

// void launchUrl(String url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw "Could not launch $url";
//     }
//   }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    //_storeDetailBodyPresenter = createPresenter();
    //_storeDetailBodyPresenter.detailBodyView = this;
    // this.widget.presenter.storeDetailBodyView = this;
    this._tabList = [
      Tuple3(
          'About',
          AboutPage(
            ratingNum: this.widget.ratingNum,
            storeName: this.widget.storeName,
            address: this.widget.address,
            guestCheckout: int.parse(this.widget.guestCheckout),
            description: this.widget.description,
            phone: this.widget.phone,
          ),
          Icon(Icons.description_outlined,
              size: getProportionateScreenHeight(16))),
      Tuple3(
          'Service',
          ServicePage(
            presenter: this.widget.presenter,
            tabController: _tabController,
          ),
          Icon(Icons.local_mall_outlined,
              size: getProportionateScreenHeight(16))),
      Tuple3(
          'Review',
          ReviewPage(),
          Icon(Icons.rate_review_outlined,
              size: getProportionateScreenHeight(16))),
      Tuple3(
          'Location',
          LocationPage(
            address: this.widget.address,
          ),
          Icon(Icons.location_on_outlined,
              size: getProportionateScreenHeight(16))),
    ];
    _tabController = TabController(
        initialIndex: this.widget.servicePage,
        length: this._tabList.length,
        vsync: this);
    // this._tabController.addListener(() {
    //   setState(() {});.
    // });
    // isBooking(this.widget.isBooking);
  }

  isBooking(bool isBooking) {
    if (isBooking == true) {
      setState(() {
        _tabController.animateTo(2);
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    myService.forEach((_eachCombo) {
      _eachCombo["value"]["isActive"] = false;
      _eachCombo["amount"] = '';
    });
    this._tabList = [
      Tuple3(
          'About',
          AboutPage(
            ratingNum: this.widget.ratingNum,
            storeName: this.widget.storeName,
            address: this.widget.address,
            guestCheckout: int.parse(this.widget.guestCheckout),
            description: this.widget.description,
            phone: this.widget.phone,
          ),
          Icon(Icons.description_outlined,
              size: getProportionateScreenHeight(16))),
      Tuple3(
          'Service',
          ServicePage(
            presenter: this.widget.presenter,
            tabController: _tabController,
          ),
          Icon(Icons.local_mall_outlined,
              size: getProportionateScreenHeight(16))),
      Tuple3(
          'Review',
          ReviewPage(),
          Icon(Icons.rate_review_outlined,
              size: getProportionateScreenHeight(16))),
      Tuple3(
          'Location',
          LocationPage(
            address: this.widget.address,
          ),
          Icon(Icons.location_on_outlined,
              size: getProportionateScreenHeight(16))),
    ];
    return Scaffold(
        body: Stack(
      children: [
        DefaultTabController(
          // initialIndex: 0,
          length: this._tabList.length,
          child: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverSafeArea(
                    top: false,
                    sliver: SliverAppBar(
                      iconTheme: IconThemeData(
                        color: Colors.black,
                      ),
                      backgroundColor: appBar,
                      expandedHeight: getProportionateScreenHeight(180),
                      pinned: true,
                      floating: true,
                      forceElevated: innerBoxIsScrolled,
                      leading: IconButton(
                        splashColor: Colors.transparent,
                        icon: Icon(Icons.keyboard_arrow_left_outlined),
                        color: isShrink ? Colors.black : Colors.white,
                        iconSize: 40,
                        alignment: Alignment(1, 0.0),
                        onPressed: () {
                          myService.forEach((_eachCombo) {
                            _eachCombo["value"]["isActive"] = false;
                          });
                          Navigator.pop(context);
                          print('clicked back');
                        },
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        // titlePadding: EdgeInsets.only(left: getProportionateScreenWidth(70), bottom: 17),
                        title: Text(
                          this.widget.storeName,
                          style: TextStyle(
                              color: isShrink ? Colors.black : Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        background: Image.network(
                          this.widget.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      actions: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 0.0),
                          child: IconButton(
                            splashColor: Colors.transparent,
                            onPressed: () {
                              if (!this.widget.isLike) {
                                setState(() {
                                  this.widget.isLike = true;
                                });
                              } else {
                                setState(() {
                                  this.widget.isLike = false;
                                });
                              }
                            },
                            icon: Icon(
                                this.widget.isLike
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: this.widget.isLike
                                    ? Colors.redAccent
                                    : isShrink
                                        ? Colors.black
                                        : Colors.white,
                                size: 23.0),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 0.0),
                          child: PopupMenuButton<MenuOption>(
                              onSelected: (value) {
                                if (value == MenuOption.Home) {
                                  initMainScreen(context);
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              )),
                              color: Colors.blue[100],
                              icon: Icon(
                                Icons.more_vert_outlined,
                                color: isShrink ? Colors.black : Colors.white,
                              ),
                              itemBuilder: (BuildContext context) {
                                return <PopupMenuEntry<MenuOption>>[
                                  PopupMenuItem(
                                    child: Row(
                                      children: [
                                        Icon(Icons.home_outlined),
                                        Text("Home"),
                                      ],
                                    ),
                                    value: MenuOption.Home,
                                  ),
                                  PopupMenuItem(
                                    child: Row(
                                      children: [
                                        Icon(Icons.share_outlined),
                                        Text("Share"),
                                      ],
                                    ),
                                    value: MenuOption.Share,
                                  ),
                                  PopupMenuItem(
                                    child: Row(
                                      children: [
                                        Icon(Icons.cancel_outlined),
                                        Text("Cancel"),
                                      ],
                                    ),
                                    value: MenuOption.Cancel,
                                  ),
                                ];
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: Column(
              children: [
                TabBar(
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.blue[500],
                  labelPadding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(10),
                      vertical: getProportionateScreenHeight(5)),
                  indicatorColor: Colors.blue[500],
                  controller: _tabController,
                  tabs: this
                      ._tabList
                      .map<Tab>((Tuple3 page) => Tab(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              page.item3,
                              Text(
                                page.item1,
                                style: TextStyle(
                                    fontSize: getProportionateScreenHeight(16)),
                              ),
                            ],
                          )))
                      .toList(),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: this
                        ._tabList
                        .map<Widget>((Tuple3 page) => page.item2)
                        .toList(),
                  ),
                ),
                Visibility(
                  visible: false,
                  child: StoreDetailFooter(
                    presenter: this.widget.presenter,
                    tabController: _tabController,
                    storeName: this.widget.storeName,
                    address: this.widget.address,
                  ),
                ),

                // isBooking(this.widget.isBooking),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 90,
          right: 10,
          child: Row(
            children: [
              FlatButton(
                onPressed: () => {
                  showGeneralDialog(
                      barrierColor: Colors.black.withOpacity(0.5),
                      transitionBuilder: (context, a1, a2, widget) {
                        return Transform.scale(
                          scale: a1.value,
                          child: Opacity(
                            opacity: a1.value,
                            child: PopupPhone(phoneNumber: '+08938778284'),
                          ),
                        );
                      },
                      transitionDuration: Duration(milliseconds: 200),
                      barrierDismissible: false,
                      barrierLabel: '',
                      context: context,
                      pageBuilder: (context, animation1, animation2) {})
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                color: Colors.orange,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                minWidth: 50,
                height: 50,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                child: Icon(Icons.phone_in_talk,
                    color: Colors.white,
                    size: getProportionateScreenHeight(30)),
              ),
              // FlatButton(
              //   onPressed: () => Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (_) => ChatScreen(
              //         chattingName: this.widget.storeName,
              //       ),
              //     ),
              //   ),
              //   // color: Colors.white,
              //   padding: EdgeInsets.symmetric(
              //       vertical: getProportionateScreenHeight(28)),
              //   child: Icon(
              //     Icons.chat,
              //     color: Colors.grey,
              //     size: getProportionateScreenHeight(27),
              //   ),
              // ),
            ],
          ),
        )
      ],
    ));
  }
}
