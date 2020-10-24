import 'package:midesarrollo/app/src/views/setting/components/setting_body.dart';
import 'package:midesarrollo/app/src/widgets/Appbars/app_bar_default.dart';
import 'package:flutter/material.dart';
class SettingView extends StatelessWidget {
  const SettingView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        title: Text("Configuracion"),
      ),
      body: SettingBody(),
    );
  }
}