import 'package:flutter/material.dart';

import '../AppConfig/StringConstant.dart';
import '../core/app_export.dart';
import '../routes/app_routes.dart';

class AuthGuard extends GetMiddleware {
//   Get the auth service
  final userId = PrefUtils.getString(StringConstant.userId);

//   The default is 0 but you can update it to any number. Please ensure you match the priority based
//   on the number of guards you have.
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    // Navigate to login if client is not authenticated other wise continue
    if(userId=="")
      return RouteSettings(name: AppRoutes.initialRoute);
    else
      return RouteSettings(name: AppRoutes.homePage);
  }
}