// To parse this JSON data, do
//
//     final modelIzin = modelIzinFromJson(jsonString);

import 'dart:convert';

ModelIzin modelIzinFromJson(String str) => ModelIzin.fromJson(json.decode(str));

String modelIzinToJson(ModelIzin data) => json.encode(data.toJson());

class ModelIzin {
    final String? message;
    final int? count;
    final List<DataUser>? data;

    ModelIzin({
        this.message,
        this.count,
        this.data,
    });

    factory ModelIzin.fromJson(Map<String, dynamic> json) => ModelIzin(
        message: json["message"],
        count: json["count"],
        data: json["data"] == null ? [] : List<DataUser>.from(json["data"]!.map((x) => DataUser.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "count": count,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class DataUser {
    final int? id;
    final int? idPegawai;
    final dynamic idJenisIzin;
    final DateTime? tanggal;
    final String? alasan;
    final int? status;
    final String? keterangan;
    final int? userAcc;
    final DateTime? tglAcc;

    DataUser({
        this.id,
        this.idPegawai,
        this.idJenisIzin,
        this.tanggal,
        this.alasan,
        this.status,
        this.keterangan,
        this.userAcc,
        this.tglAcc,
    });

    factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
        id: json["id"],
        idPegawai: json["id_pegawai"],
        idJenisIzin: json["id_jenis_izin"],
        tanggal: json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        alasan: json["alasan"],
        status: json["status"],
        keterangan: json["keterangan"],
        userAcc: json["user_acc"],
        tglAcc: json["tgl_acc"] == null ? null : DateTime.parse(json["tgl_acc"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_pegawai": idPegawai,
        "id_jenis_izin": idJenisIzin,
        "tanggal": "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "alasan": alasan,
        "status": status,
        "keterangan": keterangan,
        "user_acc": userAcc,
        "tgl_acc": tglAcc?.toIso8601String(),
    };
}
