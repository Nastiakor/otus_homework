import 'measure_unit.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ingredient.g.dart';

@JsonSerializable()
class Ingredient {
  final int id;
  final String name;
  final double caloriesForUnit;
  MeasureUnit? measureUnit;

  Ingredient({
    required this.id,
    required this.name,
    required this.caloriesForUnit,
    required this.measureUnit,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}

