
import 'package:flutter/material.dart';
import 'package:midesarrollo/src/preferences/preferences.dart';
import 'package:midesarrollo/src/utils/icons.dart';

class Menu extends StatelessWidget {
final _prefs = new Preferencias();
final iconos = new Iconos();

@override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            /* decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/mountains2.jpg'), fit: BoxFit.cover),
              ), */
            accountName: Text('${_prefs.nombreCompleto}', style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold)),
            accountEmail: Text('${ _prefs.correo}', style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold)),
            currentAccountPicture: CircleAvatar(
                radius: 30.0,
                backgroundImage:
                    NetworkImage('${_prefs.avatar}'),
                backgroundColor: Colors.transparent,
              ),
          ),
          ListTile(
            title: Text('Inicio'),
            leading: iconos.icono(icono: 'home', color: Colors.teal),
            onTap: () => navigation(context, 'inicio'),
          ),
          ListTile(
            title: Text('Mi perfil'),
            leading: iconos.icono(icono: 'person_outline', color: Colors.teal),
            onTap: () => navigation(context, 'perfil'),
          ),
          ListTile(
            title: Text('Avisos'),
            leading: iconos.icono(icono: 'announcement', color: Colors.teal), 
            onTap: () => navigation(context, 'avisos'),
          ),
          ListTile(
            title: Text('Saldos'),
            leading: iconos.icono(icono: 'attach_money', color: Colors.teal),
            onTap: () => navigation(context, 'saldos'),
          ),
          /* ListTile(
            title: Text('Estado de cuenta'),
            leading: iconos.icono(icono: 'assignment', color: Colors.teal),
            onTap: () => navigation(context, 'estado-cuenta'),
          ), 
          ListTile(
            title: Text('Encuesta'),
            leading: iconos.icono(icono: 'thumbs_up_down', color: Colors.teal),
            onTap: () => navigation(context, 'encuesta'),
          ), */
          ListTile(
            title: Text('Datos de escrituras'),
            leading: iconos.icono(icono: 'home', color: Colors.teal),
            onTap: () => navigation(context, 'escrituras'),
          ),
          ListTile(
            title: Text('Documentación'),
            leading: iconos.icono(icono: 'library_books', color: Colors.teal),
            onTap: () => navigation(context, 'documentacion'),
          ),
          ListTile(
            title: Text('Cerrar sesión'),
            leading: iconos.icono(icono: 'exit_to_app', color: Colors.teal),
            onTap: () {
                _prefs.clear();
                //_prefs.onboarding = 0;
                navigation(context, 'login');
              },
          ),
          Divider(),
          ListTile(
            title: Text('Versión 1.1.3 - 2020 ©', style: TextStyle(fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }

  navigation(BuildContext context, String ruta) {
       Navigator.pushReplacementNamed(context, ruta);
  }
  
}