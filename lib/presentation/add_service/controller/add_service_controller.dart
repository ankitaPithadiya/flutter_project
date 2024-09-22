import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../AppConfig/StringConstant.dart';
import '../../../AppUtils/ui_utils.dart';
import '../../../core/app_export.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../../../network/service/data_response.dart';
import '../../../routes/app_routes.dart';
import '../add_service_repository/service_repository.dart';
import '../models/add_service_model.dart';
import '../models/add_service_visit.dart';
import '../models/client_location_model.dart';
import '../models/client_model.dart';
import '../models/company_model.dart';
import '../models/equipment_model.dart';
import '../models/request_update_service.dart';
import '../models/response_add_service_type.dart';
import '../models/response_service_update.dart';
import '../models/response_service_visit.dart';
import '../models/service_type_model.dart';

/// A controller class for the SignUpTwoScreen.
///
/// This class manages the state of the SignUpTwoScreen, including the
/// current signUpTwoModelObj
class AddServiceController extends GetxController {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController userComplainController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AddServiceRepository addServiceRepo = AddServiceRepository();

  RxList<CompanyModel>? companyList = <CompanyModel>[].obs;
  RxList<ServiceTypeModel>? serviceTypeList = <ServiceTypeModel>[].obs;
  RxList<ClientModel>? clientList = <ClientModel>[].obs;
  RxList<EquipmentType>? equipmentList = <EquipmentType>[].obs;
  RxList<ClientLocationModel>? clientLocationList = <ClientLocationModel>[].obs;

  Rx<CompanyModel> companyModel = CompanyModel().obs;
  Rx<ServiceTypeModel> serviceTypeModel = ServiceTypeModel().obs;
  Rx<ClientModel> clientModel = ClientModel().obs;
  Rx<EquipmentType> equipmentModel = EquipmentType().obs;
  Rx<ClientLocationModel> clientLocationModel = ClientLocationModel().obs;
  Rx<SelectionPopupModel> selectPopupModel = SelectionPopupModel(title: '').obs;

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

  void getServiceList() async {
    serviceTypeList!.value = await addServiceRepo.getServiceList();
  }

  void getClientList() async {
    clientList!.value = await addServiceRepo.getClientList();
  }

  void getEquipmentList() async {
    equipmentList!.value = await addServiceRepo.getEquipmentList();
  }

  void getClientLocationList() async {
    clientLocationList!.value = await addServiceRepo.getClientLocation();
  }

  void addService(BuildContext context) async {
    String userId = await PrefUtils.getString(StringConstant.userId);
    if (formKey.currentState!.validate()) {
      RequestAddService requestService = RequestAddService(
          clientID: clientModel.value.id!,
          clientLocationID: clientLocationModel.value.id!,
          serviceTypeID: serviceTypeModel.value.id!,
          userComplaint: userComplainController.text,
          systemDown: selectPopupModel.value.title == "true" ? true : false,
          equipmentTypeID: equipmentModel.value.id!,
          companyId: companyModel.value.id!,
          userName: firstNameController.text,
          createdBy: int.parse(userId));

      DataResponse response = await addServiceRepo.addService(requestService);
      if (response.isSuccess == true) {
        ResponseAddService responseAddService =
            ResponseAddService.fromJson(response.data);
        if (responseAddService.meta!.code == 1) {
          RequestUpdateServiceStatus requestServiceStatus =
              RequestUpdateServiceStatus(
            id: responseAddService.flag,
            serviceStatusID: 2,
            updatedBy: userId,
          );
          DataResponse response =
              await addServiceRepo.serviceStatusUpdate(requestServiceStatus);
          if (response.isSuccess == true) {
            ResponseServiceStatusUpdate responseServiceUpdate =
                ResponseServiceStatusUpdate.fromJson(response.data);
            {
              if (responseServiceUpdate.meta!.code == 1) {
                RequestAddServiceVisit requestServiceVisit =
                    RequestAddServiceVisit(
                        serviceID: responseAddService.flag,
                        engineerID: int.parse(userId),
                        problemReported: "",
                        serviceRendered: "",
                        serviceStatusID: 2,
                        visitScheduleDate:
                            DateFormat('dd/MM/yyyy').format(DateTime.now()),
                        givePriority: true,
                        make: "",
                        model: "",
                        srNo: "",
                        createdBy: int.parse(userId));

                DataResponse response =
                    await addServiceRepo.addServiceVisit(requestServiceVisit);
                {
                  if (response.isSuccess == true) {
                    ResponseServiceVisit responseServiceVisit =
                        ResponseServiceVisit.fromJson(response.data);
                    if (responseServiceVisit.meta!.code == 1) {
                      Get.offAllNamed(AppRoutes.homePage);
                    } else {
                      UIUtils.showSnakBar(
                          bodyText: responseServiceVisit!.meta!.message!,
                          headerText: "Error Message");
                    }
                  }
                }
              } else {
                UIUtils.showSnakBar(
                    bodyText: responseServiceUpdate!.meta!.message!,
                    headerText: "Error Message");
              }
            }
          }
        } else {
          UIUtils.showSnakBar(
              bodyText: responseAddService!.meta!.message!,
              headerText: "Error Message");
        }

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
