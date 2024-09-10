import 'dart:convert';

import '../../../ApiServices/api_endpoints.dart';
import '../../../common_request_model/common_request_model.dart';
import '../../../network/service/data_response.dart';
import '../../../network/service/http_wrapper.dart';
import '../models/client_location_model.dart';
import '../models/client_model.dart';
import '../models/company_model.dart';
import '../models/equipment_model.dart';
import '../models/service_type_model.dart';


class AddServiceRepository {
  final wpWrapper = DioWrapper(apiType: ApiType.WP);

  Future<List<CompanyModel>> getCompanyList() async {
    RequestDropDownList request =
        RequestDropDownList(searchFor: "", pageNumber: 1, rowOfPage: 1000);

    DataResponse response = await wpWrapper.get(
        ApiEndPoints.companyList, request.toJson(),
        shouldShowGlobalErrorToaster: true, showLoader: false);
    if (response.isSuccess == true) {
      ResponseCompany responseCompany =
      ResponseCompany.fromJson(json.decode(response.data));
      List<CompanyModel>? companyList =
          responseCompany.companyModel;
      return companyList!;
    } else {
      return [];
    }
  }

  Future<List<ServiceTypeModel>> getServiceList() async {
    RequestDropDownList request =
    RequestDropDownList(searchFor: "", pageNumber: 1, rowOfPage: 1000);

    DataResponse response = await wpWrapper.get(
        ApiEndPoints.serviceType, request.toJson(),
        shouldShowGlobalErrorToaster: true, showLoader: false);
    if (response.isSuccess == true) {
      ResponseServiceType responseServiceType =
      ResponseServiceType.fromJson(json.decode(response.data));
      List<ServiceTypeModel>? serviceTypeList =
          responseServiceType.serviceTypeModel;
      return serviceTypeList!;
    } else {
      return [];
    }
  }


  Future<List<ClientModel>> getClientList() async {
    RequestDropDownList request =
    RequestDropDownList(searchFor: "", pageNumber: 1, rowOfPage: 1000);

    DataResponse response = await wpWrapper.get(
        ApiEndPoints.client, request.toJson(),
        shouldShowGlobalErrorToaster: true, showLoader: false);
    if (response.isSuccess == true) {
      ResponseClient responseClient =
      ResponseClient.fromJson(json.decode(response.data));
      List<ClientModel>? clientList =
          responseClient.clientModel;
      return clientList!;
    } else {
      return [];
    }
  }

  Future<List<EquipmentType>> getEquipmentList() async {
    RequestDropDownList request =
    RequestDropDownList(searchFor: "", pageNumber: 1, rowOfPage: 1000);

    DataResponse response = await wpWrapper.get(
        ApiEndPoints.equipmentType, request.toJson(),
        shouldShowGlobalErrorToaster: true, showLoader: false);
    if (response.isSuccess == true) {
      ResponseEquipmentTypeModel responseEquipment =
      ResponseEquipmentTypeModel.fromJson(json.decode(response.data));
      List<EquipmentType>? equipmentList =
          responseEquipment.equipmentTypeModel;
      return equipmentList!;
    } else {
      return [];
    }
  }
  Future<List<ClientLocationModel>> getClientLocation() async {
    RequestDropDownList request =
    RequestDropDownList(searchFor: "", pageNumber: 1, rowOfPage: 1000);

    DataResponse response = await wpWrapper.get(
        ApiEndPoints.clientLocation, request.toJson(),
        shouldShowGlobalErrorToaster: true, showLoader: false);
    if (response.isSuccess == true) {
      ResponseClientLocation responseClientLocation =
      ResponseClientLocation.fromJson(json.decode(response.data));
      List<ClientLocationModel>? clientLocationList =
          responseClientLocation.clientLocationModel;
      return clientLocationList!;
    } else {
      return [];
    }
  }
}
