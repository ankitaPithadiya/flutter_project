import 'dart:convert';

import '../../../ApiServices/api_endpoints.dart';
import '../../../network/service/data_response.dart';
import '../../../network/service/http_wrapper.dart';
import '../../add_expense/models/expense_type_model.dart';
import '../models/expenselist_model.dart';
import '../models/request_expense_list.dart';

class ExpenseListRepository {
  final wpWrapper = DioWrapper(apiType: ApiType.WP);

  Future<ResponseExpenseList?> getExpenseList(
      RequestExpenseList requestExpenseList) async {
    DataResponse response = await wpWrapper.post(ApiEndPoints.expenseList,
        data: requestExpenseList.toJson(),
        shouldShowGlobalErrorToaster: true,
        showLoader: true);
    if (response.isSuccess == true) {
      ResponseExpenseList responseExpenseList =
          ResponseExpenseList.fromJson(response.data);
      List<ExpenseReport>? expenseList = responseExpenseList.expenseReport;
      return responseExpenseList!;
    } else {
      return null;
    }
  }
}
