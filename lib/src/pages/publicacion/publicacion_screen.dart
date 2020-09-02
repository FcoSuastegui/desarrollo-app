import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/controllers/publicacion_controller.dart';
import 'package:midesarrollo/src/helpers/get_storage.dart';
import 'package:midesarrollo/src/widgets/Cards/card_export.dart';
import 'package:midesarrollo/src/widgets/Cards/card_post_image.dart';
import 'package:midesarrollo/src/widgets/NoInformation/no_information.dart';
import 'package:midesarrollo/src/widgets/Scaffold/scaffold_template_widget.dart';

class PublicacionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplateWidget(
      title: 'Publicaciones',
      leading: Icons.arrow_back,
      body: Container(
        child: GetBuilder<PublicacionController>(
          init: PublicacionController.instance,
          builder: (_) => Obx(
            () => _.loading.value
                ? Center(child: CircularProgressIndicator())
                : _homeContent(),
          ),
        ),
      ),
    );
  }

  Widget _homeContent() {
    return Obx(
      () {
        final controller = Get.find<PublicacionController>();
        return controller.publicaciones.length > 0
            ? ListView(
                padding: EdgeInsets.only(top: 0.0),
                shrinkWrap: false,
                children: List.generate(controller.publicaciones.length,
                    (index) => _listarPublicaciones(index)),
              )
            : NoInformationWidget(onPress: controller.listarPublicaciones);
      },
    );
  }

  Widget _listarPublicaciones(int index) {
    GlobalKey keyPublicaciones = new GlobalKey(debugLabel: index.toString());
    final controller = Get.find<PublicacionController>();
    final publicacion = controller.publicaciones[index];

    return publicacion.tipoMedia == '1'
        ? RepaintBoundary(
            key: keyPublicaciones,
            child: CardPostImage(
              image: "${GetStorages.instance.url}/${publicacion.imagen}",
              avatar: "${GetStorages.instance.url}/${publicacion.avatar}",
              title: publicacion.titulo,
              subtitle: publicacion.desarrollo,
              date: publicacion.fechaPublicacion,
              content: publicacion.contenido,
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    child: Icon(Icons.favorite_border),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Icon(Icons.share),
                  ),
                  onTap: () async => await controller.captureAndSharePng(
                      key: keyPublicaciones),
                ),
              ],
            ))
        : RepaintBoundary(
            key: keyPublicaciones,
            child: CardPost(
              avatar: "${GetStorages.instance.url}/${publicacion.avatar}",
              title: publicacion.titulo,
              subtitle: publicacion.desarrollo,
              date: publicacion.fechaPublicacion,
              content: publicacion.contenido,
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    child: Icon(Icons.favorite_border),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Icon(Icons.share),
                  ),
                  onTap: () async => await controller.captureAndSharePng(
                      key: keyPublicaciones),
                ),
              ],
            ),
          );
  }
}
