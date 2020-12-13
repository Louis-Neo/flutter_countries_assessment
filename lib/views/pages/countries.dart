import 'package:countries_info/viewmodels/contriesPage_view_model.dart';
import 'package:countries_info/widgets/country_list_item.dart';
import 'package:flutter/material.dart';

import '../base_view.dart';

// Feel free to change this to a stateful widget if necessary
class CountriesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BaseView<CountriesPageViewModel>(
      onModelReady: (model) => model.getCountries(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white.withOpacity(0.85),
        appBar: AppBar(
          title: Text("Countries"),
          actions: [
            IconButton(
                icon: Icon(Icons.info_outline),
                onPressed: () => model.navigateToAboutPage()
            )
          ],
        ),
        body: model.busy ? Center(
          child: CircularProgressIndicator(),
        ) : Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: model.countries.length,
                itemBuilder: (context, index){
                  return CountryListItem(
                    country: model.countries[index],
                    onTap: () => model.navigateToCountryDetailsPage(model.countries[index])
                  );
                },
              )
            ),
            Container()
          ],
        ),
      ),
    );
  }
}
