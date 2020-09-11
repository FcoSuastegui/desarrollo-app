import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/controllers/root_controller.dart';
import 'package:midesarrollo/src/helpers/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorages.instance.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RootController>(
      init: RootController.instance,
      builder: (_) => GetMaterialApp(
        title: _.title,
        debugShowCheckedModeBanner: _.debugShowCheckedModeBanner,
        initialRoute: _.route,
        defaultTransition: _.defaultTransition,
        getPages: _.routes,
        locale: _.locale,
        theme: _.theme,
        localizationsDelegates: _.localizationsDelegates,
        localeResolutionCallback: (deviceLocale, supporteLocate) =>
            supporteLocate.first,
        supportedLocales: _.supportedLocales,
      ),
    );
  }
}
