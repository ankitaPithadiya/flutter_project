import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/request_service_list.dart';
import '../models/response_service_list_model.dart';
import '../repository/service_list_repository.dart';

class HomeController extends GetxController {
  bool _customTileExpanded = false;

  ServiceListRepository serviceRepo=ServiceListRepository();

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



  void getServiceList() async{
    RequestServiceList request=RequestServiceList(
        fromDate:"2023-09-13T20:53:59.671Z",
        toDate:"2025-09-13T20:53:59.671Z",
        companyId: 0,
        engineerId: 1
    );
    serviceReportList!.value = await serviceRepo.getServiceTypeList(request);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
