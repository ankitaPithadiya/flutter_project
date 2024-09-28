import '../../../core/app_export.dart';
import '../controller/not_solved_controller.dart';


/// A binding class for the LoginOneScreen.
///
/// This class ensures that the LoginOneController is created when the
/// LoginOneScreen is first loaded.
class NotSolvedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotSolvedController());
  }
}
