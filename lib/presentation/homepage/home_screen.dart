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
          ]),
      body: Column(children: <Widget>[
        Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        SizedBox(height: 10.v),
        Row(children: <Widget>[
          SizedBox(width: 20.h),
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
          SizedBox(width: 10.h),
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
          SizedBox(width: 10.h),
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
        ]),
        SizedBox(height: 10.v),
        Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        SizedBox(height: 10.v),
        Expanded(
            child: Obx(() => ListView.builder(
                itemCount: controller.serviceReportList!.value.length,
                itemBuilder: (context, index) {
                  return Card.outlined(
                      elevation: 5,
                      color: appTheme.gray100,
                      margin: EdgeInsets.symmetric(horizontal: 10.h,vertical:10.v),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.v),
                                Row(
                                  children:[
                                    Text('Service Id:'),
                                    Text(
                                      controller.serviceReportList![index].serviceId.toString(),
                                    )
                                  ]
                                ),
                                SizedBox(height: 5.v),
                                Row(
                                    children:[
                                      Text('Client Location:'),
                                      Text(
                                        controller.serviceReportList![index].clientLocation.toString(),
                                      )
                                    ]
                                ),
                                SizedBox(height: 5.v),
                                Row(
                                    children:[
                                      Text('User Name:'),
                                      Text(
                                        controller.serviceReportList![index].userName.toString(),
                                      )
                                    ]
                                ),
                                SizedBox(height: 5.v),
                                Row(
                                    children:[
                                      Text('User Complain:'),
                                      Text(
                                        controller.serviceReportList![index].userComplaint.toString(),
                                      )
                                    ]
                                ),
                                SizedBox(height: 5.v),
                                Row(
                                    children:[
                                      Text('Service Type:'),
                                      Text(
                                        controller.serviceReportList![index].serviceType.toString(),
                                      )
                                    ]
                                ),
                                SizedBox(height: 5.v),
                                Row(
                                    children:[
                                      Text('Equipment Type:'),
                                      Text(
                                        controller.serviceReportList![index].equipmentType.toString(),
                                      )
                                    ]
                                ),
                                SizedBox(height: 5.v),
                                Row(
                                    children:[
                                      Text('Service Status:'),
                                      Text(
                                        controller.serviceReportList![index].serviceStatus.toString(),
                                      )
                                    ]
                                )
                              ],
                            ),
                          ],
                        ),
                        // children: controller.tile1List.map((index) => index).toList(),
                      ));
                })))
      ]),
    );
  }
}
