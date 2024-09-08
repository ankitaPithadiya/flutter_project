import 'package:ananta/routes/app_routes.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_floating_text_field.dart';
import '../../widgets/custom_outlined_button.dart';
import 'controller/login_controller.dart';

// ignore_for_file: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class LoginScreen extends GetWidget<LoginController> {
  LoginScreen({Key? key})
      : super(
          key: key,
        );



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: controller.formKey,
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    Container(
                      height: 10.v,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onErrorContainer,
                      ),
                    ),
                    SizedBox(height: 68.v),
                    CustomImageView(
                      imagePath: ImageConstant.imgAppIcon,
                      height: 150.adaptSize,
                      width: 150.adaptSize,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 27.v),
                    Text(
                      "msg_login_to_your_account".tr,
                      style: theme.textTheme.headlineSmall,
                    ),
                    SizedBox(height: 10.v),
                    Text(
                      "msg_welcome_back_please".tr,
                      style: CustomTextStyles.bodyLargeGray700,
                    ),
                    SizedBox(height: 25.v),
                    _buildUsername(),
                    SizedBox(height: 25.v),
                    _buildPassword(),
                    SizedBox(height: 59.v),
                    _buildContinue(context),
                    SizedBox(height: 25.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUsername() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomFloatingTextField(
        controller: controller.userNameController,
        labelText: "Username".tr,
        labelStyle: CustomTextStyles.bodyLargeGray800,
        hintText: "Username".tr,
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.text,

        validator: (value) {
          if (!isText(value)) {
            return "Enter Valid User Name";
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPassword() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomFloatingTextField(
        controller: controller.passwordController,
        labelText: "Password".tr,
        labelStyle: CustomTextStyles.bodyLargeGray800,
        hintText: "Password".tr,
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.text,

        validator: (value) {
          if (!isText(value)) {
            return "Enter Valid Password";
          }
          return null;
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildContinue(BuildContext context) {
    return CustomElevatedButton(
      text: "Login".tr,
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      onPressed: () {
        controller.loginUsers(context);
      },
      buttonTextStyle: CustomTextStyles.titleSmallGray900,
    );
  }


}
