import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/controllers/notificacion_controller.dart';
import 'package:midesarrollo/src/helpers/get_storage.dart';
import 'package:midesarrollo/src/helpers/network.dart';

class FirebaseNotificacionController extends GetxController {
  FirebaseNotificacionController._internal();
  static FirebaseNotificacionController _instance =
      FirebaseNotificacionController._internal();
  static FirebaseNotificacionController get instance => _instance;

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  NotificacionController _controller = NotificacionController.instance;
  
  Future<void> iniNotificacion() async {
    await sendToken();
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        _controller.listarNotificaciones();
        Platform.isIOS ? ios(message) : android(message['data']);
        print("onMessage: $message");
      },
      //onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
         _controller.listarNotificaciones();
        Platform.isIOS ? ios(message) : android(message['data']);
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
         _controller.listarNotificaciones();
        Platform.isIOS ? ios(message) : android(message['data']);
        print("onResume: $message");
      },
    );
    
  }

  Future<void> sendToken() async {
    final token = await _firebaseMessaging.getToken();
    await Network.instance.post("app/actualizarToken", {
      "idusuario"     : GetStorages.instance.idusuario,
      "tokenFireBase" : token
    });
    GetStorages.instance.tokenFireBase = token;
    print(token);
  }

  void ios( Map datos) {
    print("ios: $datos");
  }

  void android( Map datos) {
    print("android: $datos");
  }


}
