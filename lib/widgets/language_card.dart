import 'package:countries_info/models/countriesData.dart';
import 'package:flutter/material.dart';

class LanguageCard extends StatelessWidget {

  final Language language;

  LanguageCard({
    this.language
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        height: 50.0,
        width: 130.0,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2.0),
              blurRadius: 2.5
            )
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(language.name, style: TextStyle(color: Colors.white)),
            Text("(${language.nativeName})", style: TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }
}
