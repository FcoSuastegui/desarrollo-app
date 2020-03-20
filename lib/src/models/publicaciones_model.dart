// To parse this JSON data, do
//
//     final publicacionesModel = publicacionesModelFromJson(jsonString);

import 'dart:convert';

PublicacionesModel publicacionesModelFromJson(String str) => PublicacionesModel.fromJson(json.decode(str));

String publicacionesModelToJson(PublicacionesModel data) => json.encode(data.toJson());

class PublicacionesModel {
    String titulo;
    String usuario;
    String tipo;
    String fechaPublicacion;
    String mensaje;
    dynamic documento;
    String media;
    String medianame;
    String tipomedia;

    PublicacionesModel({
        this.titulo,
        this.usuario,
        this.tipo,
        this.fechaPublicacion,
        this.mensaje,
        this.documento,
        this.media,
        this.medianame,
        this.tipomedia,
    });

    factory PublicacionesModel.fromJson(Map<String, dynamic> json) => PublicacionesModel(
        titulo           : json["titulo"]?? '',
        usuario          : json["usuario"]?? '',
        tipo             : json["tipo"]?? '',
        fechaPublicacion : json["fecha_publicacion"]?? '',
        mensaje          : json["mensaje"]?? '',
        documento        : json["documento"]?? '',
        media            : json["media"]?? '',
        medianame        : json["medianame"]?? '',
        tipomedia        : json["tipomedia"]?? '',
    );

    Map<String, dynamic> toJson() => {
        "titulo"            : titulo,
        "usuario"           : usuario,
        "tipo"              : tipo,
        "fecha_publicacion" : fechaPublicacion,
        "mensaje"           : mensaje,
        "documento"         : documento,
        "media"             : media,
        "medianame"         : medianame,
        "tipomedia"         : tipomedia,
    };
}