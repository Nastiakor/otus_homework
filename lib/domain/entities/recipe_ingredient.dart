import 'package:json_annotation/json_annotation.dart';

part 'recipe_ingredient.g.dart';

@JsonSerializable()
class RecipeIngredient {
  final int id;
  final int count;
  @JsonKey(name: 'ingredient')
  final IngredientId ingredient;
  @JsonKey(name: 'recipe')
  final RecipeId recipe;

  RecipeIngredient({
    required this.id,
    required this.count,
    required this.ingredient,
    required this.recipe,
  });

  factory RecipeIngredient.fromJson(Map<String, dynamic> json) =>
      _$RecipeIngredientFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeIngredientToJson(this);
}

@JsonSerializable()
class RecipeId {
  final int id;

  RecipeId({required this.id});

  factory RecipeId.fromJson(Map<String, dynamic> json) =>
      _$RecipeIdFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeIdToJson(this);
}

@JsonSerializable()
class IngredientId {
  final int id;

  IngredientId({required this.id});

  factory IngredientId.fromJson(Map<String, dynamic> json) =>
      _$IngredientIdFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientIdToJson(this);
}
