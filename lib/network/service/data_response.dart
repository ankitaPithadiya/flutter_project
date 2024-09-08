
import 'package:dio/dio.dart';

import 'http_wrapper.dart';

enum Status { isSuccess, isWarring }

class DataResponse {
  dynamic data;
  bool? isSuccess;
  String? message;

  DataResponse({this.data, this.isSuccess, this.message});

  DataResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    isSuccess = json['successStatus'];
    if (json['msg'] != null) {
      message = json['msg'];
    }
  }

  DataResponse.mapResponse(Response? response, ApiType apiType) {
    data = response!.data;
    isSuccess = response.statusCode == 200 || response.statusCode == 304 ? true : false;
      message = isSuccess == false
          ? response.data.toString()
          : response.requestOptions.method == "POST"
              ? response.data.toString()
              : response.statusMessage;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data;
    }
    data['successStatus'] = isSuccess;
    data['msg'] = message;
    return data;
  }
}
