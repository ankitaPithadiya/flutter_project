import 'package:ananta/presentation/homepage/bindings/home_screen_binding.dart';
import 'package:ananta/presentation/homepage/home_screen.dart';

import '../core/app_export.dart';
import '../presentation/add_expense/add_expense_screen.dart';
import '../presentation/add_expense/binding/add_expense_binding.dart';
import '../presentation/add_service/add_service_screen.dart';
import '../presentation/add_service/binding/add_service_binding.dart';
import '../presentation/login/bindings/login_screen_binding.dart';
import '../presentation/login/login_screen.dart';
// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String initialRoute = '/initialRoute';
  static const String homePage = '/homePage';
  static const String addExpense = '/addExpense';
  static const String addService = '/addService';

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => LoginScreen(),
      bindings: [LoginScreenBinding()],
    ),
    GetPage(
      name: homePage,
      page: () => HomeScreen(),
      bindings: [HomeScreenBinding()],
    ),
    GetPage(
      name: addExpense,
      page: () => AddExpenseScreen(),
      bindings: [AddExpenseBinding()],
    ),
    GetPage(
      name: addService,
      page: () => AddServiceScreen(),
      bindings: [AddServiceBinding()],
    ),
  ];
}
