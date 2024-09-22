import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

import '../../../core/app_export.dart';
import '../models/expenselist_model.dart';
import '../models/request_expense_list.dart';
import '../repository/expense_list_repository.dart';

class ExpenseViewController extends GetxController {
  bool _customTileExpanded = false;

  ExpenseListRepository expenseRepo=ExpenseListRepository();

  RxList<ExpenseReport>? expenseViewList = <ExpenseReport>[].obs;

  Rx<String>? toDate=DateFormat('dd/MM/yyyy').format(DateTime.now()).obs;





  @override
  onInit() {
    getExpenseList();
  }

  Future<Null> selectDate(BuildContext context) async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2012),
      lastDate: DateTime(2025),
    ).then((selectedDate) {
      if (selectedDate != null) {
        toDate!.value =
            DateFormat('dd/MM/yyyy').format(selectedDate);
        //getServiceList();
      }
    });
  }



  void getExpenseList() async{
    RequestExpenseList request=RequestExpenseList(
        fromDate:"22/08/2024",
        toDate:"22/09/2024",
        companyId: 0,
        expenseDoneBy: 0
    );
    expenseViewList!.value = await expenseRepo.getExpenseList(request);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
