// To parse this JSON data, do
//
//     final saldosModel = saldosModelFromJson(jsonString);

import 'dart:convert';

SaldosModel saldosModelFromJson(String str) => SaldosModel.fromJson(json.decode(str));

String saldosModelToJson(SaldosModel data) => json.encode(data.toJson());

class SaldosModel {
    String idpropietario;
    String saldo;
    String cuotaord;
    String cuotaext;

    SaldosModel({
        this.idpropietario,
        this.saldo,
        this.cuotaord,
        this.cuotaext,
    });

    factory SaldosModel.fromJson(Map<String, dynamic> json) => SaldosModel(
        idpropietario: json["idpropietario"],
        saldo: json["saldo"],
        cuotaord: json["cuotaord"],
        cuotaext: json["cuotaext"],
    );

    Map<String, dynamic> toJson() => {
        "idpropietario": idpropietario,
        "saldo": saldo,
        "cuotaord": cuotaord,
        "cuotaext": cuotaext,
    };
}
