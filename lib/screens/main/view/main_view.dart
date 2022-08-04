import 'package:mvp_core/mvp_core.dart';
import 'package:project_hair_time_mobile/screens/main/viewmodel/main_viewmodel.dart';

abstract class IMainView extends IView {
  void refreshHome(MainViewModel viewModel);
}
