
import 'package:countries_info/services/navigation_service.dart';

import '../locator.dart';
import '../routeNames.dart';
import 'base_view_model.dart';

class LandingPageViewModel extends BaseViewModel {

  NavigationService _navigationService = locator<NavigationService>();

  void navigateToCountries(){
    _navigationService.navigatePushReplacementNamed(countries);
  }

}