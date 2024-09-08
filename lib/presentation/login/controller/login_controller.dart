import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/httpwrapper/api_client.dart';
import '../../../network/service/data_response.dart';
import '../../../routes/app_routes.dart';
import '../models/response_login.dart';
import '../repo/login_repository.dart';

class LoginController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  UserRepository userRepo = UserRepository();


  Future<void> loginUsers(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      //show snackbar to indicate loading

      //get response from ApiClient

      DataResponse dataResponse = await userRepo.login(
          userNameController.text, passwordController.text);
      if (dataResponse.isSuccess == true) {
        // print(dataResponse);
        Map<String, dynamic> data = jsonDecode(dataResponse.data.toString());
        ResponseLogin response = ResponseLogin.fromJson(data);

        //if there is no error, get the user's accesstoken and pass it to HomeScreen
        if (response.meta!.code == 1) {
          Get.toNamed(AppRoutes.homePage);
        } else {
          //if an error occurs, show snackbar with error message
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Error: ${response.meta!.message}'),
            backgroundColor: Colors.red.shade300,
          ));
        }
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
