import 'package:countries_info/models/countriesData.dart';
import 'package:countries_info/services/navigation_service.dart';
import 'package:flutter/material.dart';

import '../locator.dart';
import '../routeNames.dart';

class FlagCard extends StatelessWidget {

  // TODO not ideal to have logic in UI
  NavigationService _navigationService = locator<NavigationService>();

  final Country country;
  final Function onTap;

  FlagCard({
    this.country,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GestureDetector(
        onTap: (){
          _navigationService.navigateTo(countryDetail, arguments: country);
        },
        child: Container(
          height: 30.0,
          width: 130.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Image.network('https://flagcdn.com/w2560/${country.alpha2Code.toLowerCase()}.png', fit: BoxFit.fill),
        )
      )
    );
  }
}
