import 'package:dio/dio.dart';

import '../../presentation/login/models/response_login.dart';

class ApiClient {
  final Dio _dio = Dio();

   String baseUrl= "http://innovainternational.co.in/portal/api/";



  Future<Response> login(String userName, String password) async {
    try {
      Response response = await _dio.post(
        baseUrl+"users/login/",
        data: {
          'userName': userName,
          'password': password
        },
      );
      return response;
    } on DioError catch (e) {
      //returns the error object if any
      return e.response!;
    }
  }
}


