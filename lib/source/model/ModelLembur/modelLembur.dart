// To parse this JSON data, do
//
//     final modelLembur = modelLemburFromJson(jsonString);

import 'dart:convert';

ModelLembur modelLemburFromJson(String str) => ModelLembur.fromJson(json.decode(str));

String modelLemburToJson(ModelLembur data) => json.encode(data.toJson());

class ModelLembur {
  final String? message;
  final int? count;
  final List<DataUser>? data;

  ModelLembur({
    this.message,
    this.count,
    this.data,
  });

  factory ModelLembur.fromJson(Map<String, dynamic> json) => ModelLembur(
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
  final DateTime? tanggal;
  final String? jamMulai;
  final String? jamSelesai;
  final String? jumlahJam;
  final String? keterangan;
  final dynamic noreff;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic createdBy;
  final String? updatedBy;
  final int? isDelete;
  final dynamic deletedAt;
  final dynamic deletedBy;
  final Pegawai? pegawai;

  DataUser({
    this.id,
    this.idPegawai,
    this.tanggal,
    this.jamMulai,
    this.jamSelesai,
    this.jumlahJam,
    this.keterangan,
    this.noreff,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.isDelete,
    this.deletedAt,
    this.deletedBy,
    this.pegawai,
  });

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
        id: json["id"],
        idPegawai: json["id_pegawai"],
        tanggal: json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        jamMulai: json["jam_mulai"],
        jamSelesai: json["jam_selesai"],
        jumlahJam: json["jumlah_jam"],
        keterangan: json["keterangan"] ?? "-",
        noreff: json["noreff"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        isDelete: json["is_delete"],
        deletedAt: json["deleted_at"],
        deletedBy: json["deleted_by"],
        pegawai: json["pegawai"] == null ? null : Pegawai.fromJson(json["pegawai"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_pegawai": idPegawai,
        "tanggal": "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "jam_mulai": jamMulai,
        "jam_selesai": jamSelesai,
        "jumlah_jam": jumlahJam,
        "keterangan": keterangan,
        "noreff": noreff,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "created_by": createdBy,
        "updated_by": updatedBy,
        "is_delete": isDelete,
        "deleted_at": deletedAt,
        "deleted_by": deletedBy,
        "pegawai": pegawai?.toJson(),
      };
}

class Pegawai {
  final int? id;
  final String? nip;
  final String? noKtp;
  final String? nama;
  final String? tmptLahir;
  final DateTime? tglLahir;
  final String? jenisKelamin;
  final String? goldar;
  final String? agama;
  final String? alamat;
  final String? desa;
  final String? kecamatan;
  final String? kota;
  final String? propinsi;
  final DateTime? tglMasuk;
  final String? tentangKamu;
  final int? idGolongan;
  final int? idJabatan;
  final int? idDivisi;
  final int? idDepartement;
  final int? idUnit;
  final int? idBank;
  final String? noRek;
  final String? foto;
  final String? hp;
  final String? pendidikan;
  final String? prodi;
  final String? npwp;
  final String? statusMenikah;
  final int? statusKeluarga;
  final dynamic tglResign;
  final dynamic ketResign;
  final int? statusResign;
  final String? nomr;
  final dynamic createdAt;
  final DateTime? updatedAt;
  final int? idUsers;
  final dynamic createdBy;
  final String? updatedBy;
  final int? isDelete;
  final dynamic deletedAt;
  final dynamic deletedBy;

  Pegawai({
    this.id,
    this.nip,
    this.noKtp,
    this.nama,
    this.tmptLahir,
    this.tglLahir,
    this.jenisKelamin,
    this.goldar,
    this.agama,
    this.alamat,
    this.desa,
    this.kecamatan,
    this.kota,
    this.propinsi,
    this.tglMasuk,
    this.tentangKamu,
    this.idGolongan,
    this.idJabatan,
    this.idDivisi,
    this.idDepartement,
    this.idUnit,
    this.idBank,
    this.noRek,
    this.foto,
    this.hp,
    this.pendidikan,
    this.prodi,
    this.npwp,
    this.statusMenikah,
    this.statusKeluarga,
    this.tglResign,
    this.ketResign,
    this.statusResign,
    this.nomr,
    this.createdAt,
    this.updatedAt,
    this.idUsers,
    this.createdBy,
    this.updatedBy,
    this.isDelete,
    this.deletedAt,
    this.deletedBy,
  });

  factory Pegawai.fromJson(Map<String, dynamic> json) => Pegawai(
        id: json["id"],
        nip: json["nip"] ?? "",
        noKtp: json["no_ktp"] ?? "",
        nama: json["nama"] ?? "",
        tmptLahir: json["tmpt_lahir"] ?? "",
        tglLahir: json["tgl_lahir"] == null ? null : DateTime.parse(json["tgl_lahir"]),
        jenisKelamin: json["jenis_kelamin"] ?? "",
        goldar: json["goldar"] ?? "",
        agama: json["agama"] ?? "",
        alamat: json["alamat"] ?? "",
        desa: json["desa"] ?? "",
        kecamatan: json["kecamatan"] ?? "",
        kota: json["kota"] ?? "",
        propinsi: json["propinsi"] ?? "",
        tglMasuk: json["tgl_masuk"] == null ? null : DateTime.parse(json["tgl_masuk"]),
        tentangKamu: json["tentang_kamu"] ?? "",
        idGolongan: json["id_golongan"] ?? 0,
        idJabatan: json["id_jabatan"] ?? 0,
        idDivisi: json["id_divisi"] ?? 0,
        idDepartement: json["id_departement"] ?? 0,
        idUnit: json["id_unit"] ?? 0,
        idBank: json["id_bank"] ?? 0,
        noRek: json["no_rek"] ?? 0,
        foto: json["foto"] ?? "",
        hp: json["hp"],
        pendidikan: json["pendidikan"],
        prodi: json["prodi"],
        npwp: json["npwp"],
        statusMenikah: json["status_menikah"],
        statusKeluarga: json["status_keluarga"],
        tglResign: json["tgl_resign"],
        ketResign: json["ket_resign"],
        statusResign: json["status_resign"],
        nomr: json["nomr"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        idUsers: json["id_users"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        isDelete: json["is_delete"],
        deletedAt: json["deleted_at"],
        deletedBy: json["deleted_by"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nip": nip,
        "no_ktp": noKtp,
        "nama": nama,
        "tmpt_lahir": tmptLahir,
        "tgl_lahir": "${tglLahir!.year.toString().padLeft(4, '0')}-${tglLahir!.month.toString().padLeft(2, '0')}-${tglLahir!.day.toString().padLeft(2, '0')}",
        "jenis_kelamin": jenisKelamin,
        "goldar": goldar,
        "agama": agama,
        "alamat": alamat,
        "desa": desa,
        "kecamatan": kecamatan,
        "kota": kota,
        "propinsi": propinsi,
        "tgl_masuk": "${tglMasuk!.year.toString().padLeft(4, '0')}-${tglMasuk!.month.toString().padLeft(2, '0')}-${tglMasuk!.day.toString().padLeft(2, '0')}",
        "tentang_kamu": tentangKamu,
        "id_golongan": idGolongan,
        "id_jabatan": idJabatan,
        "id_divisi": idDivisi,
        "id_departement": idDepartement,
        "id_unit": idUnit,
        "id_bank": idBank,
        "no_rek": noRek,
        "foto": foto,
        "hp": hp,
        "pendidikan": pendidikan,
        "prodi": prodi,
        "npwp": npwp,
        "status_menikah": statusMenikah,
        "status_keluarga": statusKeluarga,
        "tgl_resign": tglResign,
        "ket_resign": ketResign,
        "status_resign": statusResign,
        "nomr": nomr,
        "created_at": createdAt,
        "updated_at": updatedAt?.toIso8601String(),
        "id_users": idUsers,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "is_delete": isDelete,
        "deleted_at": deletedAt,
        "deleted_by": deletedBy,
      };
}
