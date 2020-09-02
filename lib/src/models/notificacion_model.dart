import 'dart:convert';

NotificacionModel notificacionModelFromJson(String str) => NotificacionModel.fromJson(json.decode(str));

String notificacionModelToJson(NotificacionModel data) => json.encode(data.toJson());

class NotificacionModel {
  int id;
  String titulo;
  String descripcion;
  String icono;
  String pagina;
  bool status;

  NotificacionModel({
    this.id,
    this.titulo,
    this.descripcion,
    this.icono,
    this.pagina,
    this.status
  });

  factory NotificacionModel.fromJson(Map<String, dynamic> json) => NotificacionModel(
    id            : int.parse(json["id"]),
    titulo        : json["titulo"],
    descripcion   : json["descripcion"],
    icono         : json["icono"],
    pagina        : json["pagina"],
    status        : int.parse(json["status"]) == 1 ? true : false
  );

  Map<String, dynamic> toJson() => {
    "id"          : id,
    "titulo"      : titulo,
    "descripcion" : descripcion,
    "icono"       : icono,
    "pagina"      : pagina,
    "status"      : status
  };
}