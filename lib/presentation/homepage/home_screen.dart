import 'package:ananta/core/app_export.dart';
import 'package:ananta/presentation/homepage/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              title: const Text('Service Name'),
              subtitle: const Text('Service details'),
              children: controller.tile1List.map((index) => index).toList(),
            );
          }),
    );
  }
}
