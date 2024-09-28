import '../../../core/app_export.dart';
import '../controller/solved_controller_eng.dart';


/// A binding class for the LoginOneScreen.
///
/// This class ensures that the LoginOneController is created when the
/// LoginOneScreen is first loaded.
class SolvedEngBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SolvedEngController());
  }
}
