

import 'dart:async';

import 'package:midesarrollo/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  //final _urlController = BehaviorSubject<String>();


  Stream<bool> get formValidStream => CombineLatestStream.combine2(emailStream, passwordStream, ( e, p ) => true);
  // Stream<bool> get formValidStream => CombineLatestStream.combine3(emailStream, passwordStream, urlStream, (e, p, u) => true);


  // Recuperar los datos del Stream

  Stream<String> get emailStream    => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);
  //Stream<String> get urlStream      => _urlController.stream.transform(validarUrl);



  Function(String) get changeEmail    => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  //Function(String) get changeUrl      => _urlController.sink.add;


  // Obtener el ultimi valor ingresado a los streams
  String get email    => _emailController.value;
  String get password => _passwordController.value;
  //String get url      => _urlController.value;


  dispose() {
    _emailController?.close();
    _passwordController?.close();
    //_urlController?.close();
  }


}