import 'dart:convert';

ModelIzin modelIzinFromJson(String str) => ModelIzin.fromJson(json.decode(str));

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
  final Jenisizin? jenisIzin;

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
    this.jenisIzin
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
        jenisIzin: Jenisizin.fromJson(json['jenisizin'])
      );
}

class Jenisizin {
  final int? id;
  final String? namaIzin;
  final String? keterangan;

  Jenisizin({
    this.id,
    this.namaIzin,
    this.keterangan,
  });

  factory Jenisizin.fromJson(Map<String, dynamic> json) => Jenisizin(
        id: json["id"],
        namaIzin: json["nama_izin"] ?? "",
        keterangan: json["keterangan"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_izin": namaIzin,
        "keterangan": keterangan,
      };
}
