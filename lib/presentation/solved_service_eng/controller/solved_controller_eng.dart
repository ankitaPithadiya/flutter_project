import 'dart:developer';
import 'dart:io';

import 'package:ananta/presentation/not_solved/models/request_service_visit_update.dart';
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

import '../repository/solved_repo_eng.dart';
import 'package:signature/signature.dart';
import 'package:dio/dio.dart' as dio;

class SolvedEngController extends GetxController {
  TextEditingController makeController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController srNoController = TextEditingController();
  TextEditingController problemController = TextEditingController();
  TextEditingController serviceRenderdController = TextEditingController();

  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  Rx<int>? serviceId = 0.obs;
  Rx<int>? serviceVisitedId = 0.obs;
  SolvedEngRepository solvedRepo = SolvedEngRepository();

  @override
  onInit() {

    getArguments();

  }








  void getArguments() async{
    if (Get.arguments != null) {
      serviceId!.value = Get.arguments['serviceId'];
      serviceVisitedId!.value = Get.arguments['serviceVisitId'];
    }
    await Permission.storage.request();
  }

  void updateStatusApi() async {
    String userId = await PrefUtils.getString(StringConstant.userId);
    if (formKey.currentState!.validate()) {
      RequestServiceVisit requestServiceVisit = RequestServiceVisit(
          id: serviceVisitedId!.value,
          serviceID: serviceId!.value,
          engineerID: int.parse(userId),
          problemReported: problemController.text.trim(),
          serviceRendered: serviceRenderdController.text.trim(),
          serviceStatusID: 6,
          visitScheduleDate:
              DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
          givePriority: true,
          make: makeController.text.trim(),
          model: modelController.text.trim(),
          srNo: srNoController.text.trim(),
          updatedBy: int.parse(userId));
      DataResponse response =
          await solvedRepo.updateServiceVisit(requestServiceVisit);
      if (response.isSuccess == true) {
        ResponseServiceStatusUpdate responseServiceUpdate =
            ResponseServiceStatusUpdate.fromJson(response.data);
        {
          if (responseServiceUpdate.meta!.code == 1) {
            RequestUpdateServiceStatus requestServiceStatus =
            RequestUpdateServiceStatus(
              id: serviceId!.value,
              serviceStatusID: 6,
              updatedBy: userId,
            );
            DataResponse response =
            await solvedRepo.serviceStatusUpdate(requestServiceStatus);
            if (response.isSuccess == true) {
              ResponseServiceStatusUpdate responseServiceUpdate =
              ResponseServiceStatusUpdate.fromJson(response.data);
              {
                if (responseServiceUpdate.meta!.code == 1) {
                  Get.toNamed(AppRoutes.solvedFeedback, arguments: {'serviceId': serviceId!.value!,'serviceVisitId':serviceVisitedId!.value});

                }else{
                  Get.back();
                  UIUtils.showSnakBar(
                      bodyText: responseServiceUpdate.meta!.message!,
                      headerText: "Error Message");
                }
              }
            }
          }else{
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
