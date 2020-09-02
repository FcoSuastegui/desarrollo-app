import 'dart:convert';

AccesosModel accesosModelFromJson(String str) => AccesosModel.fromJson(json.decode(str));
String accesosModelToJson(AccesosModel data) => json.encode(data.toJson());

class AccesosModel {
  AccesosModel({
    this.id,
    this.visitante,
    this.active,
    this.dia,
    this.hora
  });

  int id;
  String visitante;
  String dia;
  String hora;
  bool active;

  factory AccesosModel.fromJson(Map<String, dynamic> json) => AccesosModel(
      id        : int.parse(json["id"]),
      visitante : json["visitante"],
      active    : int.parse(json["active"]) == 1 ? true : false,
      dia       : json['dia'],
      hora      : json['hora']
  );

  Map<String, dynamic> toJson() => {
      "id"      : id,
      "title"   : visitante,
      "active"  : active,
      "dia"     : dia,
      "hora"    : hora
  };
}