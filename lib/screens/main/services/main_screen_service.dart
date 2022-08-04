import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/main/main_screen.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/requests/search_request/search_request.dart';
import 'package:project_hair_time_mobile/shared/services/summary_service.dart';

// Future<List<Province>> initMainScreen() async {
//   List<Province> _provinces;
//   SearchRequest request = new SearchRequest(0, 0, "", 0, "");
//   ResponseServer responseServer = await searchProvince(request);
//   _provinces = responseServer.data.data;
//   return _provinces;
// }

initMainScreen(BuildContext context) {
  GeneralHelper.showDialogLoading(context).show();
  searchProvince(new SearchRequest(0, 0, "", 0, "")).then(
    (res) {
      GeneralHelper.showDialogLoading(context).hide();
      GeneralHelper.navigateToScreen(
          context, new MainScreen(res.data.data), true);
    },
  );
}
