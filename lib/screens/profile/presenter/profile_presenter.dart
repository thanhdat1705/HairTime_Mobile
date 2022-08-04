import 'package:mvp_core/mvp_core.dart';
import 'package:project_hair_time_mobile/screens/profile/view/profile_view.dart';
import 'package:project_hair_time_mobile/screens/profile/viewmodel/profile_viewmodel.dart';

/// The interface the view will use to communicate with the presenter.
abstract class IProfilePresenter extends IPresenter {
  set profileView(IProfileView value);
}

class ProfilePresenter extends Presenter<IProfileView>
    implements IProfilePresenter {
  ProfileViewModel _profileViewModel;
  IProfileView _profileView;

  ProfilePresenter() {
    //this._counterViewModel = new ProfileViewModel(0);
  }

  @override
  void set profileView(IProfileView value) {
    // TODO: implement counterView
  }
}
