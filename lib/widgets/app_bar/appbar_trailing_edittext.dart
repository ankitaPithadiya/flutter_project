import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../custom_text_form_field.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AppbarTrailingEdittext extends StatelessWidget {
  AppbarTrailingEdittext(
      {Key? key, this.hintText, this.controller, this.margin})
      : super(
          key: key,
        );

  String? hintText;

  TextEditingController? controller;

  EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: CustomTextFormField(
        width: 82.h,
        controller: controller,
        hintText: "lbl_200".tr,
        prefix: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 8.h,
            vertical: 7.v,
          ),
          child: CustomImageView(
            imagePath: ImageConstant.imgIconPrimary18x18,
            height: 18.adaptSize,
            width: 18.adaptSize,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: 32.v,
        ),
        borderDecoration: TextFormFieldStyleHelper.outlineGray,
        filled: false,
      ),
    );
  }
}
