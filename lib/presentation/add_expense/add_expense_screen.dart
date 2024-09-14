
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_floating_text_field.dart';
import 'controller/add_expense_controller.dart';
import 'models/expense_type_model.dart';
import 'models/money_spend_by.dart'; // ignore_for_file: must_be_immutable

class AddExpenseScreen extends GetWidget<AddExpenseController> {
  AddExpenseScreen({Key? key})
      : super(
          key: key,
        );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          "lbl_add_expense".tr,
          style: theme.textTheme.headlineSmall,
        ),
      ),
      body: SizedBox(
        width: SizeUtils.width,
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25.v),
                  _buildExpensesDes(),
                  SizedBox(height: 16.v),
                  Obx(() => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        child: Center(
                          child: DropdownButtonFormField<ExpenseTypeModel>(
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
                            onChanged: (value) {
                              controller.expenseTypeModel.value=value!;
                            },
                            items: controller.expenseList!.value
                                .map<DropdownMenuItem<ExpenseTypeModel>>(
                                    (ExpenseTypeModel value) {
                              return DropdownMenuItem<ExpenseTypeModel>(
                                value: value,
                                child: Text(value.name!,style:CustomTextStyles.bodyMediumBlack900),
                              );
                            }).toList(),
                            validator: (ExpenseTypeModel? value) {
                              return value == null ? "Select Expense Type" : null;
                            },
                          ),
                        ),
                      )),
                  SizedBox(height: 16.v),
                  Obx(
                    () => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: Center(
                        child: DropdownButtonFormField<MoneySpendByModel>(
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
                          //style: TextStyle(color: Colors.deepPurple),
                          onChanged: (value) {
                            controller.moneySpendBy.value=value!;
                          },
                          items: controller.moneySpendByList!.value
                              .map<DropdownMenuItem<MoneySpendByModel>>(
                                  (MoneySpendByModel value) {
                            return DropdownMenuItem<MoneySpendByModel>(
                              value: value,
                              child: Text(value.fullName!,style:CustomTextStyles.bodyMediumBlack900),
                            );
                          }).toList(),
                          validator: (MoneySpendByModel? value) {
                            return value == null ? "Select MoneySpend By" : null;
                          },

                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.v),
                  _buildExpensesDate(context),
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
      bottomNavigationBar: _buildContinue(context),
    );
  }

  /// Section Widget
  Widget _buildRemark() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomFloatingTextField(
        controller: controller.remarkController,
        labelText: "Remark",
        labelStyle: theme.textTheme.bodyLarge!,
        hintText: "Remark",
        alignment: Alignment.center,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please Enter Remark";
          }
          return null;

        },
        borderDecoration: FloatingTextFormFieldStyleHelper.outlineGrayTL42,
      ),
    );
  }

  Widget _buildExpensesDate(BuildContext context) {
    return InkWell(
        onTap: () => _selectDate(context),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: IgnorePointer(
              child: CustomFloatingTextField(
                controller: controller.dateController,
                labelText: "Expenses Date",
                suffix: Icon(Icons.calendar_today),
                labelStyle: theme.textTheme.bodyLarge!,
                hintText: "Expenses Date",
                alignment: Alignment.center,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Date";
                  }
                  return null;
                },
                borderDecoration:
                    FloatingTextFormFieldStyleHelper.outlineGrayTL42,
              ),
            )));
  }

  Future<Null> _selectDate(BuildContext context) async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2025),
    ).then((selectedDate) {
      if (selectedDate != null) {
        controller.dateController.text =
            DateFormat('yyyy-MM-dd').format(selectedDate);
      }
    });
  }

  Widget _buildServiceId() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomFloatingTextField(
        controller: controller.serviceIdController,
        labelText: "Service Id",
        labelStyle: theme.textTheme.bodyLarge!,
        hintText: "Service Id",
        alignment: Alignment.center,
        textInputType: TextInputType.number,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please Enter Number";
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
        controller: controller.expenseController,
        labelText: "Expense Description",
        labelStyle: theme.textTheme.bodyLarge!,
        hintText: "Remark",
        alignment: Alignment.center,
        textInputType: TextInputType.text,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please Enter Description";
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
        controller: controller.amountController,
        labelText: "Add Amount",
        textInputType: TextInputType.number,
        labelStyle: theme.textTheme.bodyLarge!,
        hintText: "Please add amount",
        alignment: Alignment.center,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please Enter Amount";
          }
          return null;
        },
        borderDecoration: FloatingTextFormFieldStyleHelper.outlineGrayTL42,
      ),
    );
  }

  /// Section Widget


  /// Section Widget
  Widget _buildContinue(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: CustomElevatedButton(
        text: "Submit",
        margin: EdgeInsets.symmetric(horizontal: 16.h),
        buttonTextStyle: CustomTextStyles.titleSmallOnErrorContainer_1,
        onPressed: () {
          controller.addExpense(context);
        },
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapImgArrowleftone() {
    Get.back();
  }
}
