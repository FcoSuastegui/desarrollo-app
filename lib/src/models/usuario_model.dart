// To parse this JSON data, do
//
//     final usuarioModel = usuarioModelFromJson(jsonString);

import 'dart:convert';

UsuarioModel usuarioModelFromJson(String str) => UsuarioModel.fromJson(json.decode(str));

String usuarioModelToJson(UsuarioModel data) => json.encode(data.toJson());

class UsuarioModel {
    String error;
    String id;
    String nombre;
    String usuario;
    String nombreCompleto;
    String correo;
    String photo;
    String token;
    String sistema;
    String idpropietario;

    UsuarioModel({
        this.error,
        this.id,
        this.nombre,
        this.nombreCompleto,
        this.usuario,
        this.correo,
        this.photo,
        this.token,
        this.sistema,
        this.idpropietario,
    });

    factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        error: json["error"],
        id: json["id"],
        nombre: json["nombre"],
        usuario: json["usuario"],
        nombreCompleto: json["nombreCompleto"],
        correo: json["correo"],
        photo: json["photo"],
        token: json["token"],
        sistema: json["sistema"],
        idpropietario: json["idpropietario"],
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "id": id,
        "nombre": nombre,
        "nombreCompleto": nombreCompleto,
        "usuario": usuario,
        "correo": correo,
        "photo": photo,
        "token": token,
        "sistema": sistema,
        "idpropietario": idpropietario,
    };
}
