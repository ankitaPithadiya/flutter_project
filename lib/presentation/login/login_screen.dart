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

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              key: _formKey,
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
                    _buildContinue(),
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
        textInputType: TextInputType.phone,
        validator: (value) {
          if (!isValidPhone(value)) {
            return "err_msg_please_enter_valid_phone_number".tr;
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
        textInputType: TextInputType.phone,
        validator: (value) {
          if (!isValidPhone(value)) {
            return "err_msg_please_enter_valid_phone_number".tr;
          }
          return null;
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildContinue() {
    return CustomElevatedButton(
      text: "Login".tr,
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      buttonStyle: CustomButtonStyles.fillGray,
      buttonTextStyle: CustomTextStyles.titleSmallGray900,
    );
  }

  /// Section Widget
  Widget _buildRowdividerone() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 7.v,
              bottom: 8.v,
            ),
            child: SizedBox(
              width: 151.h,
              child: Divider(
                color: appTheme.gray10002,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Text(
              "lbl_or".tr,
              style: CustomTextStyles.bodyMediumGray60001,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 7.v,
              bottom: 8.v,
            ),
            child: SizedBox(
              width: 154.h,
              child: Divider(
                color: appTheme.gray10002,
                indent: 4.h,
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSigninwith() {
    return CustomOutlinedButton(
      text: "msg_sign_in_with_google".tr,
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      leftIcon: Container(
        margin: EdgeInsets.only(right: 9.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgGoogle,
          height: 15.adaptSize,
          width: 15.adaptSize,
        ),
      ),
      buttonStyle: CustomButtonStyles.outlineGray,
      buttonTextStyle: theme.textTheme.titleSmall!,
    );
  }

  /// Section Widget
  Widget _buildSigninwith1() {
    return CustomOutlinedButton(
      text: "msg_sign_in_with_apple".tr,
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      leftIcon: Container(
        margin: EdgeInsets.only(right: 8.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgApple,
          height: 18.adaptSize,
          width: 18.adaptSize,
        ),
      ),
      buttonStyle: CustomButtonStyles.outlineGray,
      buttonTextStyle: theme.textTheme.titleSmall!,
    );
  }

  /// Section Widget
  Widget _buildSigninwith2() {
    return CustomOutlinedButton(
      text: "msg_sign_in_with_email".tr,
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      leftIcon: Container(
        margin: EdgeInsets.only(right: 8.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgIconBlack900,
          height: 18.adaptSize,
          width: 18.adaptSize,
        ),
      ),
      buttonStyle: CustomButtonStyles.outlineGray,
      buttonTextStyle: theme.textTheme.titleSmall!,
    );
  }
}
