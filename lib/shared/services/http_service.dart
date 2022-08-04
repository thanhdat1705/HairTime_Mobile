import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:project_hair_time_mobile/shared/models/response_server/response_server.dart';
//import 'package:mapper/mapper.dart';
import 'package:http/http.dart' as http;

//Use this class to call API Server
class HttpService {
  static const String FORMBODY = "FormBody";
  static const String FORMDATA = "FormData";
  static Dio dio = new Dio();
  
  static Future<ResponseServer> get(url, responseDataInstance,
      {Map<String, String> headers}) async {
    //headers.remove("content-type");
    Response res = await dio.get(url, options: new Options(headers: headers));
    if (res.statusCode == 200) {
      ResponseServer responseServer = //decode<ResponseServer>(res.data);
          new ResponseServer(
              data: res.data["data"],
              message: res.data["message"],
              statusCode: res.data["statusCode"]);
      responseServer.data = responseDataInstance.fromJson(responseServer.data);
      return responseServer;
    } else {
      throw Exception('Failed to load call api');
    }
  }

  static Future<ResponseServer> post(url, responseDataInstance,
      {Map<String, String> headers,
      data,
      typeRequest,
      Encoding encoding}) async {
    Response res;
    if (typeRequest == FORMBODY || typeRequest == null) {
      headers['content-type'] = 'application/json';
      res = await dio.post(url,
          data: jsonEncode(data.toJson()),
          options: new Options(headers: headers));
    } else {
      headers['content-type'] = 'multipart/form-data';
      //Map<String,dynamic> dataFormData = encode(data);
      //FormData formData = new FormData.fromMap(dataFormData);
      res = await dio.post(url,
          data: data, options: new Options(headers: headers));
    }
    if (res.statusCode == 200 || res.statusCode == 201) {
      ResponseServer responseServer = //decode<ResponseServer>(res.data);
          new ResponseServer(
              data: res.data["data"],
              message: res.data["message"],
              statusCode: res.data["statusCode"]);
      if (responseServer.data != null) {
        responseServer.data =
            responseDataInstance.fromJson(responseServer.data);
        return responseServer;
      }
      // responseServer.data = responseDataInstance.fromJson(["data"]);
      // return responseServer;
    } else {
      throw Exception('Failed to load call api');
    }
  }

  static Future<ResponseServer> put(url, responseDataInstance,
      {Map<String, String> headers,
      data,
      typeRequest,
      Encoding encoding}) async {
    //headers.remove("content-type");
    Response res;
    if (typeRequest == FORMBODY || typeRequest == null) {
      headers['content-type'] = 'application/json';
      //response = await http.put(url, headers: headers, body: jsonEncode(data.toJson()), encoding: encoding);
      res = await dio.put(url,
          data: jsonEncode(data.toJson()),
          options: new Options(headers: headers));
    } else {
      headers['content-type'] = 'multipart/form-data';
      res = await dio.put(url,
          data: data, options: new Options(headers: headers));
    }
    if (res.statusCode == 200 || res.statusCode == 201) {
      ResponseServer responseServer = //decode<ResponseServer>(res.data);
          new ResponseServer(
              data: res.data["data"],
              message: res.data["message"],
              statusCode: res.data["statusCode"]);
      //ResponseServer.fromJson(json.decode(res.));
      responseServer.data = responseDataInstance.fromJson(responseServer.data);
      return responseServer;
    } else {
      throw Exception('Failed to load call api');
    }
  }

  static Future<ResponseServer> delete(url,
      {Map<String, String> headers}) async {
    final response = await http.post(url, headers: headers);
    if (response.statusCode == 200) {
      //headers.remove("content-type");
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ResponseServer.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load call api');
    }
  }
}
