import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/controllers/notificacion_controller.dart';
import 'package:midesarrollo/src/helpers/colors.dart';
import 'package:midesarrollo/src/helpers/get_storage.dart';
import 'package:midesarrollo/src/helpers/iconos.dart';
import 'package:midesarrollo/src/models/notificacion_model.dart';
import 'package:midesarrollo/src/widgets/Scaffold/scaffold_template_widget.dart';

class NotificacionContenido extends StatelessWidget {
  final NotificacionModel notificacion =
      Get.find<NotificacionController>().notificacion;

  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplateWidget(
      leading: Icons.arrow_back,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Iconos.nombre(
                        nombre: notificacion.icono,
                        size: 100.0,
                        color: CustomColors.iconColor,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      "Hola ${GetStorages.instance.nombreCompleto}",
                      style: TextStyle(fontSize: 15.0),
                    )
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 50.0),
                  child: Text(
                    "${notificacion.descripcion}",
                    textAlign: TextAlign.center,
                  )),
              notificacion.pagina.isNotEmpty
                  ? RaisedButton(
                      onPressed: () => print(notificacion.pagina),
                      child: Container(
                        child: Text('Ir a la página'),
                        padding: EdgeInsets.symmetric(
                            horizontal: 80.0, vertical: 15.0),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      elevation: 0.0,
                      color: CustomColors.primaryColor,
                      textColor: Colors.white,
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
