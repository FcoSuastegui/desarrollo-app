
import 'dart:async';
class Validators {


  final validarPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: ( password, sink ) {
      if( password.length >= 1 ) 
        sink.add(password);
      else
        sink.addError('La contraseña debe se mas de 1 caracateres');
    }
  );

  final validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: ( email, sink ) {
      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = new RegExp(pattern);

      if( regExp.hasMatch(email))
        sink.add(email);
      else 
        sink.addError('El correo es electronico es incorrecto');
        
    }
  );

  final validarUrl = StreamTransformer<String, String>.fromHandlers(
    handleData: ( url, sink ){
      Pattern pattern = r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)';
      RegExp regExp = new RegExp(pattern);

      if( regExp.hasMatch(url) )
        sink.add(url);
      else
        sink.addError('El formato de la url es incorracta');

    }
  );





}

