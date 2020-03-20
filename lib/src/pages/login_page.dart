import 'dart:async';

import 'package:flutter/material.dart';
import 'package:midesarrollo/src/bloc/provider.dart';
import 'package:midesarrollo/src/preferences/preferences.dart';
import 'package:midesarrollo/src/providers/login_provider.dart';

class LoginPage extends StatefulWidget {
  
  static final String routeName = 'login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _acceso = new LoginProvider();
  final _prefs = new Preferencias();

  Timer _timer;



  String textQa     = 'http://qa.midesarrollo.com.mx';
  String textErp    = 'https://erp.midesarrollo.com.mx';
  String textError  = '';

  bool isSwitched = false;
  bool isLoading  = false;
  bool isvisible  = false;


  @override
  void initState() {
    super.initState();
  }
  
  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            _crearFondo( context ),
            _loginForm(context)
          ],
        )
    );
  }

  Widget _crearFondo( BuildContext context ) {

    final size = MediaQuery.of(context).size;

    final fondoTeal = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color> [
            Color.fromRGBO(0, 139, 125, 1.0),
            Color.fromRGBO(0, 139, 125, 1.0)
          ]
        )
      ),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );

    final icono = Container(
      padding: EdgeInsets.only(top: 50.0),
      child: Column(
        children: <Widget>[
          Icon( Icons.store, color: Colors.white, size: 80.0),
          SizedBox( height: 10.0, width: double.infinity),
          Text('Mi desarrollo', style: TextStyle( color: Colors.white, fontSize: 25.0))
        ],
      ),
    );

    return Stack(
      children: <Widget>[
        fondoTeal,
        Positioned(top: 90.0, left: 30.0, child: circulo),
        Positioned(top: -40.0, right: -30.0, child: circulo),
        Positioned(bottom: -50.0, right: -10.0, child: circulo),
        Positioned(bottom: 120.0, right: 20.0, child: circulo),
        Positioned(bottom: -50.0, left: -20.0, child: circulo),
        icono
      ],
    );

  }

  Widget _loginForm(BuildContext context){

    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 110.0,
            ),
          ),
          Container(
            width: size.width * 0.80,
            padding: EdgeInsets.symmetric( vertical: 25.0),
            margin: EdgeInsets.symmetric( vertical: 50.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow> [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset( 0.0, 5.0),
                  spreadRadius: 3.0
                )
              ]
            ),
            child: Column(
              children: <Widget>[
                Text('Ingresar', style: TextStyle(fontSize: 20.0),),
                SizedBox(height: 20.0,),
                _email( bloc ),
                SizedBox(height: 20.0,),
                _password( bloc ),
                SizedBox(height: 10.0,),
                _switchUrl(),
                SizedBox(height: 5.0,),
                _mensajeError(),
                SizedBox(height: 20.0,),
                _boton( bloc )
              ],
            ),
          ),
          Text( '¿Olvido su contraseña?', style: TextStyle( color: Colors.teal),),
          SizedBox(height: 100.0,)
        ],
      ),
    
    );
  }

  Widget _switchUrl() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(26.0),
          alignment: Alignment.bottomLeft,
          child: Text('Habilitar url de prueba', style: TextStyle( color: Colors.teal, fontSize: 15.0)),
        ),
        Positioned(
          left: 220.0,
          top: 10.0,
          child: Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
                isSwitched ? _prefs.url =  textQa: _prefs.url = textErp;
              });
            },
            activeTrackColor: Colors.teal,
            activeColor: Colors.teal,
          ),
        ),
      ],
    );
  }

  Widget _email ( LoginBloc bloc ) {
    return StreamBuilder(
      stream: bloc.emailStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container( 
          padding: EdgeInsets.symmetric( horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              counterStyle: TextStyle(color: Colors.teal),
              icon: Icon( Icons.alternate_email, color: Colors.teal),
              hintText: 'correo@gmail.com',
              labelText: 'Correo electrónico',
              counterText: snapshot.data,
              errorText: snapshot.error
            ),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _password ( LoginBloc bloc ) {
    return StreamBuilder(
      stream: bloc.passwordStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container( 
            padding: EdgeInsets.symmetric( horizontal: 20.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon( Icons.lock_outline, color: Colors.teal),
                labelText: 'Contraseña',
                errorText: snapshot.error
              ),
              onChanged: bloc.changePassword,
            )
          );
      },
    );
  }

  Widget _boton (LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.formValidStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric( horizontal: 80.0, vertical: 15.0), 
            child: !isLoading ? Text('Acceder') : CircularProgressIndicator( backgroundColor: Colors.white),
            ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          elevation: 0.0,
          color: Colors.teal,
          textColor: Colors.white,
          onPressed: snapshot.hasData ? () => login( context, bloc): null,
        );
      },
    ); 
  }

  login (BuildContext context, LoginBloc bloc) async {
      setState(() {
        isLoading = !isLoading;
        isvisible = !isvisible;
        textError = '';
      });
    
      final info = await _acceso.login(bloc.email, bloc.password);

      if( info['status'] ){

        final inicio = _prefs.onboarding == 0 ? 'onboarding' : 'inicio';
        Navigator.pushReplacementNamed(context, inicio);
      
      } else {

        setState(() {
          textError = info['mensaje'];
          isLoading = !isLoading;
        });

        _timer = Timer( Duration(milliseconds: 2500 ), () {
          setState(() {
            isvisible = !isvisible;
          });
        });

      } 
  }

  Widget _mensajeError() {
    return AnimatedOpacity( 
      opacity: isvisible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 500),
      child: Container( 
        child: Text(textError, style: TextStyle( color: Colors.red), textAlign: TextAlign.center, ),
        width: 240.0,
      ),
    );
  }
}