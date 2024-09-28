import '../../../core/app_export.dart';
import '../controller/solved_controller.dart';


/// A binding class for the LoginOneScreen.
///
/// This class ensures that the LoginOneController is created when the
/// LoginOneScreen is first loaded.
class SolvedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SolvedController());
  }
}
