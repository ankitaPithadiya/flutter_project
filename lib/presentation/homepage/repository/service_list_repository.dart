import 'dart:convert';

import '../../../ApiServices/api_endpoints.dart';
import '../../../network/service/data_response.dart';
import '../../../network/service/http_wrapper.dart';
import '../../add_expense/models/expense_type_model.dart';
import '../models/request_service_list.dart';
import '../models/response_service_list_model.dart';

class ServiceListRepository {
  final wpWrapper = DioWrapper(apiType: ApiType.WP);

  Future<List<ServiceReport>> getServiceTypeList(RequestServiceList requestServiceList) async {


    DataResponse response = await wpWrapper.get(
        ApiEndPoints.serviceList, requestServiceList.toJson(),
        shouldShowGlobalErrorToaster: true, showLoader: true);
    if (response.isSuccess == true) {
      ResponseServiceList responseServiceList =
      ResponseServiceList.fromJson(json.decode(response.data));
      List<ServiceReport>? expenseList =
          responseServiceList.serviceReport;
      return expenseList!;
    } else {
      return [];
    }
  }
}