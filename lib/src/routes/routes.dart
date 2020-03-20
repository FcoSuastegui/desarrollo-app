import 'package:flutter/material.dart';
import 'package:midesarrollo/src/pages/publicaciones_page.dart';
//import 'package:midesarrollo/src/pages/bienvenido_page.dart';
import 'package:midesarrollo/src/pages/cuenta_page.dart';
import 'package:midesarrollo/src/pages/documentacion_page.dart';
import 'package:midesarrollo/src/pages/encuesta_page.dart';
import 'package:midesarrollo/src/pages/escrituras_page.dart';
import 'package:midesarrollo/src/pages/inicio_page.dart';
import 'package:midesarrollo/src/pages/login_page.dart';
import 'package:midesarrollo/src/pages/onboarding_page.dart';
import 'package:midesarrollo/src/pages/perfil_page.dart';
import 'package:midesarrollo/src/pages/saldos_page.dart';

final routes = {
/*     BienvenidoPage.routeName        : ( BuildContext context ) => BienvenidoPage(),*/    
    OnBoardingPage.routeName        : ( BuildContext context ) => OnBoardingPage(), 
    LoginPage.routeName             : ( BuildContext context ) => LoginPage(),
    InicioPage.routeName            : ( BuildContext context ) => InicioPage(),
    PerfilPage.routeName            : ( BuildContext context ) => PerfilPage(),
    PublicacionesPage.routeName     : ( BuildContext context ) => PublicacionesPage(),
    SaldosPage.routeName            : ( BuildContext context ) => SaldosPage(),
    EstadoCuentaPage.routeName      : ( BuildContext context ) => EstadoCuentaPage(),
    EncuestaPage.routeName          : ( BuildContext context ) => EncuestaPage(),
    EscriturasPage.routeName        : ( BuildContext context ) => EscriturasPage(),
    DocumentacionPage.routeName     : ( BuildContext context ) => DocumentacionPage(),
};