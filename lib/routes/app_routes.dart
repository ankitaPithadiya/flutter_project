import 'package:ananta/presentation/homepage/bindings/home_screen_binding.dart';
import 'package:ananta/presentation/homepage/home_screen.dart';

import '../core/app_export.dart';
import '../middleware/authGard.dart';
import '../presentation/add_expense/add_expense_screen.dart';
import '../presentation/add_expense/binding/add_expense_binding.dart';
import '../presentation/add_service/add_service_screen.dart';
import '../presentation/add_service/binding/add_service_binding.dart';
import '../presentation/feedback/bindings/feedback_binding.dart';
import '../presentation/feedback/feedback_screen.dart';
import '../presentation/login/bindings/login_screen_binding.dart';
import '../presentation/login/login_screen.dart';
import '../presentation/not_solved/bindings/not_solved_binding.dart';
import '../presentation/not_solved/not_solved_screen.dart';
import '../presentation/solved/bindings/solved_binding.dart';
import '../presentation/solved/solved_screen.dart';
import '../presentation/solved_service_eng/bindings/solved_binding_eng.dart';
import '../presentation/solved_service_eng/solved_screen_eng_info.dart';
import '../presentation/view_expense/binding/view_expense_binding.dart';
import '../presentation/view_expense/view_expense_screen.dart';
// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String initialRoute = '/initialRoute';
  static const String homePage = '/homePage';
  static const String addExpense = '/addExpense';
  static const String addService = '/addService';
  static const String expenseList = '/expenseList';
  static const String notSolved = '/notSolved';
  static const String solved = '/solved';
  static const String solvedEng = '/solvedEng';
  static const String solvedFeedback = '/feedback';


  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => LoginScreen(),
      middlewares: [
        // Add here
        AuthGuard(),
      ],
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

    GetPage(
      name: expenseList,
      page: () => ViewExpenseScreen(),
      bindings: [ViewExpenseBinding()],
    ),
    GetPage(
      name: notSolved,
      page: () => NotSolvedScreen(),
      bindings: [NotSolvedBinding()],
    ),
    GetPage(
      name: solvedEng,
      page: () => SolvedEngScreen(),
      bindings: [SolvedEngBinding()],
    ),
    GetPage(
      name: solvedFeedback,
      page: () => FeedbackScreen(),
      bindings: [FeedbackBinding()],
    ),
    GetPage(
      name: solved,
      page: () => SolvedScreen(),
      bindings: [SolvedBinding()],
    ),
  ];
}
