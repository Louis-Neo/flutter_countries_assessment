import 'dart:convert';

import 'package:countries_info/models/countriesData.dart';
import 'package:http/http.dart' as http;

class Api {

  static const endPoint = 'https://restcountries.eu/rest/v2/region/africa';
  var client = http.Client();

  Future<List<Country>> getCountries() async {
    var countries = List<Country>();
    var response = await client.get('$endPoint');
    var parsed = json.decode(response.body) as List<dynamic>;

    for(var country in parsed){
      countries.add(Country.fromJson(country));
    }
    return countries;
  }

}