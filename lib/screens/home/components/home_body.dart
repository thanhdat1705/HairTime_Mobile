import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mvp_core/mvp_core.dart';
import 'package:project_hair_time_mobile/screens/home/components/home_search.dart';
import 'package:project_hair_time_mobile/screens/home/presenter/home_presenter.dart';
import 'package:project_hair_time_mobile/screens/home/view/home_view.dart';
import 'package:project_hair_time_mobile/screens/home/viewmodel/home_viewmodel.dart';
import 'package:project_hair_time_mobile/shared/models/fields/fields.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/shared_variables.dart';
import 'package:project_hair_time_mobile/widgets/circles/circle_button.dart';

class HomeBody extends StatefulWidget {
  final List<Field> listFields;

  HomeBody({Key key, this.listFields}) : super(key: key);
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends StateView<HomeBody, IHomePresenter>
    implements IHomeView {
  HomeViewModel _homeViewModel;
  HomePresenter _homePresenter;

  @override
  void initState() {
    super.initState();
    this._homePresenter = this.createPresenter();
    this._homePresenter.homeView = this;
  }

  @override
  IHomePresenter createPresenter() {
    // TODO: implement createPresenter
    return new HomePresenter(this.widget.listFields);
  }

  @override
  void refreshHome(HomeViewModel viewModel) {
    // TODO: implement refreshHome
    setState(() {
      this._homeViewModel = viewModel;
    });
  }

  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _tripDistance = 0;
  // final Map<String, Marker> _markers = <String, Marker>{};

  GoogleMapController _mapController;

  final Set<Marker> _markers = {};
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("build UI");
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            GoogleMap(
//              key: ggKey,
              // markers: Set.of(markers.values),
              
              markers: _markers,
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(10.7915178, 106.7271422),
                zoom: 14.4746,
              ),
              buildingsEnabled: true,
              
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    title: Text(
                      "Gần Nhà",
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: FlatButton(
                      onPressed: () {
                        print("click menu");
                        _scaffoldKey.currentState.openDrawer();
                      },
                      child: Image.network(ICMENU),
                    ),
                    actions: <Widget>[Image.network(ICNOTIFY)],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: HomeSearch(
                      listField: this._homeViewModel.ListFields,
                    ),
                  ),
                ],
              ),
            ),
            // Positioned(
            //   left: 20,
            //   right: 20,
            //   bottom: 40,
            //   height: 248,
            //   child: CarPickup(_tripDistance),
            // ),
            Positioned(
              top: size.height * 50 / 100,
              right: 0,
              child: CircleButton(
                icon: FontAwesomeIcons.search,
                iconSize: 30.0,
                backgroundColor: Colors.white,
                iconColor: Colors.black,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      // drawer: Drawer(
      //   child: HomeMenu(),
      // ),
    );
  }
}
