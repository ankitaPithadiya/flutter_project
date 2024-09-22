import 'dart:io';

import 'package:ananta/routes/app_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'AppConfig/StringConstant.dart';
import 'core/app_export.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(await setHivePath());
  await PrefUtils.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp());
  });




}

Future<String> setHivePath() async {
  if (Platform.isIOS) {
    Directory iOSDirectoryPath = await getApplicationSupportDirectory();
    await PrefUtils.setString(StringConstant.tempDir, iOSDirectoryPath.path);
    return iOSDirectoryPath.path;
  } else {
    List<Directory>? tempDirectory;
    tempDirectory = await getExternalCacheDirectories();
    await PrefUtils.setString(
        StringConstant.tempDir, tempDirectory!.first.path);
    return tempDirectory.first.path;
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        translations: AppLocalization(),
        locale: Get.deviceLocale,
        fallbackLocale: Locale('en', 'US'),
        title: 'Ananta',
        initialRoute: AppRoutes.initialRoute,
        getPages: AppRoutes.pages,

      );
    });
  }
}
