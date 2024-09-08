import '../../../core/app_export.dart';
import '../controller/add_expense_controller.dart';

/// A binding class for the SignUpTwoScreen.
///
/// This class ensures that the SignUpTwoController is created when the
/// SignUpTwoScreen is first loaded.
class AddExpenseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddExpenseController());
  }
}
