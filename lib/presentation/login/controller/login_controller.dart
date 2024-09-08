import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/httpwrapper/api_client.dart';
import '../../../routes/app_routes.dart';
import '../models/response_login.dart';

class LoginController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  ApiClient apiClient = ApiClient();

  Future<void> loginUsers(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      //show snackbar to indicate loading

      //get response from ApiClient
      dynamic res = await apiClient.login(
        userNameController.text,
        passwordController.text,
      );
      Map<String, dynamic> data = jsonDecode(res.toString());
      ResponseLogin response = ResponseLogin.fromJson(data);

      //if there is no error, get the user's accesstoken and pass it to HomeScreen
      if (response.meta!.code == 1) {
        Get.toNamed(AppRoutes.homePage);
      } else {
        //if an error occurs, show snackbar with error message
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error: ${res.meta!.message}'),
          backgroundColor: Colors.red.shade300,
        ));
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
    userNameController.dispose();
    passwordController.dispose();
  }
}
