import 'package:flutter/material.dart';
import 'package:mvp_core/mvp_core.dart';
import 'package:project_hair_time_mobile/screens/store_detail/components/detail_body.dart';
import 'package:project_hair_time_mobile/screens/store_detail/presenter/store_detail_screen_persenter.dart';
import 'package:project_hair_time_mobile/screens/store_detail/view/store_detail_screen_view.dart';
import 'package:project_hair_time_mobile/screens/store_detail/viewmodel/store_detail_screen_viewmodel.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/shared/storages/memory_storage.dart';

List<dynamic> bookingServices = [
  {
    'id': '1',
    'barberName': '',
    'timeInfo': '',
  },
  {
    'id': '2',
    'barberName': '',
    'timeInfo': '',
  },
  {
    'id': '3',
    'barberName': '',
    'timeInfo': '',
  },
];

List<int> slot = [9, 6, 8, 5, 5, 6, 7, 5, 7, 8, 7, 7, 5];
int slotIndex = 0;

class DetailScreen extends StatefulWidget {
  final String storeName;
  final String address;
  final String phone;
  final String description;
  final double ratingNum;
  final String guestCheckout;
  final String imageUrl;
  final bool isLike;
  int servicePage;

  DetailScreen({
    Key key,
    this.storeName,
    this.address,
    this.phone,
    this.description,
    this.ratingNum,
    this.guestCheckout,
    this.isLike,
    this.imageUrl,
    this.servicePage,
  }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState
    extends StateView<DetailScreen, IStoreDetailScreenPresenter>
    implements IStoreDetailScreenView {
  @override
  void initState() {
    super.initState();
    MemoryStorage.set('1', true);
    this.presenter.storeDetailScreenView = this;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: new DetailBody(
        address: this.widget.address,
        description: this.widget.description,
        guestCheckout: this.widget.guestCheckout,
        isLike: this.widget.isLike,
        phone: this.widget.phone,
        ratingNum: this.widget.ratingNum,
        storeName: this.widget.storeName,
        imageUrl: this.widget.imageUrl,
        presenter: this.presenter,
        servicePage: this.widget.servicePage,
      ),
    );
  }

  @override
  IStoreDetailScreenPresenter createPresenter() {
    return new StoreDetailScreenPresenter();
  }

  @override
  void refreshStoreService(StoreDetailScreenViewModel viewModel) {
    setState(() {
      this.presenter.storeDetailScreenViewModel = viewModel;
    });
  }
}
