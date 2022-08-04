import 'package:flutter/cupertino.dart';
import 'package:project_hair_time_mobile/screens/home/home_screen.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/requests/search_request/search_request.dart';
import 'package:project_hair_time_mobile/shared/services/summary_service.dart';

initHomeScreen(BuildContext context) {
  SearchRequest request = new SearchRequest(0, 0, "name", 0, "");
  searchField(request).then((res) {
    print(res.data.data[1].id);
    GeneralHelper.navigateToScreen(
        context, new HomeScreen(listField: res.data.data), true);
  }, onError: (error) {
    print(error);
  });
}
