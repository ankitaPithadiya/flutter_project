import 'dart:convert';

import 'package:ananta/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';

class UIUtils {
  static bool isProgressVisible = false;

  ///common method for showing progress dialog
  static void showProgressDialog({isCancellable = false}) async {
    if (!isProgressVisible) {
      Get.dialog(
        Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // you can replace
                SizedBox(
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                    strokeWidth: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      isProgressVisible = true;
    }
  }

  ///common method for hiding progress dialog
  static void hideProgressDialog() {
    if (isProgressVisible) Get.back();
    isProgressVisible = false;
  }

  static void showSnakBar({String? headerText, bodyText}) {
    Get.snackbar(
      headerText ?? "ERRORMESSAGE".tr,
      bodyText,
      backgroundColor: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
