import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../models/add_expense_model.dart';
import '../models/expense_type_model.dart';
import '../models/money_spend_by.dart';
import '../respository/expense_repository.dart';

/// A controller class for the SignUpTwoScreen.
///
/// This class manages the state of the SignUpTwoScreen, including the
/// current signUpTwoModelObj
class AddExpenseController extends GetxController {
  TextEditingController serviceIdController = TextEditingController();

  TextEditingController expenseController = TextEditingController();

  TextEditingController dateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController remarkController = TextEditingController();


  RxList<ExpenseTypeModel>? expenseList = <ExpenseTypeModel>[].obs;
  RxList<MoneySpendByModel>? moneySpendByList = <MoneySpendByModel>[].obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Rx<ExpenseTypeModel> expenseTypeModel=ExpenseTypeModel().obs;
  Rx<MoneySpendByModel> moneySpendBy=MoneySpendByModel().obs;

  ExpenseRepository exRepo = ExpenseRepository();

  @override
  onInit() {
    getExpenseList();
    getMoneySpendByList();
  }

  void getExpenseList() async {
    expenseList!.value = await exRepo.getExpenseTypeList();
  }

  void getMoneySpendByList() async{
    moneySpendByList!.value = await exRepo.getMoneySpendList();
  }

  @override
  void onClose() {
    super.onClose();
    dateController.dispose();
  }
}
