import 'package:shared_preferences/shared_preferences.dart';

class Preferencias {

  static final Preferencias _instancia  = new Preferencias._internal();

  factory Preferencias() {
    return _instancia;
  }
  
  Preferencias._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  clear() async {
    await this._prefs.clear();
  }

  validarToken() {
    if( token != '') 
      return pagina;
    else
      return 'login';
  }

  get token {
    return _prefs.getString('token') ?? '';
  }

  set token( String valor) {
    _prefs.setString('token', valor);
  }

  get url {
    return _prefs.getString('url') ?? 'https://erp.midesarrollo.com.mx';
  }

  set url (String valor) {
    _prefs.setString('url', valor);
  }

  get server {
    return _prefs.getString('server') ?? url + '/server/api/';
  }

  set server (String valor) {
    _prefs.setString('server', valor);
  }

  

  get tokenFireBase {
    return _prefs.getString('tokenFireBase') ?? '';
  }

  set tokenFireBase( String valor) {
    _prefs.setString('tokenFireBase', valor);
  }

  get notificationCount {
    return _prefs.getInt('notificationCount') ?? 0;
  }

  set notificationCount( int valor) {
    _prefs.setInt('notificationCount', valor);
  }

  get pagina {
    return _prefs.getString('pagina') ?? 'inicio';
  }

  set pagina( String valor) {
    _prefs.setString('pagina', valor);
  }
  get onboarding {
    return _prefs.getInt('onboarding') ?? 0;
  }

  set onboarding( int valor) {
    _prefs.setInt('onboarding', valor);
  }

  get idusuario {
    return _prefs.getString('idusuario') ?? 0;
  }

  set idusuario( String valor) {
    _prefs.setString('idusuario', valor);
  }

  get idpropietario {
    return _prefs.getString('idpropietario') ?? 0;
  }

  set idpropietario( String valor) {
    _prefs.setString('idpropietario', valor);
  }
  get sistema {
    return _prefs.getString('sistema') ?? 0;
  }

  set sistema( String valor) {
    _prefs.setString('sistema', valor);
  }

  get nombre {
    return _prefs.getString('nombre') ?? '';
  }

  set nombre( String valor) {
    _prefs.setString('nombre', valor);
  }

  get nombreCompleto {
    return _prefs.getString('nombreCompleto') ?? '';
  }

  set nombreCompleto( String valor) {
    _prefs.setString('nombreCompleto', valor);
  }

  get usuario {
    return _prefs.getString('usuario') ?? '';
  }

  set usuario( String valor) {
    _prefs.setString('usuario', valor);
  }

  get correo {
    return _prefs.getString('correo') ?? '';
  }

  set correo( String valor) {
    _prefs.setString('correo', valor);
  }

  get avatar {
    return  _prefs.getString('avatar') ?? url + '../site_media/assets/images/profile-image.png';
  }

  set avatar( String valor) {
    _prefs.setString('avatar', valor);
  }


}