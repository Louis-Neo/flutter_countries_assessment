
import 'package:countries_info/models/countriesData.dart';

import '../locator.dart';
import 'api.dart';

class CountryDataService {

  Api _api = locator<Api>();

  List<Country> _countries;
  List<Country> get countries => _countries;

  Future getCountries() async {
    _countries = await _api.getCountries();
  }

}