// To parse this JSON data, do
//
//     final usuarioModel = usuarioModelFromJson(jsonString);

import 'dart:convert';

UsuarioModel usuarioModelFromJson(String str) => UsuarioModel.fromJson(json.decode(str));

String usuarioModelToJson(UsuarioModel data) => json.encode(data.toJson());

class UsuarioModel {
    String error;
    int id;
    String nombre;
    String usuario;
    String nombreCompleto;
    String correo;
    String photo;
    String token;
    String temp;
    int sistema;
    int idpropietario;

    UsuarioModel({
        this.error,
        this.id,
        this.nombre,
        this.nombreCompleto,
        this.usuario,
        this.correo,
        this.photo,
        this.token,
        this.temp,
        this.sistema,
        this.idpropietario,
    });

    factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        error           : json["error"],
        id              : int.parse(json["id"]),
        nombre          : json["nombre"],
        usuario         : json["usuario"],
        nombreCompleto  : json["nombreCompleto"],
        correo          : json["correo"],
        photo           : json["photo"],
        token           : json["token"],
        temp            : json["temp"],
        sistema         : int.parse(json["sistema"]),
        idpropietario   : int.parse(json["idpropietario"]),
    );

    Map<String, dynamic> toJson() => {
        "error"           : error,
        "id"              : id,
        "nombre"          : nombre,
        "nombreCompleto"  : nombreCompleto,
        "usuario"         : usuario,
        "correo"          : correo,
        "photo"           : photo,
        "token"           : token,
        "temp"            : temp,
        "sistema"         : sistema,
        "idpropietario"   : idpropietario,
    };
}
