part of entity;

class CategoryEntity extends HiveObject {

  final int id;
  final String? flag;
  final String? name;
  final String? slug;

  CategoryEntity({
    required this.id,
    this.flag,
    this.name,
    this.slug,
  });
}