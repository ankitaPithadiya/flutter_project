import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../models/add_expense_model.dart';
import '../respository/expense_repository.dart';

/// A controller class for the SignUpTwoScreen.
///
/// This class manages the state of the SignUpTwoScreen, including the
/// current signUpTwoModelObj
class AddExpenseController extends GetxController {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController mobileNumberController = TextEditingController();

  Rx<AddExpenseModel> signUpTwoModelObj = AddExpenseModel().obs;

  Rx<String> selectGender = "".obs;
  ExpenseRepository exRepo=ExpenseRepository();

  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Item One",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Item Two",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Item Three",
    )
  ]);
  @override
  onInit(){
    exRepo.getExpenseTypeList();
  }

  @override
  void onClose() {
    super.onClose();
    firstNameController.dispose();
    lastNameController.dispose();
    mobileNumberController.dispose();
  }
}
