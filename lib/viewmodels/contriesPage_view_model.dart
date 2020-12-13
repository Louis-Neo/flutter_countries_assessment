import 'package:countries_info/models/countriesData.dart';
import 'package:countries_info/services/country_data_service.dart';
import 'package:countries_info/services/navigation_service.dart';

import '../locator.dart';
import '../routeNames.dart';
import 'base_view_model.dart';

class CountriesPageViewModel extends BaseViewModel {

  NavigationService _navigationService = locator<NavigationService>();
  CountryDataService _countryDataService = locator<CountryDataService>();

  List<Country> get countries => _countryDataService.countries;

  Future getCountries() async {
    setBusy(true);
    await _countryDataService.getCountries();
    setBusy(false);

  }

  void navigateToCountryDetailsPage(Country country){
    _navigationService.navigateTo(countryDetail, arguments: country);
  }

  void navigateToAboutPage(){
    _navigationService.navigateTo(about);
  }

}
