import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:teresa/constants/api_constants/api_constant.dart';
import 'package:teresa/constants/strings/app_strings.dart';


class RemoteServices {
  static const int TIME_OUT_DURATION = 20;
  static var client=http.Client();
  static Future<dynamic> postMethod(
      String url, dynamic map) async {
    var body = jsonEncode(map);
    try {
      var response = await http
          .post(Uri.parse(ApiConstants.BASE_URL + url),
          headers: <String, String>{
            'Authorization': '${ApiConstants.TOKEN_TYPE} ${ApiConstants.TOKEN}',
            'Content-Type': 'application/json; charset=UTF-8',
            "Accept": "application/json"
          },
          body: body)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      print('get response = ${response.body}');

      return _processResponse(response);
    } on SocketException {
      throw Exception(AppStrings.noInternetConnection);
    } on TimeoutException {
      throw Get.defaultDialog(
        title: "TimeOutException",
        middleText: AppStrings.requestTimedOut,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  static Future<dynamic> postMethodWithParameter(
      String url, dynamic map,id) async {
    var body = jsonEncode(map);
    try {
      var response = await http
          .post(Uri.parse("${ApiConstants.BASE_URL + url}/$id"),
          headers: <String, String>{
            'Authorization': '${ApiConstants.TOKEN_TYPE} ${ApiConstants.TOKEN}',
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      print('get response = ${response.body}');

      return _processResponse(response);
    } on SocketException {
      throw Exception(AppStrings.noInternetConnection);
    } on TimeoutException {
      throw Get.defaultDialog(
        title: "TimeOutException",
        middleText: AppStrings.requestTimedOut,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  static Future<dynamic> getByIdMethod(String url,id) async{
    try{
      var response = await client
          .get(Uri.parse("${ApiConstants.BASE_URL + url}/$id"))
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    }on SocketException {
      throw Exception(AppStrings.noInternetConnection);
    } on TimeoutException {
      throw
      Get.defaultDialog(
        title: "TimeOutException",
        middleText: AppStrings.requestTimedOut,
      );
    }
    catch(e){
      throw Exception(e.toString());
    }
  }



  static Future<dynamic> getMethodWithParams(String url,queryParameters) async{
    try{
      var response = await client
          .get(Uri.parse(ApiConstants.BASE_URL + url).replace(queryParameters: queryParameters),headers: {
        'Authorization': '${ApiConstants.TOKEN_TYPE} ${ApiConstants.TOKEN}',
      })
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      // print('get response = ${response.body}');

      return _processResponse(response);
    }on SocketException {
      throw Exception(AppStrings.noInternetConnection);
    } on TimeoutException {
      throw
      Get.defaultDialog(
        title: "TimeOutException",
        middleText: AppStrings.requestTimedOut,
      );
    }
    catch(e){
      throw Exception(e.toString());
    }
  }


  static Future<dynamic> getMethod(String url) async{
    try{
      var response = await client
          .get(Uri.parse(ApiConstants.BASE_URL + url))
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    }on SocketException {
      throw Exception(AppStrings.noInternetConnection);
    } on TimeoutException {
      throw
      Get.defaultDialog(
        title: "TimeOutException",
        middleText: AppStrings.requestTimedOut,
      );
    }
    catch(e){
      throw Exception(e.toString());
    }
  }
}

dynamic _processResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      return jsonDecode(response.body);
    case 201:
      return jsonDecode(response.body);
    case 400:
      return jsonDecode(response.body);
    case 401:
      return jsonDecode(response.body);
    case 422:
      return jsonDecode(response.body);
    case 500:
      return jsonDecode(response.body);
    default:
      throw Exception("not successful");
  }
}
