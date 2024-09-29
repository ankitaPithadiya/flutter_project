import 'package:ananta/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_floating_text_field.dart';
import 'controller/solved_controller_eng.dart';
 // ignore_for_file: must_be_immutable

class SolvedEngScreen extends GetWidget<SolvedEngController> {
  SolvedEngScreen({Key? key})
      : super(
    key: key,
  );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title:  Text(
          "Solved Engineer Service",
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
                  _buildUserMake(),
                  SizedBox(height: 16.v),
                  _buildUserModel(),
                  SizedBox(height: 16.v),
                  _buildUserSrNo(),
                  SizedBox(height: 16.v),
                  _buildProblemController(),
                  SizedBox(height: 16.v),
                  _buildServiceRender(),
                  SizedBox(height: 16.v),



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
  Widget _buildUserMake() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomFloatingTextField(
        controller: controller.makeController,
        labelText: "Make",
        // labelStyle: theme.textTheme.bodyLarge!,
        hintText: "Make",
        hintStyle:TextStyle(fontSize:14,color:Colors.black),
        alignment: Alignment.center,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please Enter Value";
          }
          return null;
        },
        borderDecoration: FloatingTextFormFieldStyleHelper.outlineGrayTL42,
      ),
    );
  }






  /// Section Widget
  Widget _buildUserModel() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomFloatingTextField(
        controller: controller.modelController,
        labelText: "Model",
        textInputType: TextInputType.text,
        // labelStyle: theme.textTheme.bodyLarge!,
        hintText: "Model",
        alignment: Alignment.center,
        hintStyle:TextStyle(fontSize:14,color:Colors.black),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please Enter Model Value";
          }
          return null;
        },
        borderDecoration: FloatingTextFormFieldStyleHelper.outlineGrayTL42,
      ),
    );
  }
  Widget _buildUserSrNo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomFloatingTextField(
        controller: controller.srNoController,
        labelText: "Sr No",
        textInputType: TextInputType.text,
        // labelStyle: theme.textTheme.bodyLarge!,
        hintText: "Sr No",
        alignment: Alignment.center,
        hintStyle:TextStyle(fontSize:14,color:Colors.black),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please Enter Sr No";
          }
          return null;
        },
        borderDecoration: FloatingTextFormFieldStyleHelper.outlineGrayTL42,
      ),
    );
  }
  Widget _buildProblemController() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomFloatingTextField(
        controller: controller.problemController,
        labelText: "ProblemController",
        textInputType: TextInputType.text,
        // labelStyle: theme.textTheme.bodyLarge!,
        hintText: "ProblemController",
        alignment: Alignment.center,
        hintStyle:TextStyle(fontSize:14,color:Colors.black),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please Enter Value";
          }
          return null;
        },
        borderDecoration: FloatingTextFormFieldStyleHelper.outlineGrayTL42,
      ),
    );
  }
  Widget _buildServiceRender() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomFloatingTextField(
        controller: controller.serviceRenderdController,
        labelText: "Service Render",
        textInputType: TextInputType.text,
        // labelStyle: theme.textTheme.bodyLarge!,
        hintText: "Service Render",
        alignment: Alignment.center,
        hintStyle:TextStyle(fontSize:14,color:Colors.black),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please Enter Value";
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
           controller.updateStatusApi();
        },
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapImgArrowleftone() {
    Get.back();
  }
}
