import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hadiah_bank/model/customer.dart';

class HomeController {
  Future<Map> getMenu() async {
    Map dataMenu;
    dataMenu = {
      "status": true,
      "menu": <Map>[
        {
          "cust": "Bintang Mandiri",
          "alamat": "Tengku Iskandar(Blang Bintang Lama)",
          "status": "Belum Diberikan",
          'noHp': '+6281360084071',
          'hadiah': [
            'TTOL-00A',
            'TTOL-00A',
            'TTOL-00A',
          ]
        },
        {
          "cust": "Bintang Mandiri",
          "alamat": "Tengku Iskandar(Blang Bintang Lama)",
          "status": "Belum Diberikan",
          'noHp': '+6281360084071',
          'hadiah': [
            'TTOL-00A',
            'TTOL-00A',
            'TTOL-00A',
          ]
        },
      ]
    };

    return dataMenu;
  }

  Future<Map> getnamaCust() async {
    Map data = {};

    var response = await Dio()
        .get("http://10.255.240.160/hadiah_bank_api/public/api/nama_cust");

    // data = response.data;

    var hasil = jsonDecode(response.data);

    print(hasil);

    data = {
      'status': true,
      'data': hasil
          .map<ModelsCustomer>((jsonnya) => ModelsCustomer.fromJson(jsonnya))
          .toList(),
    };

    // print(data);

    return data;
  }
}
