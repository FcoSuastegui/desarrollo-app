import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/controllers/perfil_controller.dart';
import 'package:midesarrollo/src/helpers/get_storage.dart';
import 'package:midesarrollo/src/widgets/Buttons/back_button.dart';
import 'package:midesarrollo/src/widgets/NoInformation/no_information.dart';

class PerfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    Colors.teal[900],
                    Colors.teal[800],
                    Colors.teal[400]
                  ],
                ),
              ),
              child: Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 40.0, left: 10.0),
                child: BackButtonWidget(icon: Icons.arrow_back),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 80.0, 10.0, 16.0),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16.0),
                        margin: EdgeInsets.only(top: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3.0,
                              color: Colors.grey[400],
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 96.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    GetStorages.instance.nombreCompleto,
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                  ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    title:
                                        Text(GetStorages.instance.tipoUsuario),
                                    subtitle: Text(GetStorages.instance.correo),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              GetStorages.instance.avatar,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        margin: EdgeInsets.only(left: 16.0),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3.0,
                          color: Colors.grey[400],
                        ),
                      ],
                    ),
                    child: GetBuilder<PerfilController>(
                      init: PerfilController(),
                      builder: (_) => Obx(
                        () => _.loading.value
                            ? Center(child: CircularProgressIndicator())
                            : _contenidoGeneral(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ));
  }

  Widget _contenidoGeneral() {
    final controller = Get.find<PerfilController>();
    final perfil = controller.perfil;

    return perfil == null
        ? NoInformationWidget(onPress: controller.cargarPerfil)
        : Column(
            children: <Widget>[
              ListTile(
                title: Text("Información personal"),
              ),
              Divider(),
              ListTile(
                title: Text("Nombre completo"),
                subtitle: Text(perfil.nombre),
              ),
              ListTile(
                title: Text("Usuario"),
                subtitle: Text(perfil.usuario),
              ),
              ListTile(
                title: Text("Correo"),
                subtitle: Text(perfil.correo),
              ),
              ListTile(
                title: Text("RFC"),
                subtitle: Text(perfil.rfc),
              ),
              ListTile(
                title: Text("NSS"),
                subtitle: Text(perfil.nss),
              ),
              ListTile(
                title: Text("Número de credito"),
                subtitle: Text(perfil.numCredito),
              ),
            ],
          );
  }
}
