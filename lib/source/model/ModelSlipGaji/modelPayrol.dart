import 'dart:convert';

ModelPayroll modelPayrollFromJson(String str) {
  final jsonData = json.decode(str);
  return ModelPayroll.fromJson(jsonData);
}

class ModelPayroll {
  List<Payroll>? payroll;
  List<Pendapatan>? pendapatan;
  List<Pendapatan>? potongan;

  ModelPayroll({
    this.payroll,
    this.pendapatan,
    this.potongan,
  });

  factory ModelPayroll.fromJson(Map<String, dynamic> json) => ModelPayroll(
        payroll: List<Payroll>.from(json["payroll"].map((x) => Payroll.fromJson(x))),
        pendapatan: List<Pendapatan>.from(json["pendapatan"].map((x) => Pendapatan.fromJson(x))),
        potongan: List<Pendapatan>.from(json["potongan"].map((x) => Pendapatan.fromJson(x))),
      );
}

class Payroll {
  int? id;
  int? idPegawai;
  String? noreff;
  String? bulan;
  String? catatan;
  int? tahun;
  int? pendapatan;
  int? potongan;
  Pegawai? pegawai;

  Payroll({
    this.id,
    this.idPegawai,
    this.noreff,
    this.bulan,
    this.tahun,
    this.pendapatan,
    this.potongan,
    this.pegawai,
    this.catatan
  });

  factory Payroll.fromJson(Map<String, dynamic> json) => Payroll(
        id: json["id"],
        idPegawai: json["id_pegawai"],
        noreff: json["noreff"],
        bulan: json["bulan"],
        tahun: json["tahun"],
        pendapatan: json["pendapatan"],
        potongan: json["potongan"],
        catatan: json["catatan"]  == null ? "" : json["catatan"],
        pegawai: Pegawai.fromJson(json["pegawai"]),
      );
}

class Pegawai {
  int? id;
  String? nip;
  String? noKtp;
  String? nama;
  String? tmptLahir;
  String? tglLahir;
  String? jenisKelamin;
  String? goldar;
  String? agama;
  String? alamat;
  String? desa;
  String? kecamatan;
  String? kota;
  String? propinsi;
  String? tglMasuk;
  String? tentangKamu;
  int? idGolongan;
  int? idJabatan;
  int? idDivisi;
  int? idDepartement;
  int? idUnit;
  int? idKepalaBagian;
  int? idBank;
  String? noRek;
  String? foto;
  String? hp;
  String? pendidikan;
  String? prodi;
  String? npwp;
  int? statusMenikah;
  int? statusKeluarga;
  String? tglResign;
  String? ketResign;
  int? statusResign;
  String? nomr;
  int? idUsers;
  int? jatahCuti;
  int? idProfesi;
  Divisi? divisi;
  Jabatan? jabatan;

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
    this.idKepalaBagian,
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
    this.idUsers,
    this.jatahCuti,
    this.idProfesi,
    this.divisi,
    this.jabatan,
  });

  factory Pegawai.fromJson(Map<String, dynamic> json) => Pegawai(
        id: json["id"],
        nip: json["nip"],
        noKtp: json["no_ktp"],
        nama: json["nama"],
        tmptLahir: json["tmpt_lahir"],
        tglLahir: json["tgl_lahir"],
        jenisKelamin: json["jenis_kelamin"],
        goldar: json["goldar"],
        agama: json["agama"],
        alamat: json["alamat"],
        desa: json["desa"],
        kecamatan: json["kecamatan"],
        kota: json["kota"],
        propinsi: json["propinsi"],
        tglMasuk: json["tgl_masuk"],
        tentangKamu: json["tentang_kamu"],
        idGolongan: json["id_golongan"],
        idJabatan: json["id_jabatan"],
        idDivisi: json["id_divisi"],
        idDepartement: json["id_departement"],
        idUnit: json["id_unit"],
        idKepalaBagian: json["id_kepala_bagian"],
        idBank: json["id_bank"],
        noRek: json["no_rek"],
        foto: json["foto"],
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
        idUsers: json["id_users"],
        jatahCuti: json["jatah_cuti"],
        idProfesi: json["id_profesi"],
        divisi: Divisi.fromJson(json["divisi"]),
        jabatan: Jabatan.fromJson(json["jabatan"]),
      );
}

class Divisi {
  int? id;
  String? namaDivisi;
  String? keterangan;

  Divisi({
    this.id,
    this.namaDivisi,
    this.keterangan,
  });

  factory Divisi.fromJson(Map<String, dynamic> json) => Divisi(
        id: json["id"],
        namaDivisi: json["nama_divisi"],
        keterangan: json["keterangan"],
      );
}

class Jabatan {
  int? id;
  String? kode;
  String? namaJabatan;
  String? keterangan;
  int? potonganTelat;

  Jabatan({
    this.id,
    this.kode,
    this.namaJabatan,
    this.keterangan,
    this.potonganTelat,
  });

  factory Jabatan.fromJson(Map<String, dynamic> json) => Jabatan(
        id: json["id"],
        kode: json["kode"],
        namaJabatan: json["nama_jabatan"],
        keterangan: json["keterangan"],
        potonganTelat: json["potongan_telat"],
      );
}

class Pendapatan {
  int? id;
  String? noreff;
  int? idKomponenGaji;
  int? nilai;
  KomponenGaji? komponenGaji;

  Pendapatan({
    this.id,
    this.noreff,
    this.idKomponenGaji,
    this.nilai,
    this.komponenGaji,
  });

  factory Pendapatan.fromJson(Map<String, dynamic> json) => Pendapatan(
        id: json["id"],
        noreff: json["noreff"],
        idKomponenGaji: json["id_komponen_gaji"],
        nilai: json["nilai"],
        komponenGaji: KomponenGaji.fromJson(json["komponen_gaji"]),
      );
}

class KomponenGaji {
  int? id;
  String? namaKomponen;
  String? faktor;
  String? tipe;
  String? keterangan;

  KomponenGaji({
    this.id,
    this.namaKomponen,
    this.faktor,
    this.tipe,
    this.keterangan,
  });

  factory KomponenGaji.fromJson(Map<String, dynamic> json) => KomponenGaji(
        id: json["id"],
        namaKomponen: json["nama_komponen"],
        faktor: json["faktor"],
        tipe: json["tipe"],
        keterangan: json["keterangan"],
      );
}
