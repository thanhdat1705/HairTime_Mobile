import 'package:mvp_core/mvp_core.dart';
import 'package:project_hair_time_mobile/screens/home/viewmodel/home_viewmodel.dart';

abstract class IHomeView extends IView {
  void refreshHome(HomeViewModel viewModel);
}
