part of model;

class TeamModel extends TeamEntity {

  TeamModel({
    required int id,
    CategoryModel? category,
    CountryModel? country,
    String? name,
    String? nameCode,
    bool? national,
    String? shortName,
    String? slug,
    SportModel? sport,
    ColorModel? teamColors,
    int? type,
    int? userCount,
    String? fullName
  }) : super(
    id: id,
    category: category,
    country: country,
    name: name,
    nameCode: nameCode,
    national: national,
    shortName: shortName,
    slug: slug,
    sport: sport,
    teamColors: teamColors,
    type: type,
    userCount: userCount,
    fullName: fullName
  );

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    TeamModel teamModel = TeamModel(
      id: json['id'],
      country: CountryModel.fromJson(json['country']),
      name: json['name'],
      nameCode: json['nameCode'],
      national: json['national'],
      shortName: json['shortName'],
      slug: json['slug'],
      sport: SportModel.fromJson(json['sport']),
      teamColors: ColorModel.fromJson(json['teamColors']),
      type: json['type'],
      userCount: json['userCount'],
      fullName: json['fullName'],
      category: CategoryModel.fromJson(json['category'])
    );

    return teamModel;
  }
}