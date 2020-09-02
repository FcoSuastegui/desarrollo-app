import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/controllers/acceso_controller.dart';
import 'package:midesarrollo/src/helpers/colors.dart';
import 'package:midesarrollo/src/helpers/get_storage.dart';
import 'package:midesarrollo/src/widgets/Scaffold/scaffold_template_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';

class AccesoContenido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccesoController>(
      builder: (_) {
        final String validarQr =
            "${GetStorages.instance.server}app/validarAcceso/${_.accesoSeleccionado.id}/${GetStorages.instance.idpropietario}";
        return ScaffoldTemplateWidget(
          title: 'Mi acceso',
          leading: Icons.arrow_back,
          actions: _.actionsContenido,
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 15, left: 20, right: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3.0,
                            color: CustomColors.primaryColor.withOpacity(.2),
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      height: 300.0,
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          child: RepaintBoundary(
                            key: _.globalKey,
                            child: QrImage(
                              backgroundColor: Colors.white,
                              data: validarQr,
                              version: QrVersions.auto,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 20, right: 5, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin:
                                    EdgeInsets.only(top: 5, left: 0, bottom: 0),
                                child: Text(
                                  "Condicones de uso:",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          //width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 2, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                    top: 10, left: 0, right: 25, bottom: 0),
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Acceso generado para el dia ${_.accesoSeleccionado.dia} \n" +
                                      "A la hora establecida ${_.accesoSeleccionado.hora} \n" +
                                      "No se requiere confirmacion de acceso\n",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
