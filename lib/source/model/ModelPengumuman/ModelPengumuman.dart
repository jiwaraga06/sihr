// To parse this JSON data, do
//
//     final modelPengumuman = modelPengumumanFromJson(jsonString);

import 'dart:convert';

ModelPengumuman modelPengumumanFromJson(String str) => ModelPengumuman.fromJson(json.decode(str));

String modelPengumumanToJson(ModelPengumuman data) => json.encode(data.toJson());

class ModelPengumuman {
    final String? message;
    final int? count;
    final List<Datum>? data;

    ModelPengumuman({
        this.message,
        this.count,
        this.data,
    });

    factory ModelPengumuman.fromJson(Map<String, dynamic> json) => ModelPengumuman(
        message: json["message"],
        count: json["count"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "count": count,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    final int? id;
    final String? namaJenis;
    final String? keterangan;
    final int? status;
    final int? isDelete;

    Datum({
        this.id,
        this.namaJenis,
        this.keterangan,
        this.status,
        this.isDelete,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        namaJenis: json["nama_jenis"] ?? "",
        keterangan: json["keterangan"] ?? "",
        status: json["status"],
        isDelete: json["is_delete"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama_jenis": namaJenis,
        "keterangan": keterangan,
        "status": status,
        "is_delete": isDelete,
    };
}
