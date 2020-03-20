// To parse this JSON data, do
//
//     final escriturasModel = escriturasModelFromJson(jsonString);

import 'dart:convert';

EscriturasModel escriturasModelFromJson(String str) => EscriturasModel.fromJson(json.decode(str));

String escriturasModelToJson(EscriturasModel data) => json.encode(data.toJson());

class EscriturasModel {
    String noEscritura;
    dynamic fechaEscritura;
    dynamic fechaEntrega;
    String proceso;
    String notaria;
    String notario;
    String idpropietario;

    EscriturasModel({
        this.noEscritura,
        this.fechaEscritura,
        this.fechaEntrega,
        this.proceso,
        this.notaria,
        this.notario,
        this.idpropietario,
    });

    factory EscriturasModel.fromJson(Map<String, dynamic> json) => EscriturasModel(
        noEscritura: json["no_escritura"]?? '',
        fechaEscritura: json["fecha_escritura"]?? '',
        fechaEntrega: json["fecha_entrega"]?? '',
        proceso: json["proceso"]?? '',
        notaria: json["notaria"]?? '',
        notario: json["notario"]?? '',
        idpropietario: json["idpropietario"]?? '',
    );

    Map<String, dynamic> toJson() => {
        "no_escritura": noEscritura,
        "fecha_escritura": fechaEscritura,
        "fecha_entrega": fechaEntrega,
        "proceso": proceso,
        "notaria": notaria,
        "notario": notario,
        "idpropietario": idpropietario,
    };
}