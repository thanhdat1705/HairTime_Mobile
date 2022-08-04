import 'package:mvp_core/mvp_core.dart';
import 'package:project_hair_time_mobile/screens/login/viewmodel/login_viewmodel.dart';

abstract class ILoginView extends IView {
  void refreshLoginViewModel(LoginViewModel viewModel);
}
