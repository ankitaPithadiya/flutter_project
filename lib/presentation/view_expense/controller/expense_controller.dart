import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

import '../../../AppConfig/StringConstant.dart';
import '../../../AppUtils/ui_utils.dart';
import '../../../core/app_export.dart';
import '../models/expenselist_model.dart';
import '../models/request_expense_list.dart';
import '../repository/expense_list_repository.dart';

class ExpenseViewController extends GetxController {
  bool _customTileExpanded = false;

  ExpenseListRepository expenseRepo=ExpenseListRepository();

  RxList<ExpenseReport>? expenseViewList = <ExpenseReport>[].obs;

  var date = DateTime.now();

  ResponseExpenseList? responseExpenseList;

  //Rx<String>? toDate=DateFormat('dd/MM/yyyy').format(DateTime.now()).obs;

  Rx<String>? rangeStartDate=DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()).obs;
  Rx<String>? rangeEndDate=DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()).obs;
  Rx<String>? noItemsFound = "".obs;






  @override
  onInit() {
    var newDate = DateTime(date.year, date.month - 1, date.day);
    rangeEndDate!.value=DateFormat('yyyy-MM-dd HH:mm:ss').format(newDate);
    getExpenseList();
  }





  void getExpenseList() async{
    String userId = await PrefUtils.getString(StringConstant.userId);
    RequestExpenseList request=RequestExpenseList(
        fromDate:rangeStartDate!.value,
        toDate:rangeEndDate!.value,
        companyId: 0,
        expenseDoneBy: int.parse(userId)
    );
    responseExpenseList = await expenseRepo.getExpenseList(request);
    if (responseExpenseList!.meta!.code == 1) {
      expenseViewList!.value = responseExpenseList!.expenseReport!;
      expenseViewList!.refresh();
    } else {
      expenseViewList!.value.clear();
      expenseViewList!.refresh();
      noItemsFound!.value = responseExpenseList!.meta!.message!;
      UIUtils.showSnakBar(
          bodyText: responseExpenseList!.meta!.message!,
          headerText: "Error Message");
    }
  }

  @override
  void onClose() {
    super.onClose();
  }


  static Future<DateTimeRange?> showDateRangePickerDialog(
      {required context,
        required labelName,
        DateTimeRange? selectedDateTimeRange,
        DateTime? maxDateRange}) async {
    return await showDateRangePicker(
        context: context,
        // Example: set your desired minimum date
        firstDate: maxDateRange ?? DateTime.now(),
        // Example: set your desired maximum date
        lastDate: DateTime.now(),
        currentDate: DateTime.now(),
        initialEntryMode: DatePickerEntryMode.calendar,
        helpText: labelName,
        builder: (context, child) {

            return child!;
          },

        initialDateRange: selectedDateTimeRange);
  }

  Future<void> selectDateRange(BuildContext context) async {
    var pickDateRangeTime = await showDateRangePickerDialog(
        context: context,
        labelName: 'lbl_select_date'.tr,
        maxDateRange: DateTime(2015));
    if (pickDateRangeTime != null) {
      rangeStartDate!.value = dateFormater(pickDateRangeTime.start);
      rangeEndDate!.value = dateFormater(pickDateRangeTime.end);
      getExpenseList();
    }
  }

  String dateFormater(DateTime selectedDate) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(selectedDate);
  }
}
