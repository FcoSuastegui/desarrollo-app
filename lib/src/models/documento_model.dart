// To parse this JSON data, do
//
//     final documentoModel = documentoModelFromJson(jsonString);

import 'dart:convert';

DocumentoModel documentoModelFromJson(String str) => DocumentoModel.fromJson(json.decode(str));

String documentoModelToJson(DocumentoModel data) => json.encode(data.toJson());

class DocumentoModel {
    String ruta;
    String catalogo;

    DocumentoModel({
        this.ruta,
        this.catalogo,
    });

    factory DocumentoModel.fromJson(Map<String, dynamic> json) => DocumentoModel(
        ruta: json["ruta"],
        catalogo: json["catalogo"],
    );

    Map<String, dynamic> toJson() => {
        "ruta": ruta,
        "catalogo": catalogo,
    };
}
