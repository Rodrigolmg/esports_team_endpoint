part of model;

class CategoryModel extends CategoryEntity {

  CategoryModel({
    required int id,
    String? flag,
    String? name,
    String? slug,
  }) : super(
    id: id,
    flag: flag,
    name: name,
    slug: slug
  );

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    CategoryModel categoryModel = CategoryModel(
      id: json['id'],
      flag: json['flag'],
      name: json['name'],
      slug: json['slug']
    );

    return categoryModel;
  }
}