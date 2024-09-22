import 'package:ananta/presentation/homepage/controller/home_controller.dart';

import '../../../core/app_export.dart';
import '../controller/expense_controller.dart';

/// A binding class for the LoginOneScreen.
///
/// This class ensures that the LoginOneController is created when the
/// LoginOneScreen is first loaded.
class ViewExpenseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExpenseViewController());
  }
}