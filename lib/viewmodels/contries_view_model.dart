
import 'package:countries_info/services/navigation_service.dart';

import '../locator.dart';
import '../routeNames.dart';
import 'base_view_model.dart';

class CountriesViewModel extends BaseViewModel {

  NavigationService _navigationService = locator<NavigationService>();

  void navigateToDetails(){
    _navigationService.navigateTo(countryDetail);
  }

}