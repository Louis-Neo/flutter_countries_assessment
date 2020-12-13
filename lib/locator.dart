import 'package:get_it/get_it.dart';

import 'services/api.dart';
import 'services/country_data_service.dart';
import 'services/navigation_service.dart';
import 'viewmodels/contriesPage_view_model.dart';
import 'viewmodels/country_detail_view_model.dart';
import 'viewmodels/landing_page_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator(){

  // Services
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => CountryDataService());

  // View Models
  locator.registerFactory<CountriesPageViewModel>(() => CountriesPageViewModel());
  locator.registerFactory<LandingPageViewModel>(() => LandingPageViewModel());
  locator.registerFactory<CountryDetailsViewModel>(() => CountryDetailsViewModel());

}