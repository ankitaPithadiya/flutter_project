import 'package:ananta/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:ananta/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_floating_text_field.dart';
import '../../widgets/custom_radio_button.dart';
import 'controller/add_expense_controller.dart'; // ignore_for_file: must_be_immutable

class AddExpenseScreen extends GetWidget<AddExpenseController> {
  AddExpenseScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: SizedBox(
        width: SizeUtils.width,
        child: SizedBox(
          height: SizeUtils.height,
          child: Form(
            key: _formKey,
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.h),
                    child: Text(
                      "lbl_add_expense".tr,
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                  SizedBox(height: 10.v),
                  Padding(
                    padding: EdgeInsets.only(left: 16.h),
                    child: Text(
                      "msg_your_key_to_access".tr,
                      style: CustomTextStyles.bodyLargeGray700,
                    ),
                  ),
                  SizedBox(height: 25.v),

                  _buildExpensesDes(),
                  SizedBox(height: 16.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Center(
                      child: DropdownButtonFormField<SelectionPopupModel>(
                        //isDense: true,
                        hint: Text('Choose Expense Type'),
                        iconSize: 24,
                        elevation: 16,
                        decoration: InputDecoration(
                          contentPadding:
                          EdgeInsets.fromLTRB(16.h, 19.v, 16.h, 17.v),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.h),
                            borderSide: BorderSide(
                              color: appTheme.gray900,
                              width: 1,
                            ),
                          ),
                        ),
                        style: TextStyle(color: Colors.deepPurple),
                        onChanged: (value) {},
                        items: controller.dropdownItemList.value
                            .map<DropdownMenuItem<SelectionPopupModel>>(
                                (SelectionPopupModel value) {
                              return DropdownMenuItem<SelectionPopupModel>(
                                value: value,
                                child: Text(value.title),
                              );
                            }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Center(
                      child: DropdownButtonFormField<SelectionPopupModel>(
                        //isDense: true,
                        hint: Text('Money Spend By'),
                        iconSize: 24,
                        elevation: 16,
                        decoration: InputDecoration(
                          contentPadding:
                          EdgeInsets.fromLTRB(16.h, 19.v, 16.h, 17.v),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.h),
                            borderSide: BorderSide(
                              color: appTheme.gray900,
                              width: 1,
                            ),
                          ),
                        ),
                        style: TextStyle(color: Colors.deepPurple),
                        onChanged: (value) {},
                        items: controller.dropdownItemList.value
                            .map<DropdownMenuItem<SelectionPopupModel>>(
                                (SelectionPopupModel value) {
                              return DropdownMenuItem<SelectionPopupModel>(
                                value: value,
                                child: Text(value.title),
                              );
                            }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.v),
                  _buildExpensesDate(),
                  SizedBox(height: 16.v),
                  _buildServiceId(),
                  SizedBox(height: 16.v),
                  _buildRemark(),
                  SizedBox(height: 16.v),
                  _buildAmount()
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildContinue(),
    );
  }

  /// Section Widget
  Widget _buildRemark() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomFloatingTextField(
        controller: controller.firstNameController,
        labelText: "Remark",
        labelStyle: theme.textTheme.bodyLarge!,
        hintText: "Remark",
        alignment: Alignment.center,
        validator: (value) {
          if (!isText(value)) {
            return "err_msg_please_enter_valid_text".tr;
          }
          return null;
        },
        borderDecoration: FloatingTextFormFieldStyleHelper.outlineGrayTL42,
      ),
    );
  }

  Widget _buildExpensesDate() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomFloatingTextField(
        controller: controller.firstNameController,
        labelText: "Expenses Date",
        labelStyle: theme.textTheme.bodyLarge!,
        hintText: "Expenses Date",
        alignment: Alignment.center,
        validator: (value) {
          if (!isText(value)) {
            return "err_msg_please_enter_valid_text".tr;
          }
          return null;
        },
        borderDecoration: FloatingTextFormFieldStyleHelper.outlineGrayTL42,
      ),
    );
  }

  Widget _buildServiceId() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomFloatingTextField(
        controller: controller.firstNameController,
        labelText: "Service Id",
        labelStyle: theme.textTheme.bodyLarge!,
        hintText: "Service Id",
        alignment: Alignment.center,
        validator: (value) {
          if (!isText(value)) {
            return "err_msg_please_enter_valid_text".tr;
          }
          return null;
        },
        borderDecoration: FloatingTextFormFieldStyleHelper.outlineGrayTL42,
      ),
    );
  }

  Widget _buildExpensesDes() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomFloatingTextField(
        controller: controller.firstNameController,
        labelText: "Expense Description",
        labelStyle: theme.textTheme.bodyLarge!,
        hintText: "Remark",
        alignment: Alignment.center,
        validator: (value) {
          if (!isText(value)) {
            return "err_msg_please_enter_valid_text".tr;
          }
          return null;
        },
        borderDecoration: FloatingTextFormFieldStyleHelper.outlineGrayTL42,
      ),
    );
  }
  /// Section Widget
  Widget _buildAmount() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomFloatingTextField(
        controller: controller.firstNameController,
        labelText: "Add Amount",
        textInputType: TextInputType.number,
        labelStyle: theme.textTheme.bodyLarge!,
        hintText: "Please add amount",
        alignment: Alignment.center,
        validator: (value) {
          if (!isText(value)) {
            return "err_msg_please_enter_valid_text".tr;
          }
          return null;
        },
        borderDecoration: FloatingTextFormFieldStyleHelper.outlineGrayTL42,
      ),
    );
  }

  /// Section Widget
  Widget _buildLastName() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomFloatingTextField(
        controller: controller.lastNameController,
        labelText: "lbl_last_name".tr,
        labelStyle: theme.textTheme.bodyLarge!,
        hintText: "lbl_last_name".tr,
        alignment: Alignment.center,
        validator: (value) {
          if (!isText(value)) {
            return "err_msg_please_enter_valid_text".tr;
          }
          return null;
        },
        borderDecoration: FloatingTextFormFieldStyleHelper.outlineGrayTL4,
      ),
    );
  }
  /// Section Widget
  Widget _buildContinue() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: CustomElevatedButton(
        text: "Submit",
        margin: EdgeInsets.symmetric(horizontal: 16.h),
        buttonTextStyle: CustomTextStyles.titleSmallOnErrorContainer_1,
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapImgArrowleftone() {
    Get.back();
  }
}
