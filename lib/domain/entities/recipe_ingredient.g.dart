// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeIngredient _$RecipeIngredientFromJson(Map<String, dynamic> json) =>
    RecipeIngredient(
      id: (json['id'] as num).toInt(),
      count: (json['count'] as num).toInt(),
      ingredient:
          IngredientId.fromJson(json['ingredient'] as Map<String, dynamic>),
      recipe: RecipeId.fromJson(json['recipe'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecipeIngredientToJson(RecipeIngredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'count': instance.count,
      'ingredient': instance.ingredient,
      'recipe': instance.recipe,
    };

RecipeId _$RecipeIdFromJson(Map<String, dynamic> json) => RecipeId(
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$RecipeIdToJson(RecipeId instance) => <String, dynamic>{
      'id': instance.id,
    };

IngredientId _$IngredientIdFromJson(Map<String, dynamic> json) => IngredientId(
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$IngredientIdToJson(IngredientId instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
