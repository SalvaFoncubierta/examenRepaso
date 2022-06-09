import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class FlagModel extends ChangeNotifier {
  List countriesList = [];
  List flags2 = [];

  Future<List> getFlags() async {
    final response =
        await http.get(Uri.parse('https://restcountries.com/v3.1/lang/spa'));

    List<String> europeanFlags = [];
    if (response.statusCode == 200) {
      // Se parsea el JSON.
      var data = jsonDecode(response.body);
      await getAllData(europeanFlags, data);
    } else {
      throw Exception('Error al cargar la información');
    }
    return europeanFlags;
  }

  Future<List> getAllData(List flags, List data) async {
    for (var element in data) {
      flags.add(element['flags']['png']);
      countriesList.add(element['name']['common']);
    }

    return flags;
  }
}
