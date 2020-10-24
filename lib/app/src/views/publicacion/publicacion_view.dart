import 'package:midesarrollo/app/src/views/publicacion/components/publicacion_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/app/src/widgets/Appbars/app_bar_default.dart';
import 'package:midesarrollo/app/src/views/publicacion/controller/publicacion_controller.dart';

class PublicacionView extends GetView<Publicacioncontroller> {
  static final String routeName = '/publicacion';
  const PublicacionView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        title: Text("Publicaciones"),
      ),
      body: Obx(
        () => controller.loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : PublicacionContent(),
      ),
    );
  }
}
