import 'package:hive/hive.dart';

part 'DetailsResponses.g.dart';

@HiveType(typeId: 0)
class DetailsResponses extends HiveObject{
  bool? adult;

  @HiveField(0)
  String? backdropPath;
  dynamic belongsToCollection;
  int? budget;
  List<Genres>? genres;
  String? homepage;
  @HiveField(1)
  int? id;
  String? imdbId;
  String? originalLanguage;

  @HiveField(2)
  String? originalTitle;

  @HiveField(3)
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;

  @HiveField(4)
  num? voteAverage;
  int? voteCount;
  String? message;

  DetailsResponses({
      this.adult, 
      this.backdropPath, 
      this.belongsToCollection, 
      this.budget, 
      this.genres, 
      this.homepage, 
      this.id, 
      this.imdbId, 
      this.originalLanguage, 
      this.originalTitle, 
      this.overview, 
      this.popularity, 
      this.posterPath, 
      this.productionCompanies, 
      this.productionCountries, 
      this.releaseDate, 
      this.revenue, 
      this.runtime, 
      this.spokenLanguages, 
      this.status, 
      this.tagline, 
      this.title, 
      this.video, 
      this.voteAverage,
      this.voteCount,});

  DetailsResponses.fromJson(dynamic json) {
    adult = json['adult'];
    message = json["status_message"];
    backdropPath = "https://image.tmdb.org/t/p/w500${json['backdrop_path']}";
    belongsToCollection = json['belongs_to_collection'];
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = "https://image.tmdb.org/t/p/w500${json['poster_path']}";
    if (json['production_companies'] != null) {
      productionCompanies = [];
      json['production_companies'].forEach((v) {
        productionCompanies?.add(ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = [];
      json['production_countries'].forEach((v) {
        productionCountries?.add(ProductionCountries.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        spokenLanguages?.add(SpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['belongs_to_collection'] = belongsToCollection;
    map['budget'] = budget;
    map['homepage'] = homepage;
    map['id'] = id;
    map['imdb_id'] = imdbId;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['revenue'] = revenue;
    map['runtime'] = runtime;
    map['status'] = status;
    map['tagline'] = tagline;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }


}

/// english_name : "English"
/// iso_639_1 : "en"
/// name : "English"

class SpokenLanguages {
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguages({
      this.englishName, 
      this.iso6391, 
      this.name,});

  SpokenLanguages.fromJson(dynamic json) {
    englishName = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }



}

/// iso_3166_1 : "US"
/// name : "United States of America"

class ProductionCountries {
  String? iso31661;
  String? name;

  ProductionCountries({
      this.iso31661, 
      this.name,});

  ProductionCountries.fromJson(dynamic json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }



}

/// id : 508
/// logo_path : "/7cxRWzi4LsVm4Utfpr1hfARNurT.png"
/// name : "Regency Enterprises"
/// origin_country : "US"

class ProductionCompanies {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompanies({
      this.id, 
      this.logoPath, 
      this.name, 
      this.originCountry,});

  ProductionCompanies.fromJson(dynamic json) {
    id = json['id'];
    logoPath = "https://image.tmdb.org/t/p/w500${json['logo_path']}";
    name = json['name'];
    originCountry = json['origin_country'];
  }


}

/// id : 18
/// name : "Drama"

class Genres {
  int? id;
  String? name;

  Genres({
      this.id, 
      this.name,});

  Genres.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }



}