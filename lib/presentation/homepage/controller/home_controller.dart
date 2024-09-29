import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../AppConfig/StringConstant.dart';
import '../../../AppUtils/ui_utils.dart';
import '../../../core/utils/pref_utils.dart';
import '../../../network/service/data_response.dart';
import '../../../routes/app_routes.dart';
import '../../add_service/models/request_update_service.dart';
import '../../add_service/models/response_service_update.dart';
import '../models/request_service_list.dart';
import '../models/response_service_list_model.dart';
import '../repository/service_list_repository.dart';

class HomeController extends GetxController {
  bool _customTileExpanded = false;

  Rx<String>? toDate =
      DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()).obs;

  ServiceListRepository serviceRepo = ServiceListRepository();
  ResponseServiceList? responseServiceList;
  Rx<String>? noItemsFound = "".obs;

  RxList<ServiceReport>? serviceReportList = <ServiceReport>[].obs;

  void logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout", style: TextStyle(fontSize: 15)),
          content: const Text("Are you sure want to logout?",
              style: TextStyle(fontSize: 15, color: Colors.black)),
          actions: <Widget>[
            TextButton(
              // Use TextButton instead of FlatButton
              child: const Text("No",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              // Use TextButton instead of FlatButton
              child: const Text("Yes",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              onPressed: () {
                PrefUtils.clear();
                Get.offAllNamed(AppRoutes.initialRoute);
                // Open app settings
              },
            ),
          ],
        );
      },
    );
  }

  void updateStatus(BuildContext context, int serviceId, int serviceVisitId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Change Status", style: TextStyle(fontSize: 15)),
          content: const Text("Are you sure want to Change Status?",
              style: TextStyle(fontSize: 15, color: Colors.black)),
          actions: <Widget>[
            TextButton(
              // Use TextButton instead of FlatButton
              child: const Text("No",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              // Use TextButton instead of FlatButton
              child: const Text("Yes",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              onPressed: () {
                changeStatusApi(serviceId, serviceVisitId);
                // Open app settings
              },
            ),
          ],
        );
      },
    );
  }

  List<Widget> tile1List = List<Widget>.generate(
    3,
    (index) => Card(
      elevation: 2,
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(15),
          child: Column(
            children: List<Widget>.generate(
              3,
              (index) {
                return Text("Expense details");
              },
            ),
          )),
    ),
  );

  @override
  onInit() {
    getServiceList();
  }

  Future<Null> selectDate(BuildContext context) async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2012),
      lastDate: DateTime(2025),
    ).then((selectedDate) {
      if (selectedDate != null) {
        toDate!.value = DateFormat('yyyy-MM-dd HH:mm:ss').format(selectedDate);
        getServiceList();
      }
    });
  }

  void getServiceList() async {
    String userId = await PrefUtils.getString(StringConstant.userId);
    serviceReportList!.value.clear();
    RequestServiceList request = RequestServiceList(
        fromDate: toDate!.value,
        toDate: toDate!.value,
        companyId: 0,
        engineerId: int.parse(userId));
    responseServiceList = await serviceRepo.getServiceTypeList(request);
    if (responseServiceList!.meta!.code == 1) {
      serviceReportList!.value = responseServiceList!.serviceReport!;
      serviceReportList!.refresh();
    } else {
      serviceReportList!.value.clear();
      serviceReportList!.refresh();
      noItemsFound!.value = responseServiceList!.meta!.message!;
      UIUtils.showSnakBar(
          bodyText: responseServiceList!.meta!.message!,
          headerText: "Error Message");
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeStatusApi(int serviceId, int serviceVisitId) async {
    String userId = await PrefUtils.getString(StringConstant.userId);

    RequestUpdateServiceStatus requestServiceStatus =
        RequestUpdateServiceStatus(
      id: serviceVisitId,
      serviceStatusID: 7,
      updatedBy: userId,
    );
    DataResponse response =
        await serviceRepo.updateServiceVisitStatus(requestServiceStatus);
    if (response.isSuccess == true) {
      ResponseServiceStatusUpdate responseServiceUpdate =
          ResponseServiceStatusUpdate.fromJson(response.data);
      {
        if (responseServiceUpdate.meta!.code == 1) {
          RequestUpdateServiceStatus requestServiceStatus =
              RequestUpdateServiceStatus(
            id: serviceId,
            serviceStatusID: 7,
            updatedBy: userId,
          );
          DataResponse response =
              await serviceRepo.serviceStatusUpdate(requestServiceStatus);
          if (response.isSuccess == true) {
            ResponseServiceStatusUpdate responseServiceUpdate =
                ResponseServiceStatusUpdate.fromJson(response.data);
            {
              if (responseServiceUpdate.meta!.code == 1) {
                getServiceList();
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
