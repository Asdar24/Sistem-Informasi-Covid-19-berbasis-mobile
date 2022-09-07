// To parse this JSON data, do
//
//     final provinsi = provinsiFromJson(jsonString);

import 'dart:convert';

List<Provinsi> provinsiFromJson(String str) =>
    List<Provinsi>.from(json.decode(str).map((x) => Provinsi.fromJson(x)));

String provinsiToJson(List<Provinsi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Provinsi {
  Provinsi({
    required this.provinsi,
    required this.kasus,
    required this.dirawat,
    required this.sembuh,
    required this.meninggal,
  });

  String provinsi;
  int kasus;
  int dirawat;
  int sembuh;
  int meninggal;

  factory Provinsi.fromJson(Map<String, dynamic> json) => Provinsi(
        provinsi: json["provinsi"],
        kasus: json["kasus"],
        dirawat: json["dirawat"],
        sembuh: json["sembuh"],
        meninggal: json["meninggal"],
      );

  Map<String, dynamic> toJson() => {
        "provinsi": provinsi,
        "kasus": kasus,
        "dirawat": dirawat,
        "sembuh": sembuh,
        "meninggal": meninggal,
      };
}
