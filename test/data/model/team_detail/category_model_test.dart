import 'dart:convert';

import 'package:esports_team_endpoint/data/model/model.dart';
import 'package:esports_team_endpoint/domain/entity/entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../../fixtures/json_file_name.dart';

void main() {
  CategoryModel categoryModel = CategoryModel(id: 1);

  test('Should be a subclass of CountryEntity',
    () => expect(categoryModel, isA<CategoryEntity>())
  );

  group('fromJson', () {
    test('Should return a CategoryModel from a JSON', () async {
      final Map<String, dynamic> json = jsonDecode(readFixture(categoryJson));
      final result = CategoryModel.fromJson(json);
      expect(result, isA<CategoryModel>());
    });

    test('Should contain a value in the id field', () async {
      final Map<String, dynamic> json = jsonDecode(readFixture(categoryJson));
      final result = CategoryModel.fromJson(json);
      expect(result.id, isNotNull);
    });
  });
}