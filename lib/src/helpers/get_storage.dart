import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class GetStorages {

  GetStorages._internal();
  static GetStorages _instance = GetStorages._internal();
  static GetStorages get instance => _instance;
  
  GetStorage _storage = GetStorage();

  // Métodos 

  Future<void> init() async => await GetStorage.init();
  String validarToken () => !JwtDecoder.isExpired(token) ? pagina : '/';
  Future<void>clear() async => await _storage.erase();

  // Setter y getters de datos
  
  set url(String valor) => _storage.write('url', valor);
  String get url => _storage.read('url') ?? 'https://qa.midesarrollo.com.mx';

  set server(String valor) => _storage.write('server', valor);
  String get server => _storage.read('server') ?? url + '/server/api';

  set token(String valor) => _storage.write('token', valor);
  String get token => _storage.read('token') ?? '';
  
  set tokenFireBase(String valor) => _storage.write('tokenFireBase', valor);
  String get tokenFireBase => _storage.read('tokenFireBase') ?? '';

  set pagina(String valor) => _storage.write('pagina', valor);
  String get pagina => _storage.read('pagina') ?? '/';

  set onboarding(int valor) => _storage.write('onboarding', valor);
  int get onboarding => _storage.read('onboarding') ?? 1;

  set sistema(int valor) => _storage.write('sistema', valor);
  int get sistema => _storage.read('sistema') ?? 1;

  set idusuario(int valor) => _storage.write('idusuario', valor);
  int get idusuario => _storage.read('idusuario') ?? 0;
  
  set usuario(String valor) => _storage.write('usuario', valor);
  String get usuario => _storage.read('usuario') ?? '';
  
  set nombre(String valor) => _storage.write('nombre', valor);
  String get nombre => _storage.read('nombre');

  set temp(String valor) => _storage.write('temp', valor);
  String get temp => _storage.read('temp') ?? '';

 
  set idpropietario(int valor) => _storage.write('idpropietario', valor);
  int get idpropietario => _storage.read('idpropietario') ?? 1;
  
  set avatar(String valor) => _storage.write('avatar', url + '/' + valor);
  String get avatar => _storage.read('avatar') ?? url + '/../site_media/assets/images/profile-image.png';
  
  set nombreCompleto(String valor) => _storage.write('nombreCompleto', valor);
  String get nombreCompleto => _storage.read('nombreCompleto') ?? '';
  
  set correo(String valor) => _storage.write('correo', valor);
  String get correo => _storage.read('correo') ?? '';
  
  set tipoUsuario(String valor) => _storage.write('tipoUsuario', valor);
  String get tipoUsuario => _storage.read('tipoUsuario') ?? 'Propietario';




}