import 'package:ananta/core/app_export.dart';
import 'package:ananta/presentation/homepage/controller/home_controller.dart';
import 'package:ananta/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/custom_button_style.dart';
import '../../webview_screen.dart';
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
                controller.selectDate(context);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              onPressed: () {
                controller.logout(context);
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
              Get.toNamed(AppRoutes.expenseList);
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
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.h, vertical: 10.v),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: ListTile(
                        title:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.v),
                                Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                 Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     mainAxisSize: MainAxisSize.max,
                                   children:[
                                     Text('Service Id:',
                                         style: TextStyle(
                                             fontWeight: FontWeight.w600)),
                                     SizedBox(width: 5.h),
                                     Text(
                                       controller
                                           .serviceReportList![index].serviceId
                                           .toString(),
                                     ),
                                   ]
                                 ),

                                  InkWell(
                                    onTap:(){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => WebViewApp(controller
                                          .serviceReportList![index].serviceId)));
                                    },
                                    child:Container(
                                        alignment:Alignment.bottomRight,
                                        child: Icon(Icons.download,size:20,color:Colors.black)
                                    ),
                                  )
                                ]),
                                SizedBox(height: 5.v),
                                Row(children: [
                                  Text('Client Location:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(width: 5.h),
                                  Text(
                                    controller.serviceReportList![index]
                                        .clientLocation
                                        .toString(),
                                  )
                                ]),
                                SizedBox(height: 5.v),
                                Row(children: [
                                  Text('User Name:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(width: 5.h),
                                  Text(
                                    controller
                                        .serviceReportList![index].userName
                                        .toString(),
                                  )
                                ]),
                                SizedBox(height: 5.v),
                                // Row(
                                //     mainAxisAlignment: MainAxisAlignment.start,
                                //     children:[
                                //       Text('User Complain:'),
                                //       Container(
                                //         child:Text(
                                //           controller.serviceReportList![index].userComplaint.toString(),
                                //           maxLines:4,
                                //           overflow: TextOverflow.ellipsis,
                                //         )
                                //       )
                                //     ]
                                // ),
                                // SizedBox(height: 5.v),
                                Row(children: [
                                  Text('Service Type:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(width: 5.h),
                                  Text(
                                    controller
                                        .serviceReportList![index].serviceType
                                        .toString(),
                                  )
                                ]),
                                SizedBox(height: 5.v),
                                Row(children: [
                                  Text('Equipment Type:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600)),
                                  Text(
                                    controller
                                        .serviceReportList![index].equipmentType
                                        .toString(),
                                  )
                                ]),
                                SizedBox(height: 5.h),
                                Row(children: [
                                  Text('Service Status:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(width: 5.h),
                                  Text(
                                    controller
                                        .serviceReportList![index].serviceStatus
                                        .toString(),
                                  )
                                ]),

                                SizedBox(height: 10.v),

                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:[

                                  controller
                                      .serviceReportList![index].serviceStatus
                                      .toString()=="Assign"?Row(children: <Widget>[
                                    CustomOutlinedButton(
                                      height: 40.v,
                                      width: 90.h,
                                      text: " Not Visited",
                                      buttonTextStyle:TextStyle(color:Colors.white,fontSize:12),
                                      onPressed: () {
                                        controller.updateStatus(context,controller.serviceReportList![index].serviceId!,controller.serviceReportList![index].serviceVisitID!);
                                      },
                                      buttonStyle:
                                      CustomButtonStyles.outlineGrayTL28,
                                      // buttonTextStyle:
                                      //     CustomTextStyles.titleSmallGray800,
                                      alignment: Alignment.bottomCenter,
                                    ),
                                    SizedBox(width: 10.h),
                                    CustomOutlinedButton(
                                      height: 40.v,
                                      width: 90.h,
                                      text: "Not Solved",
                                      onPressed: () {
                                        Get.toNamed(AppRoutes.notSolved, arguments: {'serviceId': controller.serviceReportList![index].serviceId!,'serviceVisitId':controller.serviceReportList![index].serviceVisitID!});
                                      },
                                      buttonTextStyle:TextStyle(color:Colors.white,fontSize:12),
                                      buttonStyle:
                                      CustomButtonStyles.outlineGrayTL28,
                                      // buttonTextStyle:
                                      //     CustomTextStyles.titleSmallGray800,
                                      alignment: Alignment.bottomCenter,
                                    ),
                                    SizedBox(width: 10.h),
                                    CustomOutlinedButton(
                                      height: 40.v,
                                      width: 90.h,
                                      text: "Solved",
                                      onPressed: () {
                                        Get.toNamed(AppRoutes.solvedEng, arguments: {'serviceId': controller.serviceReportList![index].serviceId!,'serviceVisitId':controller.serviceReportList![index].serviceVisitID!});
                                      },
                                      buttonStyle:
                                      CustomButtonStyles.outlineBlue,
                                      buttonTextStyle:TextStyle(color:Colors.white,fontSize:12),
                                      alignment: Alignment.bottomCenter,
                                    ),
                                  ]):SizedBox(),

                                  ]
                                ),
                                controller
                                    .serviceReportList![index].serviceStatus
                                    .toString()=="Assign"?SizedBox(height: 5.v):SizedBox(),
                              ],


                        ),
                        // children: controller.tile1List.map((index) => index).toList(),
                      ));
                })))
      ]),
    );
  }
}
