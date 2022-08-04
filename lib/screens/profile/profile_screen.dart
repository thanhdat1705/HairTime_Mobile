import 'package:flutter/material.dart';
import 'package:mvp_core/mvp_core.dart';
import 'package:project_hair_time_mobile/screens/profile/components/profile_body.dart';
import 'package:project_hair_time_mobile/screens/profile/presenter/profile_presenter.dart';
import 'package:project_hair_time_mobile/screens/profile/view/profile_view.dart';
import 'package:project_hair_time_mobile/screens/profile/viewmodel/profile_viewmodel.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

class ProfileScreen extends StatefulWidget {
  //final AccountProfile data;
  ProfileScreen({Key key}) : super(key: key);

  @override
  ProfileScreenState createState() => new ProfileScreenState();
}

class ProfileScreenState extends StateView<ProfileScreen, IProfilePresenter>
    implements IProfileView {
  ProfileViewModel profileViewModel;
  ProfilePresenter profilePresenter;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ProfileBody(),
    );
  }

  @override
  IProfilePresenter createPresenter() {
    return new ProfilePresenter();
  }

  @override
  void refreshProfile(ProfileViewModel viewModel) {
    this.profileViewModel = viewModel;
  }
}
