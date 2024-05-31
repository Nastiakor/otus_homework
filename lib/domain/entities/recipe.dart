import 'package:flutter_homework/domain/entities/recipe_ingredient.dart';
import 'package:flutter_homework/domain/entities/recipe_step.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

@JsonSerializable()
class Recipe {
  final int id;
  final String name;
  final int? duration;
  final String photo;
  final String? timeIcon;
  final List<RecipeIngredient>? ingredients;
  final List<RecipeStep>? steps;

  Recipe({
    required this.id,
    required this.name,
    this.duration,
    required this.photo,
    this.timeIcon,
    this.ingredients,
    this.steps,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return _$RecipeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
