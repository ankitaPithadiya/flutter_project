import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../AppConfig/StringConstant.dart';
import '../../../AppUtils/ui_utils.dart';
import '../../../core/app_export.dart';
import '../../../network/service/data_response.dart';
import '../../../routes/app_routes.dart';
import '../../add_service/models/request_update_service.dart';
import '../../add_service/models/response_service_update.dart';
import '../models/request_feedback.dart';
import '../models/response_image.dart';
import '../repository/solved_repo.dart';
import 'package:signature/signature.dart';
import 'package:dio/dio.dart' as dio;

class SolvedController extends GetxController {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  Rx<int>? serviceId = 0.obs;
  Rx<int>? serviceVisitedId = 0.obs;
  Rx<String>? username = "".obs;
  Rx<String>? mobileNo = "".obs;
  Rx<String>? emailId = "".obs;
  Rx<String>? remark = "".obs;
  Rx<String>? designation = "".obs;
  SolvedRepository solvedRepo = SolvedRepository();

  @override
  onInit() {
    getArguments();
    controller.addListener(() => log('Value changed'));
  }

  SignatureController controller = SignatureController(
    penStrokeWidth: 1,
    penColor: Colors.white,
    exportBackgroundColor: Colors.transparent,
    exportPenColor: Colors.black,
    onDrawStart: () => log('onDrawStart called!'),
    onDrawEnd: () => log('onDrawEnd called!'),
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> exportImage(BuildContext context) async {}

  void getArguments() async {
    if (Get.arguments != null) {
      serviceId!.value = Get.arguments['serviceId'];
      serviceVisitedId!.value = Get.arguments['serviceVisitId'];
      username!.value = Get.arguments['userName'];
      mobileNo!.value = Get.arguments['mobile'];
      emailId!.value = Get.arguments['email'];
      remark!.value = Get.arguments['remark'];
      designation!.value = Get.arguments['designation'];
    }
  }

  void addFeedback(BuildContext context) async {
    String userId = await PrefUtils.getString(StringConstant.userId);
    if (controller.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          key: Key('snackbarPNG'),
          content: Text('No content'),
        ),
      );
      return;
    }

    final Uint8List? data =
    await controller.toPngBytes(height: 1000, width: 1000);
    File file = await File('/storage/emulated/0/Download/screenshort.jpeg')
        .writeAsBytes(data!);
    print("${file.path}");

    if (file != null) {
      final formData = dio.FormData.fromMap({
        'file': await dio.MultipartFile.fromFile(file.path,
            filename: 'screenshort.png'),
      });
      DataResponse dataResponse = await solvedRepo.uploadImage(formData);
      if (dataResponse.isSuccess == true) {
        ResponseImage responseImage = ResponseImage.fromJson(dataResponse.data);

        if (responseImage.meta!.code == 1) {
          RequestFeedback requestFeedback = RequestFeedback(
            serviceVisitID: serviceVisitedId!.value,
            serviceID: serviceId!.value,
            remark: remark!.value,
            name: username!.value,
            email: emailId!.value,
            mo: mobileNo!.value,
            designation: designation!.value,
            signImage: responseImage.signImage,
            createdBy: int.parse(userId),
          );

          DataResponse response = await solvedRepo.addFeedback(requestFeedback);
          if (response.isSuccess == true) {
            ResponseServiceStatusUpdate responseServiceUpdate =
            ResponseServiceStatusUpdate.fromJson(response.data);
            {
              if (responseServiceUpdate.meta!.code == 1) {
                Get.offNamed(AppRoutes.homePage);
              } else {
                Get.back();
                UIUtils.showSnakBar(
                    bodyText: responseServiceUpdate.meta!.message!,
                    headerText: "Error Message");
              }
            }
          }
        }
      }
    }
  }
}
