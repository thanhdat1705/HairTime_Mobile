import 'package:dio/dio.dart';
import 'package:project_hair_time_mobile/shared/models/account/account.dart';
import 'package:project_hair_time_mobile/shared/models/response/respone_search_feild/respone_search_field.dart';
import 'package:project_hair_time_mobile/shared/models/response/response_search_province/response_search_province.dart';
import 'package:project_hair_time_mobile/shared/models/response_server/response_server.dart';
import 'package:project_hair_time_mobile/shared/requests/auth_request/auth_request.dart';
import 'package:project_hair_time_mobile/shared/requests/search_request/search_request.dart';
import 'package:project_hair_time_mobile/shared/requests/update_profile_request/update_profile_request.dart';
import 'package:project_hair_time_mobile/shared/services/http_service.dart';
import 'package:project_hair_time_mobile/shared/shared_server_api_urls/server_api__urls.dart';

Map<String, String> header = {
  'Accept': '*/*',
  //'Content-Type': 'application/json;',
  'Accept-Encoding': 'gzip, deflate, br'
};

void addHeader(String key, String value) {
  header[key] = value;
}

Future<ResponseServer> authUser(AuthRequest request) async {
  // var body = jsonEncode(request.toJson());
  // print(body);
  return HttpService.post(APIUSERAUTHORIZE, Account.instance(),
      headers: header, data: request);
}

Future<ResponseServer> getProfileUser() async {
  // var body = jsonEncode(request.toJson());
  // print(body);
  return HttpService.get(APIGETUSERPROFILE, Account.instance(),
      headers: header);
}

Future<ResponseServer> updateProfileUser(
    UpdateProfileRequest updateProfileRequest) async {
  //Map<String,dynamic> dataFormData = encode(updateProfileRequest);
  FormData formData = //new FormData.fromMap(dataFormData);
      new FormData.fromMap({
    'displayName': updateProfileRequest.displayName,
    'description': updateProfileRequest.description,
    'phoneNumber': updateProfileRequest.phoneNumber,
    'email': updateProfileRequest.email,
    'avatarFile':
        await MultipartFile.fromFile(updateProfileRequest.avatarFile.path),
  });
  return HttpService.put(APIUPDATEUSERPROFILE, Account.instance(),
      data: formData, typeRequest: HttpService.FORMDATA, headers: header);
}

Future<ResponseServer> searchField(SearchRequest request) async {
  // var body = jsonEncode(request.toJson());
  // print(body);
  // addHeader(
  //     'Authorization',
  //     'Bearer ' +
  //         'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBY2NvdW50SWQiOiJWZHgySlZBU1pPVW9haXhGRGt1elo2QTJmaXkxIiwiRGlzcGxheU5hbWUiOiJNaW5oIFbDtSIsIkVtYWlsIjoiZGV2ZWxvcGVyLm1pbmh2by40MjhAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwibmJmIjoxNjAxOTE2ODc3LCJleHAiOjE2MDI1MjE2NzcsImlhdCI6MTYwMTkxNjg3N30.My3OwCmbFCae9ask3ShBANKvRh_Ud9FJjSS47Z_j1mA');
  return HttpService.post(APISEARCHFIELD, ResponseSearchField.instance(),
      headers: header, data: request);
}

Future<ResponseServer> searchProvince(SearchRequest request) async {
  return HttpService.post(APISEARCHPROVINCE, ResponseSearchProvince.instance(),
      headers: header, data: request);
}
