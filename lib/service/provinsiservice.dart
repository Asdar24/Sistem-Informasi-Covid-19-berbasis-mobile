import 'package:flutter/material.dart';
import 'package:project/models/indonesia.dart';
import 'package:project/models/provinsi.dart';
import 'package:http/http.dart' as http;
import 'package:project/models/provinsilengkap.dart';

class ProvinsiService {
  static final String _baseUrl =
      'https://apicovid19indonesia-v2.vercel.app/api/indonesia/provinsi';

  Future getProvinsi() async {
    Uri urlApi = Uri.parse(_baseUrl);

    final response = await http.get(urlApi);
    if (response.statusCode == 200) {
      return provinsiFromJson(response.body.toString());
    } else {
      throw Exception("Failed to load data Corona Provinsi");
    }
  }
}

class ProvinsiUpdateService {
  static final String _baseUrl =
      'https://apicovid19indonesia-v2.vercel.app/api/indonesia/provinsi/more';

  Future getProvinsiUpdate() async {
    Uri urlApi = Uri.parse(_baseUrl);

    final response = await http.get(urlApi);
    if (response.statusCode == 200) {
      return provlengkapFromJson(response.body.toString());
    } else {
      throw Exception("Failed to load data Corona Provinsi");
    }
  }
}

class IndonesiaService {
  static final String _baseUrl =
      'https://apicovid19indonesia-v2.vercel.app/api/indonesia/more';

  Future getIndonesiaService() async {
    Uri urlApi = Uri.parse(_baseUrl);

    final response = await http.get(urlApi);
    if (response.statusCode == 200) {
      return indonesiaFromJson(response.body.toString());
    } else {
      throw Exception("Failed to load data Corona Indonesia");
    }
  }
}
