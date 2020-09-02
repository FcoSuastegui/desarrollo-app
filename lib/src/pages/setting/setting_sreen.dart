import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/controllers/setting_controller.dart';
import 'package:midesarrollo/src/helpers/get_storage.dart';
import 'package:midesarrollo/src/widgets/Linner/linnerContainer.dart';
import 'package:midesarrollo/src/widgets/ListTile/listTileCustom.dart';

class SettingSreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      init: SettingController.instance,
      builder: (_) => Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: Get.height * 0.1),
                  Padding(
                    padding: EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 0, left: 25, right: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Center(
                                child: Container(
                                  margin: EdgeInsets.only(right: 0, top: 0),
                                  padding: EdgeInsets.all(1.0),
                                  child: CircleAvatar(
                                    radius: 40.0,
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(
                                      GetStorages.instance.avatar,
                                    ),
                                  ),
                                  decoration: new BoxDecoration(
                                    color: Colors.white, // border color
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 6.0,
                                        color: Colors.white.withOpacity(.2),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsets.only(
                                            top: 0.0, left: 10.0),
                                        child: Text(
                                          GetStorages.instance.nombreCompleto,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsets.only(
                                            top: 10.0, left: 10.0),
                                        child: Text(
                                          GetStorages.instance.correo,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * 0.05),
                  Expanded(
                    child: Container(
                      width: Get.width,
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            ListTileCustom(
                              text: 'Mi perfil',
                              trailing: Icons.arrow_forward,
                              onPress: () => {},
                            ),
                            LinnerContainer(top: 5.0),
                            ListTileCustom(
                              text: 'Cambiar contraseña',
                              trailing: Icons.lock,
                              onPress: () => {},
                            ),
                            LinnerContainer(top: 5.0),
                            ListTileCustom(
                              text: 'Cerrar sesión',
                              trailing: Icons.exit_to_app,
                              onPress: _.logout,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
