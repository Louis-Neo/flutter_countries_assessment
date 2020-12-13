
class Country {

  final String name;
  final String capitalCity;
  final String countryCode;
  final String subRegion;
  final double gini;
  final String demonym;
  final String alpha2Code;
  final String alpa3Code;
  final List<Currency> currency;
  final String area;
  final String population;
  final List<String> borders;
  final List<Language> languages;

  Country({
    this.name,
    this.alpha2Code,
    this.capitalCity,
    this.countryCode,
    this.subRegion,
    this.gini,
    this.demonym,
    this.currency,
    this.alpa3Code,
    this.area,
    this.population,
    this.borders,
    this.languages
  });

  static Country fromJson(Map<String, dynamic> data){
    if(data == null){
      return null;
    }

    return Country(
      name: data['name'],
      alpha2Code: data['alpha2Code'],
      capitalCity: data['capital'],
      countryCode: data['alpha2Code'],
      subRegion: data['subregion'],
      gini: data['gini'],
      demonym: data['demonym'],
      alpa3Code: data['alpha3Code'],
      area: data['area'].toString(),
      population: data['population'].toString(),
      currency: List<Currency>.from(data["currencies"].map((x) => Currency.fromJson(x))),
      borders: List<String>.from(data["borders"].map((x) => x)),
      languages: List<Language>.from(data["languages"].map((x) => Language.fromJson(x))),
    );
  }

}

class Language {

  final String name;
  final String nativeName;

  Language({
    this.name,
    this.nativeName
  });

  static Language fromJson(Map<String, dynamic> data){
    if(data == null){
      return null;
    }

    return Language(
      name: data['name'],
      nativeName: data['nativeName']
    );
  }

}

class Currency {

  final String name;
  final String symbol;

  Currency({
    this.name,
    this.symbol
  });

  static Currency fromJson(Map<String, dynamic> data){
    if(data == null){
      return null;
    }

    return Currency(
      name: data['name'],
      symbol: data['symbol']
    );

  }

}