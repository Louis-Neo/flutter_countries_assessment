import 'package:countries_info/models/countriesData.dart';
import 'package:countries_info/viewmodels/country_detail_view_model.dart';
import 'package:countries_info/widgets/flag_card.dart';
import 'package:countries_info/widgets/language_card.dart';
import 'package:flutter/material.dart';

import '../base_view.dart';

//TODO: complete this page - you may choose to change it to a stateful widget if necessary
class CountryDetailPage extends StatelessWidget {

  final Country country;

  CountryDetailPage({
    this.country
  });

  @override
  Widget build(BuildContext context) {

    final String description = "${country.name} covers an area of ${country.area} km² and has a population of ${country.population} - the nationa has a Gini coefficient of ${country.gini}. A resident of ${country.name} is called a ${country.demonym}. The main currency accepted as legal tender is the ${country.currency[0].name} which is expressed by the symbol '${country.currency[0].symbol}'.";

    return BaseView<CountryDetailsViewModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: AppBar(
          title: Text(country.name),
          actions: [
            IconButton(
                icon: Icon(Icons.info_outline),
                onPressed: () => model.navigateToAboutPage()
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        child: Text(country.countryCode),
                        radius: 22.5,
                      ),
                      SizedBox(width: 30.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Text(country.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0), maxLines: 3),
                          ),
                          Text(country.subRegion)
                        ],
                      )
                    ],
                  )
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Image.network('https://flagcdn.com/w2560/${country.alpha2Code.toLowerCase()}.png', fit: BoxFit.fill),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.height * 0.95,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(description, style: TextStyle(fontSize: 18.0), overflow: TextOverflow.ellipsis, maxLines: 12),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.location_on, size: 28.0),
                      SizedBox(width: 20.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Sub-region", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                          Text(country.subRegion, style: TextStyle(fontSize: 16.0))
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.location_city, size: 28.0),
                      SizedBox(width: 20.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Capital", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                          Text(country.capitalCity, style: TextStyle(fontSize: 16.0))
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  margin: const EdgeInsets.only(right: 100.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0))
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.language, color: Colors.white),
                      SizedBox(width: 20.0),
                      Text("Languages", style: TextStyle(color: Colors.white, fontSize: 20.0))
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  height: 80.0,
                  child: ListView.builder(
                    itemCount: country.languages.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return LanguageCard(language: country.languages[index]);
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                _buildBorderCountries(model.countries)
              ]),
            )
          ],
        )
      ),
    );
  }

  Widget _buildBorderCountries(List<Country> countries){

    List<Country> _borderCountries = List<Country>();

    for(var item in countries){
      for(var i = 0; i < country.borders.length; i++){
        if(country.borders[i] == item.alpa3Code){
          _borderCountries.add(item);
        }
      }
    }

    return _borderCountries.length == 0 ? Container() : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 100.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.only(topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0))
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.local_activity, color: Colors.white),
              SizedBox(width: 20.0),
              Text("Bordering Countries", style: TextStyle(color: Colors.white, fontSize: 20.0))
            ],
          )
        ),
        SizedBox(height: 20.0),
        Container(
          margin: const EdgeInsets.only(left: 15.0),
          height: 80.0,
          child: ListView.builder(
            itemCount: _borderCountries.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              return FlagCard(country: _borderCountries[index]);
            },
          ),
        ),
        SizedBox(height: 20.0)
      ],
    );

  }

}