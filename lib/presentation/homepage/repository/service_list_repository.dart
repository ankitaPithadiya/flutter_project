import 'dart:convert';

import '../../../ApiServices/api_endpoints.dart';
import '../../../network/service/data_response.dart';
import '../../../network/service/http_wrapper.dart';
import '../../add_expense/models/expense_type_model.dart';
import '../models/request_service_list.dart';
import '../models/response_service_list_model.dart';

class ServiceListRepository {
  final wpWrapper = DioWrapper(apiType: ApiType.WP);

  Future<ResponseServiceList?> getServiceTypeList(RequestServiceList requestServiceList) async {


    DataResponse response = await wpWrapper.post(
        ApiEndPoints.serviceList,data:requestServiceList.toJson(),
        shouldShowGlobalErrorToaster: true, showLoader: true);
    if (response.isSuccess == true) {

      ResponseServiceList responseServiceList =
      ResponseServiceList.fromJson(response.data);
      List<ServiceReport>? expenseList =
          responseServiceList.serviceReport;
      return responseServiceList;
    } else {
      return null;
    }
  }
}