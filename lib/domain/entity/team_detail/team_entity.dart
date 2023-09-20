part of entity;

@HiveType(typeId: 1)
class TeamEntity extends HiveObject {

  @HiveField(0)
  final int id;

  @HiveField(1)
  final CategoryEntity? category;

  @HiveField(2)
  final CountryEntity? country;

  @HiveField(3)
  final String? name;

  @HiveField(4)
  final String? nameCode;

  @HiveField(5)
  final bool? national;

  @HiveField(6)
  final String? shortName;

  @HiveField(7)
  final String? slug;

  @HiveField(8)
  final SportEntity? sport;

  @HiveField(9)
  final ColorEntity? teamColors;

  @HiveField(10)
  final int? type;

  @HiveField(11)
  final int? userCount;

  @HiveField(12)
  final String? fullName;

  TeamEntity({
    required this.id,
    this.category,
    this.country,
    this.name,
    this.nameCode,
    this.national,
    this.shortName,
    this.slug,
    this.sport,
    this.teamColors,
    this.type,
    this.userCount,
    this.fullName
  });
}