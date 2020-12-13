import 'package:countries_info/models/countriesData.dart';
import 'package:flutter/material.dart';

class CountryListItem extends StatelessWidget {

  final Country country;
  final Function onTap;

  CountryListItem({
    this.country,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2.0),
                blurRadius: 3
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.20,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network('https://flagcdn.com/w160/${country.alpha2Code.toLowerCase()}.png'),
                  Positioned(
                    right: 0.0,
                    bottom: 0.0,
                    child: Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Center(
                        child: Text(country.alpha2Code, style: TextStyle(color: Colors.white)),
                      )
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: 35.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Text(country.name, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Text(country.capitalCity)
              ],
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
      )
    );
  }
}
