import '../../../core/app_export.dart';
import '../controller/add_service_controller.dart';

/// A binding class for the SignUpTwoScreen.
///
/// This class ensures that the SignUpTwoController is created when the
/// SignUpTwoScreen is first loaded.
class AddServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddServiceController());
  }
}
