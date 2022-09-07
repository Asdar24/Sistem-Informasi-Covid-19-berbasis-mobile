// To parse this JSON data, do
//
//     final indonesia = indonesiaFromJson(jsonString);

import 'dart:convert';

Indonesia indonesiaFromJson(String str) => Indonesia.fromJson(json.decode(str));

String indonesiaToJson(Indonesia data) => json.encode(data.toJson());

class Indonesia {
  Indonesia({
    required this.total,
    required this.penambahan,
    required this.data,
  });

  Total total;
  Penambahan penambahan;
  Data data;

  factory Indonesia.fromJson(Map<String, dynamic> json) => Indonesia(
        total: Total.fromJson(json["total"]),
        penambahan: Penambahan.fromJson(json["penambahan"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "total": total.toJson(),
        "penambahan": penambahan.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.odp,
    required this.pdp,
    required this.totalSpesimen,
    required this.totalSpesimenNegatif,
  });

  int odp;
  int pdp;
  int totalSpesimen;
  int totalSpesimenNegatif;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        odp: json["odp"],
        pdp: json["pdp"],
        totalSpesimen: json["total_spesimen"],
        totalSpesimenNegatif: json["total_spesimen_negatif"],
      );

  Map<String, dynamic> toJson() => {
        "odp": odp,
        "pdp": pdp,
        "total_spesimen": totalSpesimen,
        "total_spesimen_negatif": totalSpesimenNegatif,
      };
}

class Penambahan {
  Penambahan({
    required this.positif,
    required this.dirawat,
    required this.sembuh,
    required this.meninggal,
    required this.tanggal,
    required this.created,
  });

  int positif;
  int dirawat;
  int sembuh;
  int meninggal;
  DateTime tanggal;
  DateTime created;

  factory Penambahan.fromJson(Map<String, dynamic> json) => Penambahan(
        positif: json["positif"],
        dirawat: json["dirawat"],
        sembuh: json["sembuh"],
        meninggal: json["meninggal"],
        tanggal: DateTime.parse(json["tanggal"]),
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "positif": positif,
        "dirawat": dirawat,
        "sembuh": sembuh,
        "meninggal": meninggal,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "created": created.toIso8601String(),
      };
}

class Total {
  Total({
    required this.positif,
    required this.dirawat,
    required this.sembuh,
    required this.meninggal,
    required this.lastUpdate,
  });

  int positif;
  int dirawat;
  int sembuh;
  int meninggal;
  DateTime lastUpdate;

  factory Total.fromJson(Map<String, dynamic> json) => Total(
        positif: json["positif"],
        dirawat: json["dirawat"],
        sembuh: json["sembuh"],
        meninggal: json["meninggal"],
        lastUpdate: DateTime.parse(json["lastUpdate"]),
      );

  Map<String, dynamic> toJson() => {
        "positif": positif,
        "dirawat": dirawat,
        "sembuh": sembuh,
        "meninggal": meninggal,
        "lastUpdate": lastUpdate.toIso8601String(),
      };
}
