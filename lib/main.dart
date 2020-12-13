import 'package:countries_info/routes.dart';
import 'package:flutter/material.dart';

import 'locator.dart';
import 'routeNames.dart';
import 'services/navigation_service.dart';

void main() {
  setupLocator();
  runApp(PalotaCountriesAssessmentApp());
}

class PalotaCountriesAssessmentApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      initialRoute: startUp,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
    );
  }
}
