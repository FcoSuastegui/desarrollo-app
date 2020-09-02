import 'dart:convert';

AsambleaModel asambleaModelFromJson(String str) => AsambleaModel.fromJson(json.decode(str));
String asambleaModelToJson(AsambleaModel data) => json.encode(data.toJson());

class AsambleaModel {
  int id;
  String titulo;
  String fecha;
  String desarrollo;
  String mensaje;
  bool status;

  AsambleaModel({
    this.id,
    this.titulo,
    this.fecha,
    this.desarrollo,
    this.mensaje,
    this.status
  });

  factory AsambleaModel.fromJson(Map<String, dynamic> json) => AsambleaModel(
      id          : json["id"],
      titulo      : json["titulo"],
      fecha       : json["fecha"],
      desarrollo  : json["desarrollo"],
      mensaje     : json["mensaje"],
      status      : json["status"] 
  );

  Map<String, dynamic> toJson() => {
      "id"          : id,
      "titulo"      : titulo,
      "fecha"       : fecha,
      "desarrollo"  : desarrollo,
      "mensaje"     : mensaje,
      "status"      : status
  };
}