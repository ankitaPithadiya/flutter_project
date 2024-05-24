import '../../../core/app_export.dart';
import '../controller/login_controller.dart';

/// A binding class for the LoginOneScreen.
///
/// This class ensures that the LoginOneController is created when the
/// LoginOneScreen is first loaded.
class LoginScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
