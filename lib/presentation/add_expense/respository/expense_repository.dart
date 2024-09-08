import 'dart:convert';

import '../../../ApiServices/api_endpoints.dart';
import '../../../common_request_model/common_request_model.dart';
import '../../../network/service/data_response.dart';
import '../../../network/service/http_wrapper.dart';
import '../models/expense_type_model.dart';

class ExpenseRepository {
  final wpWrapper = DioWrapper(apiType: ApiType.WP);

  Future<List<ExpenseTypeModel>?> getExpenseTypeList() async {
    RequestDropDownList request =
        RequestDropDownList(searchFor: "", pageNumber: 1, rowOfPage: 1000);

    DataResponse response = await wpWrapper.get(
        ApiEndPoints.expenseType, request.toJson(),
        shouldShowGlobalErrorToaster: true, showLoader: false);
    if (response.isSuccess == true) {
      List<ExpenseTypeModel> expenseList = (json.decode(response.data.getByIDResponseMasterViewModels) as List)
          .map((data) => ExpenseTypeModel.fromJson(data))
          .toList();

      return expenseList;
    }else
      {
        return [];
      }
  }
}
