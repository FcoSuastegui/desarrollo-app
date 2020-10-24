import 'package:midesarrollo/app/src/data/models/tickets_model.dart';
import 'package:midesarrollo/app/src/data/services/ticket_service.dart';
import 'package:midesarrollo/app/src/helpers/get_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class TicketController extends GetxController {
  TicketController._internal();
  static TicketController _instance = TicketController._internal();
  static TicketController get instance => _instance;

  RxList<TicketsModel> _tickets = List<TicketsModel>().obs;
  RxList<TicketsModel> get tickets => _tickets;

  RxBool _loading = false.obs;
  bool get loading => _loading.value;

  RxList<String> _catalogoItems = List<String>().obs;
  // ignore: invalid_use_of_protected_member
  List<String> get catalogoItems => _catalogoItems.value;

  List<CatalogoTicketModel> _catalogoTicket = List<CatalogoTicketModel>();
  CatalogoTicketModel catalogoSeleccionado;

  File _image;
  File get image => _image;

  ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    listarTickets();
    super.onInit();
  }

  Future<void> listarTickets() async {
    _loading(true);
    final response = await TicketService.inst.tickets(
      idpropietario: GetStorages.inst.idpropietario,
      sistema: GetStorages.inst.sistema,
    );
    _tickets.value = [];
    if (response.status) {
      response.data.forEach(
        (item) => _tickets.add(TicketsModel.fromJson(item)),
      );
    }
    _image = null;
    _loading(false);
  }

  Future<void> obtenerCatalogoTicket() async {
    final response = await TicketService.inst.catalogoTicket(
      idpropietario: GetStorages.inst.idpropietario,
      sistema: GetStorages.inst.sistema,
    );

    _catalogoItems.value = [];
    _catalogoTicket = [];
    if (response.status) {
      response.data.forEach((item) {
        _catalogoItems.add(item['nombre']);
        _catalogoTicket.add(CatalogoTicketModel.fromJson(item));
      });
    }
  }

  void seleccionarCatalogo(String catalogo) {
    catalogoSeleccionado = _catalogoTicket.firstWhere(
      (e) => e.texto == catalogo,
    );
  }

  Future<void> openGallery() async {
    final picture = await _picker.getImage(
      source: ImageSource.gallery,
      maxHeight: 500,
      maxWidth: 640,
    );
    _image = picture != null ? File(picture.path) : null;
    if (picture != null) Get.back();
    update(['image']);
  }

  Future<void> openCamara() async {
    final picture = await _picker.getImage(
      source: ImageSource.camera,
      maxHeight: 500,
      maxWidth: 640,
    );
    _image = picture != null ? File(picture.path) : null;
    if (picture != null) Get.back();
    update(['image']);
  }

  void deleteImage() {
    _image = null;
    update(['image']);
  }
}
