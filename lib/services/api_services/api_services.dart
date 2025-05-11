import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_assignment/services/api_services/network_response.dart';
import 'package:flutter_assignment/services/api_services/network_value.dart';

class ApiServices {
  static Future<NetworkResponse> getRequest(String endPoint) async {
    try {
      var response = await Dio().get(
        NetworkValues.kBaseURL + endPoint,
      );
      print("response ${response.statusCode}");
      return NetworkResponse(
          data: (response.data), status: true, message: "Successful");
    } on SocketException {
      return NetworkResponse(
          status: false, message: "No Internet connection 😑");
    } on DioException {
      return NetworkResponse(status: false, message: "Something went Wrong");
    }
  }
}
