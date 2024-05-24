import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool _customTileExpanded = false;

  List<Widget> tile1List = List<Widget>.generate(
    10,
    (index) => Card(
      child: Container(
        width: double.infinity,
          padding: EdgeInsets.all(15),
          child: Column(
            children: List<Widget>.generate(
              5,
              (index) {
                return Text("Expense details");
              },
            ),
          )),
    ),
  );

  @override
  void onClose() {
    super.onClose();
  }
}
