import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
        debugShowCheckedModeBanner: false,
        initialRoute: _.route,
        defaultTransition: Transition.cupertino,
        getPages: _.routes,
        locale: Locale('es'),
        theme: _.theme,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (deviceLocale, supporteLocate) =>
            supporteLocate.first,
        supportedLocales: [
          const Locale('es'), // Español
          const Locale('en'), // English
        ],
      ),
    );
  }
}
