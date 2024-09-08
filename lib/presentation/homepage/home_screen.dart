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
        title: Text("Service List"),
          automaticallyImplyLeading: false,
        actions: <Widget>[
      IconButton(
      icon: Icon(
          Icons.date_range,
        color: Colors.black,
      ),
      onPressed: () {
        // do something
      },
      )
      ]
    ),

      body: Column(
          children:<Widget>[

            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            SizedBox(
                height:10.v
            ),
            Row(
                children:<Widget>[
                  SizedBox(
                    width:20.h
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
                  SizedBox(
                      width:10.h
                  ),
                  CustomOutlinedButton(
                    height: 32.v,
                    width: 90.h,
                    text: "Add Service",
                    onPressed: () {
                      Get.toNamed(AppRoutes.addService);

                    },
                    buttonStyle: CustomButtonStyles.outlineDeepPurple,
                    buttonTextStyle: CustomTextStyles.titleSmallGray800,
                    alignment: Alignment.bottomCenter,
                  ),
                  SizedBox(
                      width:10.h
                  ),
                  CustomOutlinedButton(
                    height: 32.v,
                    width: 90.h,
                    text: "View Expense",
                    onPressed: () {
                      // Get.toNamed(AppRoutes.addExpense);

                    },
                    buttonStyle: CustomButtonStyles.outlineDeepPurple,
                    buttonTextStyle: CustomTextStyles.titleSmallGray800,
                    alignment: Alignment.bottomCenter,
                  ),
                  ]
            ),
            SizedBox(
                height:10.v
            ),

            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            SizedBox(
                height:10.v
            ),

        Expanded(
          child:ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListTile(
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
                      // CustomOutlinedButton(
                      //   height: 32.v,
                      //   width: 90.h,
                      //   text: "Add Expense",
                      //   onPressed: () {
                      //     Get.toNamed(AppRoutes.addExpense);
                      //
                      //   },
                      //   buttonStyle: CustomButtonStyles.outlineDeepPurple,
                      //   buttonTextStyle: CustomTextStyles.titleSmallGray800,
                      //   alignment: Alignment.bottomCenter,
                      // ),
                    ],
                  ),
                  // children: controller.tile1List.map((index) => index).toList(),
                );
              })
        )
        ]
      ),
    );
  }
}
