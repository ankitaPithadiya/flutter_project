import 'package:ananta/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_floating_text_field.dart';
import 'controller/feedback_controller.dart';
 // ignore_for_file: must_be_immutable

class FeedbackScreen extends GetWidget<FeedbackController> {
  FeedbackScreen({Key? key})
      : super(
    key: key,
  );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title:  Text(
          "Feedback",
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
                  _buildUserName(),
                  SizedBox(height: 16.v),
                  _buildUserMo(),
                  SizedBox(height: 16.v),
                  _buildUserEmail(),
                  SizedBox(height: 16.v),
                  _buildRemark(),
                  SizedBox(height: 16.v),
                  _buildDesignation(),
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
  Widget _buildUserName() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomFloatingTextField(
        controller: controller.userNameController,
        labelText: "Name",
        // labelStyle: theme.textTheme.bodyLarge!,
        hintText: "Name",
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
  Widget _buildUserMo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomFloatingTextField(
        controller: controller.mobileController,
        labelText: "Mobile Number",
        textInputType: TextInputType.number,
        // labelStyle: theme.textTheme.bodyLarge!,
        hintText: "Mobile Number",
        alignment: Alignment.center,
        hintStyle:TextStyle(fontSize:14,color:Colors.black),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please Enter Mobile number";
          }
          return null;
        },
        borderDecoration: FloatingTextFormFieldStyleHelper.outlineGrayTL42,
      ),
    );
  }
  Widget _buildUserEmail() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomFloatingTextField(
        controller: controller.emailController,
        labelText: "Email",
        textInputType: TextInputType.text,
        // labelStyle: theme.textTheme.bodyLarge!,
        hintText: "Email",
        alignment: Alignment.center,
        hintStyle:TextStyle(fontSize:14,color:Colors.black),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please Enter Valid Email";
          }
          return null;
        },
        borderDecoration: FloatingTextFormFieldStyleHelper.outlineGrayTL42,
      ),
    );
  }
  Widget _buildRemark() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomFloatingTextField(
        controller: controller.remarkController,
        labelText: "Remark",
        textInputType: TextInputType.text,
        // labelStyle: theme.textTheme.bodyLarge!,
        hintText: "Remark",
        alignment: Alignment.center,
        maxLines:2,
        hintStyle:TextStyle(fontSize:14,color:Colors.black),
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
  Widget _buildDesignation() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomFloatingTextField(
        controller: controller.designationController,
        labelText: "Designation",
        textInputType: TextInputType.text,
        // labelStyle: theme.textTheme.bodyLarge!,
        hintText: "Designation",
        alignment: Alignment.center,
        hintStyle:TextStyle(fontSize:14,color:Colors.black),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please Enter Designation";
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
        text: "Next",
        margin: EdgeInsets.symmetric(horizontal: 16.h),
        buttonTextStyle: CustomTextStyles.titleSmallOnErrorContainer_1,
        onPressed: () {
           controller.submitData();
        },
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapImgArrowleftone() {
    Get.back();
  }
}
