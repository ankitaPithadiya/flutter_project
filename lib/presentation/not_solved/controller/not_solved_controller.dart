import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../AppConfig/StringConstant.dart';
import '../../../AppUtils/ui_utils.dart';
import '../../../core/app_export.dart';
import '../../../network/service/data_response.dart';
import '../../add_service/models/request_update_service.dart';
import '../../add_service/models/response_service_update.dart';
import '../models/request_service_visit_update.dart';
import '../repository/not_solved_repo.dart';

class NotSolvedController extends GetxController {
  TextEditingController makeController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController srNoController = TextEditingController();
  TextEditingController problemController = TextEditingController();
  TextEditingController serviceRenderdController = TextEditingController();

  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  Rx<int>? serviceId = 0.obs;
  Rx<int>? serviceVisitedId = 0.obs;
  NotSolvedRepository notSolvedRepo = NotSolvedRepository();

  @override
  onInit() {
    getArguments();
  }

  void getArguments() {
    if (Get.arguments != null) {
      serviceId!.value = Get.arguments['serviceId'];
      serviceVisitedId!.value = Get.arguments['serviceVisitId'];
    }
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
          serviceStatusID: 3,
          visitScheduleDate:
              DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
          givePriority: true,
          make: makeController.text.trim(),
          model: modelController.text.trim(),
          srNo: srNoController.text.trim(),
          updatedBy: int.parse(userId));
      DataResponse response =
          await notSolvedRepo.updateServiceVisit(requestServiceVisit);
      if (response.isSuccess == true) {
        ResponseServiceStatusUpdate responseServiceUpdate =
            ResponseServiceStatusUpdate.fromJson(response.data);
        {
          if (responseServiceUpdate.meta!.code == 1) {
            RequestUpdateServiceStatus requestServiceStatus =
            RequestUpdateServiceStatus(
              id: serviceId!.value,
              serviceStatusID: 3,
              updatedBy: userId,
            );
            DataResponse response =
            await notSolvedRepo.serviceStatusUpdate(requestServiceStatus);
            if (response.isSuccess == true) {
              ResponseServiceStatusUpdate responseServiceUpdate =
              ResponseServiceStatusUpdate.fromJson(response.data);
              {
                if (responseServiceUpdate.meta!.code == 1) {
                  Get.back();

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
