import 'dart:convert';

import '../../../ApiServices/api_endpoints.dart';
import '../../../common_request_model/common_request_model.dart';
import '../../../network/service/data_response.dart';
import '../../../network/service/http_wrapper.dart';
import '../models/add_expense_model.dart';
import '../models/expense_type_model.dart';
import '../models/money_spend_by.dart';

class ExpenseRepository {
  final wpWrapper = DioWrapper(apiType: ApiType.WP);

  Future<List<ExpenseTypeModel>> getExpenseTypeList() async {
    RequestDropDownList request =
        RequestDropDownList(searchFor: "", pageNumber: 1, rowOfPage: 1000);

    DataResponse response = await wpWrapper.post(
        ApiEndPoints.expenseType, data:request.toJson(),
        shouldShowGlobalErrorToaster: true, showLoader: false);
    if (response.isSuccess == true) {
      ResponseExpenseType responseExpense =
          ResponseExpenseType.fromJson(response.data);
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

    DataResponse response = await wpWrapper.post(
        ApiEndPoints.moneySpendBy, data:request.toJson(),
        shouldShowGlobalErrorToaster: true, showLoader: false);
    if (response.isSuccess == true) {
      ResponseMoneySpendBy responseMoneySpendBy =
      ResponseMoneySpendBy.fromJson(response.data);
      List<MoneySpendByModel>? moneySpendByList =
          responseMoneySpendBy.moneySpendByModel;
      return moneySpendByList!;
    } else {
      return [];
    }
  }

  Future<DataResponse> addExpense(RequestAddExpense requestAddExpense) async {
    DataResponse response = await wpWrapper.post(ApiEndPoints.addExpense,
        shouldShowGlobalErrorToaster: true,
        data: requestAddExpense.toJson(),
        showLoader: true);
    if (response.isSuccess == true) {}
    return response;
  }



}
