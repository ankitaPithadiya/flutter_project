import 'dart:convert';

import '../../../ApiServices/api_endpoints.dart';
import '../../../common_request_model/common_request_model.dart';
import '../../../network/service/data_response.dart';
import '../../../network/service/http_wrapper.dart';
import '../models/expense_type_model.dart';
import '../models/money_spend_by.dart';

class ExpenseRepository {
  final wpWrapper = DioWrapper(apiType: ApiType.WP);

  Future<List<ExpenseTypeModel>> getExpenseTypeList() async {
    RequestDropDownList request =
        RequestDropDownList(searchFor: "", pageNumber: 1, rowOfPage: 1000);

    DataResponse response = await wpWrapper.get(
        ApiEndPoints.expenseType, request.toJson(),
        shouldShowGlobalErrorToaster: true, showLoader: false);
    if (response.isSuccess == true) {
      ResponseExpenseType responseExpense =
          ResponseExpenseType.fromJson(json.decode(response.data));
      List<ExpenseTypeModel>? expenseList =
          responseExpense.getByIDResponseMasterViewModels;
      return expenseList!;
    } else {
      return [];
    }
  }

  Future<List<MoneySpendByModel>> getMoneySpendList() async {
    RequestDropDownList request =
    RequestDropDownList(searchFor: "", pageNumber: 1, rowOfPage: 1000);

    DataResponse response = await wpWrapper.get(
        ApiEndPoints.moneySpendBy, request.toJson(),
        shouldShowGlobalErrorToaster: true, showLoader: false);
    if (response.isSuccess == true) {
      ResponseMoneySpendBy responseMoneySpendBy =
      ResponseMoneySpendBy.fromJson(json.decode(response.data));
      List<MoneySpendByModel>? moneySpendByList =
          responseMoneySpendBy.moneySpendByModel;
      return moneySpendByList!;
    } else {
      return [];
    }
  }
}
