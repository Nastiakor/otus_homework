// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      caloriesForUnit: (json['caloriesForUnit'] as num).toDouble(),
      measureUnit: json['measureUnit'] == null
          ? null
          : MeasureUnit.fromJson(json['measureUnit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'caloriesForUnit': instance.caloriesForUnit,
      'measureUnit': instance.measureUnit,
    };
