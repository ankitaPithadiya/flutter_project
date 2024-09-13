import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../../../network/service/data_response.dart';
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



  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AddServiceRepository addServiceRepo=AddServiceRepository();

  RxList<CompanyModel>? companyList = <CompanyModel>[].obs;
  RxList<ServiceTypeModel>? serviceTypeList = <ServiceTypeModel>[].obs;
  RxList<ClientModel>? clientList = <ClientModel>[].obs;
  RxList<EquipmentType>? equipmentList = <EquipmentType>[].obs;
  RxList<ClientLocationModel>? clientLocationList = <ClientLocationModel>[].obs;

  Rx<CompanyModel> companyModel=CompanyModel().obs;
  Rx<ServiceTypeModel> serviceTypeModel=ServiceTypeModel().obs;
  Rx<ClientModel> clientModel=ClientModel().obs;
  Rx<EquipmentType> equipmentModel=EquipmentType().obs;
  Rx<ClientLocationModel> clientLocationModel=ClientLocationModel().obs;
  Rx<SelectionPopupModel> selectPopupModel=SelectionPopupModel(title: '').obs;


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

  void addService(BuildContext context) async{
    if (formKey.currentState!.validate()) {
      RequestAddService requestService=RequestAddService(
          clientID:clientModel.value.id!,
          clientLocationID:clientLocationModel.value.id!,
          serviceTypeID:serviceTypeModel.value.id!,
          userComplaint:userComplainController.text,
          systemDown:selectPopupModel.value.title=="true"?true:false,
          equipmentTypeID:equipmentModel.value.id!,
          companyId:companyModel.value.id!,
          userName:firstNameController.text,
          createdBy:0
      );

      DataResponse response=await addServiceRepo.addService(requestService);
      if (response.isSuccess == true) {
        Get.back();
      }
    }
  }




  @override
  void onClose() {
    super.onClose();
    firstNameController.dispose();
    userComplainController.dispose();
  }
}
