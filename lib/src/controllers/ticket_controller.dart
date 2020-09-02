import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:midesarrollo/src/pages/ticket/ticket_time_line.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:midesarrollo/src/helpers/get_storage.dart';
import 'package:midesarrollo/src/helpers/network.dart';
import 'package:midesarrollo/src/models/tickets_model.dart';
import 'package:midesarrollo/src/pages/ticket/ticket_add.dart';
import 'package:midesarrollo/src/widgets/Alerts/alert_image_picker.dart';

class TicketController extends GetxController {
  TicketController._internal();
  static TicketController _instance = TicketController._internal();
  static TicketController get instance => _instance;

  RxList<TicketsModel> _tickets = List<TicketsModel>().obs;
  RxList<TicketsModel> get tickets => _tickets;

  RxBool _loading = false.obs;
  RxBool get loading => _loading;

  List<Widget> _actions;
  List<Widget> get actions => _actions;

  RxList<String> _catalogoItems = List<String>().obs;
  // ignore: invalid_use_of_protected_member
  List<String> get catalogoItems => _catalogoItems.value;

  List<CatalogoTicketModel> _catalogoTicket = List<CatalogoTicketModel>();
  CatalogoTicketModel catalogoSeleccionado;

  File _image;
  File get image => _image;
  
  ImagePicker _picker = ImagePicker();
  
  @override
  void onInit() async {
    listarTickets();
    _actions = [
      IconButton(
        icon: Icon(Icons.add_circle, color: Colors.white),
        onPressed: () async {
          _image = null;
          Get.to(TicketAdd());
          await obtenerCatalogoTicket();
        },
      ),
    ];
    super.onInit();
  }

  void toTimeline() => Get.to(TicketTimeLine());

  Future<void> listarTickets() async {
    _loading.value = true;

    final Response response = await Network.instance.post(
      'app/tickets',
      {
        'idpropietario': GetStorages.instance.idpropietario,
        'sistema': GetStorages.instance.sistema,
      },
    );

    if (response.statusCode == 200) {
      _tickets.value = [];
      response.data['data']
          .forEach((item) => _tickets.add(TicketsModel.fromJson(item)));
    }
    _loading.value = false;
  }

  Future<void> obtenerCatalogoTicket() async {
    final Response response = await Network.instance.post(
      "app/catalogosTickets",
      {
        'idpropietario': GetStorages.instance.idpropietario,
        'sistema': GetStorages.instance.sistema,
      },
    );

    _catalogoItems.value = [];
    _catalogoTicket = [];
    if (response.statusCode == 200) {
      response.data['data'].forEach((item) {
        _catalogoItems.add(item['nombre']);
        _catalogoTicket.add(CatalogoTicketModel.fromJson(item));
      });
    }
  }

  void seleccionarCatalogo(String catalogo) {
    catalogoSeleccionado =
        _catalogoTicket.firstWhere((e) => e.texto == catalogo);
  }

  Future<Map<String, dynamic>> addTicket(Map<String, dynamic> data) async {
    data['idpropietario'] = GetStorages.instance.idpropietario;
    data['file'] = image != null ? await MultipartFile.fromFile(image.path, filename: path.basename(image.path)) : '';

    final Response response =
        await Network.instance.postFormData('app/agregarTicket', data);
    Map<String, dynamic> respuesta = {'status': false, 'message': ''};

    if (response.statusCode == 200) {
      if (response.data['status']) {
        respuesta['status'] = true;
        respuesta['message'] = response.data['message'];
      } else {
        respuesta['message'] = 'Error al agregar un ticket, intente mas tarde';
      }
    } else {
      respuesta['message'] = 'Error al agregar un ticket, intente mas tarde';
    }

    listarTickets();

    return respuesta;
  }

  Future<void> showSelectDialog() async {
    Get.dialog(
      AlertImagePicker(
        onPressCamara: () async => await _openCamara(),
        onPressGalery: () async => await _openGallery(),
      )
    );
  }

  Future<void> _openGallery() async {
    final picture = await _picker.getImage(source: ImageSource.gallery, maxHeight: 500, maxWidth: 640);
    _image = picture != null ? File(picture.path) : null;
    if( picture != null ) Get.back();
    update(['image']);  
  }

  Future<void> _openCamara() async {
    final picture = await _picker.getImage(source: ImageSource.camera, maxHeight: 500, maxWidth: 640);
    _image = picture != null ? File(picture.path) : null;
    if( picture != null ) Get.back();
    update(['image']);  
  }




}
