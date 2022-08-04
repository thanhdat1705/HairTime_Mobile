import 'package:flutter/cupertino.dart';
import 'package:project_hair_time_mobile/screens/profile/services/profile_service.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/models/response_server/response_server.dart';
import 'package:project_hair_time_mobile/shared/requests/auth_request/auth_request.dart';
import 'package:project_hair_time_mobile/shared/services/auth_social_firebase.dart';
import 'package:project_hair_time_mobile/shared/services/push_notification_manager.dart';
import 'package:project_hair_time_mobile/shared/services/summary_service.dart';
import 'package:project_hair_time_mobile/shared/storages/memory_storage.dart';

Future<bool> onLoginToServer(int provider, BuildContext context) async {
  //Account account = null;
  var user;
  ResponseServer responseServer;
  if (provider == 0) {
    user = await signInWithFacebook();

    // signInWithFacebook().then((value) {
    //   authUser(new AuthRequest(accessToken: value, provider: provider)).then(
    //       (response) {
    //     //account = response.data;
    //     print('token Login Facebook: ' + response.data.token);
    //     addHeader('Authorization', 'Bearer ' + response.data.token);
    //     GeneralHelper.saveToSharedPreferences("token", response.data.token);
    //     initProfileScreen(context);
    //   }, onError: (error) {
    //     print(error);
    //   });
    // });
  } else {
    user = await signInWithGoogle();
    // signInWithGoogle().then((value) {
    //   authUser(new AuthRequest(accessToken: value, provider: provider))
    //       .then((response) {
    //     //account = response.data;
    //     print('token Login Google: ' + response.data.token);
    //     addHeader('Authorization', 'Bearer ' + response.data.token);
    //     GeneralHelper.saveToSharedPreferences("token", response.data.token);
    //     initProfileScreen(context);
    //   });
    // });
  }
  //responseServer = await authUser( new AuthRequest(accessToken: accessTokenSocial, provider: provider));
  //print('token Login Social: ' + responseServer.data.token);
  //addHeader('Authorization', 'Bearer ' + responseServer.data.token);
  //GeneralHelper.saveToSharedPreferences("token", responseServer.data.token);
  if (user != null) {
    MemoryStorage.set("User", user);
    //String firebaseMessageToken = GeneralHelper.getValueSharedPreferences("firebaseMessageToken");
    await PushNotificationsManager.show(
        title: "Welcome " + user.displayName,
        body: "Hello from Hair Time's team",
        payload: 'item x');
    //MemoryStorage.get("User");
    print(user);
  }

  return true;
  //login to server
}
