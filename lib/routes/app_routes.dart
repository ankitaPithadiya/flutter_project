import '../core/app_export.dart';
import '../presentation/login/bindings/login_screen_binding.dart';
import '../presentation/login/login_screen.dart';
 // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AppRoutes {


  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [

    GetPage(
      name: initialRoute,
      page: () => LoginScreen(),
      bindings: [LoginScreenBinding()],
    )
  ];
}
