import 'package:ananta/core/app_export.dart';
import 'package:ananta/presentation/homepage/controller/home_controller.dart';
import 'package:ananta/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/custom_button_style.dart';
import '../../widgets/custom_outlined_button.dart';

class HomeScreen extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home screen"),
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Service name'),
                      Text(
                        'Service name',
                        style: TextStyle(fontSize: 12.fSize),
                      )
                    ],
                  ),
                  CustomOutlinedButton(
                    height: 32.v,
                    width: 90.h,
                    text: "Add Expense",
                    onPressed: () {
                      Get.toNamed(AppRoutes.addExpense);

                    },
                    buttonStyle: CustomButtonStyles.outlineDeepPurple,
                    buttonTextStyle: CustomTextStyles.titleSmallGray800,
                    alignment: Alignment.bottomCenter,
                  ),
                ],
              ),
              children: controller.tile1List.map((index) => index).toList(),
            );
          }),
    );
  }
}
