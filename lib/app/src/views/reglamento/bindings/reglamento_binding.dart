
import 'package:get/get.dart';
import 'package:midesarrollo/app/src/views/reglamento/controller/reglamento_controller.dart';

class ReglamentoBindig implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReglamentoController.instance);
  }
}