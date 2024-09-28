

import 'package:flutter/material.dart';

import '../../../AppConfig/StringConstant.dart';
import '../../../core/app_export.dart';
import '../../../routes/app_routes.dart';


class FeedbackController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  TextEditingController designationController = TextEditingController();

  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  Rx<int>? serviceId = 0.obs;
  Rx<int>? serviceVisitedId = 0.obs;

  @override
  onInit() {
    getArguments();
  }

  void getArguments() async {
    if (Get.arguments != null) {
      serviceId!.value = Get.arguments['serviceId'];
      serviceVisitedId!.value = Get.arguments['serviceVisitId'];
    }
  }
  @override
  dispose(){
    userNameController.clear();
    mobileController.clear();
    emailController.clear();
    remarkController.clear();
    designationController.clear();

  }

  void submitData() async {
    if (formKey.currentState!.validate()) {
      Get.toNamed(AppRoutes.solved, arguments: {
        'serviceId': serviceId!.value,
        'serviceVisitId': serviceVisitedId!.value,
        'userName': userNameController.text.trim().toString(),
        'mobile': mobileController.text.trim().toString(),
        'email': emailController.text.trim().toString(),
        'remark': remarkController.text.trim().toString(),
        'designation': designationController.text.trim().toString()
      });
    }
  }
}
