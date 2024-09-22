import 'package:ananta/core/app_export.dart';
import 'package:ananta/presentation/homepage/controller/home_controller.dart';
import 'package:ananta/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/custom_button_style.dart';
import '../../widgets/custom_outlined_button.dart';
import 'controller/expense_controller.dart';

class ViewExpenseScreen extends GetWidget<ExpenseViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Expense List"),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.date_range,
                color: Colors.black,
              ),
              onPressed: () {
                // do something
                controller.selectDate(context);
              },
            )
          ]),
      body: Column(children: <Widget>[
        Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        SizedBox(height: 10.v),
        Expanded(
            child: Obx(() => ListView.builder(
                itemCount: controller.expenseViewList!.value.length,
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
                                      Text('PaymentDoneBy:',style:TextStyle(fontWeight:FontWeight.w600)),
                                      SizedBox(width: 5.h),
                                      Text(
                                        controller.expenseViewList![index].paymentDoneBy.toString(),
                                      )
                                    ]
                                ),
                                SizedBox(height: 5.v),
                                Row(
                                    children:[
                                      Text('Expense Amount:',style:TextStyle(fontWeight:FontWeight.w600)),
                                      SizedBox(width: 5.h),
                                      Text(
                                        controller.expenseViewList![index].expenseAmount.toString(),
                                      )
                                    ]
                                ),
                                SizedBox(height: 5.v),
                                Row(
                                    children:[
                                      Text('Expense Type:',style:TextStyle(fontWeight:FontWeight.w600)),
                                      SizedBox(width: 5.h),
                                      Text(
                                        controller.expenseViewList![index].expenseType.toString(),
                                      )
                                    ]
                                ),
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
                                Row(
                                    children:[
                                      Text('RePayment Status:',style:TextStyle(fontWeight:FontWeight.w600)),
                                      SizedBox(width: 5.h),
                                      Text(
                                        controller.expenseViewList![index].rePaymentStatus.toString(),
                                      )
                                    ]
                                ),

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
