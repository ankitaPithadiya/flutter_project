import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../add_service_repository/service_repository.dart';
import '../models/add_service_model.dart';
import '../models/client_location_model.dart';
import '../models/client_model.dart';
import '../models/company_model.dart';
import '../models/equipment_model.dart';
import '../models/service_type_model.dart';

/// A controller class for the SignUpTwoScreen.
///
/// This class manages the state of the SignUpTwoScreen, including the
/// current signUpTwoModelObj
class AddServiceController extends GetxController {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController userComplainController = TextEditingController();


  Rx<AddServiceModel> signUpTwoModelObj = AddServiceModel().obs;


  AddServiceRepository addServiceRepo=AddServiceRepository();

  RxList<CompanyModel>? companyList = <CompanyModel>[].obs;
  RxList<ServiceTypeModel>? serviceTypeList = <ServiceTypeModel>[].obs;
  RxList<ClientModel>? clientList = <ClientModel>[].obs;
  RxList<EquipmentType>? equipmentList = <EquipmentType>[].obs;
  RxList<ClientLocationModel>? clientLocationList = <ClientLocationModel>[].obs;


  @override
  onInit() {
    getCompanyList();
    getServiceList();
    getClientList();
    getEquipmentList();
    getClientLocationList();
  }

  void getCompanyList() async {
    companyList!.value = await addServiceRepo.getCompanyList();
  }

  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "true",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "false",
    ),
  ]);

  void getServiceList() async{
    serviceTypeList!.value = await addServiceRepo.getServiceList();
  }

  void getClientList() async{
    clientList!.value = await addServiceRepo.getClientList();
  }

  void getEquipmentList() async{
    equipmentList!.value = await addServiceRepo.getEquipmentList();
  }

  void getClientLocationList() async{
    clientLocationList!.value = await addServiceRepo.getClientLocation();
  }




  @override
  void onClose() {
    super.onClose();
    firstNameController.dispose();
    userComplainController.dispose();
  }
}
