import 'package:get/get.dart';
import 'package:midesarrollo/src/helpers/get_storage.dart';
import 'package:midesarrollo/src/widgets/Alerts/alert_actions.dart';

class SettingController extends GetxController {
  SettingController._internal();
  static SettingController _instance = SettingController._internal();
  static SettingController get instance => _instance;

  Future<void> logout() async {
    await Get.dialog(
      AlertAction(
        title: "¿Deseas salir de la aplicación?",
        onPress: () async {
          await GetStorages.instance.clear();
          GetStorages.instance.onboarding = 0;
          Get.offAllNamed('/');
        },
      ),
    );
  }
}
