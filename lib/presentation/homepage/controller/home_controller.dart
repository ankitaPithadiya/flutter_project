import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../AppConfig/StringConstant.dart';
import '../../../AppUtils/ui_utils.dart';
import '../../../core/utils/pref_utils.dart';
import '../models/request_service_list.dart';
import '../models/response_service_list_model.dart';
import '../repository/service_list_repository.dart';

class HomeController extends GetxController {
  bool _customTileExpanded = false;

  Rx<String>? toDate=DateFormat('dd/MM/yyyy').format(DateTime.now()).obs;

  ServiceListRepository serviceRepo=ServiceListRepository();
  ResponseServiceList? responseServiceList;
  Rx<String>? noItemsFound="".obs;

  RxList<ServiceReport>? serviceReportList = <ServiceReport>[].obs;


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
        toDate!.value =
            DateFormat('dd/MM/yyyy').format(selectedDate);
        getServiceList();
      }
    });
  }



  void getServiceList() async{
    String userId=await PrefUtils.getString(StringConstant.userId);
    serviceReportList!.value.clear();
    RequestServiceList request=RequestServiceList(
        fromDate:toDate!.value,
        toDate:toDate!.value,
        companyId: 0,
        engineerId: int.parse(userId)
    );
    responseServiceList= await serviceRepo.getServiceTypeList(request);
    if(responseServiceList!.meta!.code==1) {
      serviceReportList!.value = responseServiceList!.serviceReport!;
    }else{
      serviceReportList!.value.clear();
      noItemsFound!.value=responseServiceList!.meta!.message!;
      UIUtils.showSnakBar(bodyText: responseServiceList!.meta!.message!, headerText: "Error Message");
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
