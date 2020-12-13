
import 'package:countries_info/models/countriesData.dart';
import 'package:countries_info/services/country_data_service.dart';
import 'package:countries_info/services/navigation_service.dart';

import '../locator.dart';
import '../routeNames.dart';
import 'base_view_model.dart';

class CountryDetailsViewModel extends BaseViewModel {

  NavigationService _navigationService = locator<NavigationService>();
  CountryDataService _countryDataService = locator<CountryDataService>();

  List<Country> get countries => _countryDataService.countries;

  List<Country> _borderCountries = List<Country>();
  List<Country> get borderCountries => _borderCountries;

  Future getBorderCountries() async {
    setBusy(true);
    await _countryDataService.getCountries();
    setBusy(false);
  }

  void navigateToAboutPage(){
    _navigationService.navigateTo(about);
  }

}