// To parse this JSON data, do
//
//     final provlengkap = provlengkapFromJson(jsonString);

import 'dart:convert';

List<Provlengkap> provlengkapFromJson(String str) => List<Provlengkap>.from(
    json.decode(str).map((x) => Provlengkap.fromJson(x)));

String provlengkapToJson(List<Provlengkap> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Provlengkap {
  Provlengkap({
    required this.provinsi,
    required this.kasus,
    required this.dirawat,
    required this.sembuh,
    required this.meninggal,
    required this.lastDate,
    required this.jenisKelamin,
    required this.kelompokUmur,
    required this.penambahan,
    required this.lokasi,
  });

  String provinsi;
  int kasus;
  int dirawat;
  int sembuh;
  int meninggal;
  DateTime lastDate;
  JenisKelamin jenisKelamin;
  Map<String, int> kelompokUmur;
  Penambahan penambahan;
  Lokasi lokasi;

  factory Provlengkap.fromJson(Map<String, dynamic> json) => Provlengkap(
        provinsi: json["provinsi"],
        kasus: json["kasus"],
        dirawat: json["dirawat"],
        sembuh: json["sembuh"],
        meninggal: json["meninggal"],
        lastDate: DateTime.parse(json["last_date"]),
        jenisKelamin: JenisKelamin.fromJson(json["jenis_kelamin"]),
        kelompokUmur: Map.from(json["kelompok_umur"])
            .map((k, v) => MapEntry<String, int>(k, v)),
        penambahan: Penambahan.fromJson(json["penambahan"]),
        lokasi: Lokasi.fromJson(json["lokasi"]),
      );

  Map<String, dynamic> toJson() => {
        "provinsi": provinsi,
        "kasus": kasus,
        "dirawat": dirawat,
        "sembuh": sembuh,
        "meninggal": meninggal,
        "last_date":
            "${lastDate.year.toString().padLeft(4, '0')}-${lastDate.month.toString().padLeft(2, '0')}-${lastDate.day.toString().padLeft(2, '0')}",
        "jenis_kelamin": jenisKelamin.toJson(),
        "kelompok_umur": Map.from(kelompokUmur)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "penambahan": penambahan.toJson(),
        "lokasi": lokasi.toJson(),
      };
}

class JenisKelamin {
  JenisKelamin({
    required this.lakiLaki,
    required this.perempuan,
  });

  int lakiLaki;
  int perempuan;

  factory JenisKelamin.fromJson(Map<String, dynamic> json) => JenisKelamin(
        lakiLaki: json["laki-laki"],
        perempuan: json["perempuan"],
      );

  Map<String, dynamic> toJson() => {
        "laki-laki": lakiLaki,
        "perempuan": perempuan,
      };
}

class Lokasi {
  Lokasi({
    required this.lon,
    required this.lat,
  });

  double lon;
  double lat;

  factory Lokasi.fromJson(Map<String, dynamic> json) => Lokasi(
        lon: json["lon"].toDouble(),
        lat: json["lat"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };
}

class Penambahan {
  Penambahan({
    required this.positif,
    required this.sembuh,
    required this.meninggal,
  });

  int positif;
  int sembuh;
  int meninggal;

  factory Penambahan.fromJson(Map<String, dynamic> json) => Penambahan(
        positif: json["positif"],
        sembuh: json["sembuh"],
        meninggal: json["meninggal"],
      );

  Map<String, dynamic> toJson() => {
        "positif": positif,
        "sembuh": sembuh,
        "meninggal": meninggal,
      };
}
