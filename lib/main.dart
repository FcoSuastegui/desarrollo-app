import 'package:midesarrollo/app/app.dart';
import 'package:midesarrollo/app/controller/firebase_controller.dart';
import 'package:midesarrollo/app/src/helpers/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorages.inst.init();
  await FireBaseController.inst.init();
  runApp(App());
}
