import 'package:mvp_core/mvp_core.dart';
import 'package:project_hair_time_mobile/screens/profile/viewmodel/profile_viewmodel.dart';

abstract class IProfileView extends IView {
  void refreshProfile(ProfileViewModel viewModel);
}
