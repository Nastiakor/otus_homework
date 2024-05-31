// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_step_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeStepLink _$RecipeStepLinkFromJson(Map<String, dynamic> json) =>
    RecipeStepLink(
      id: (json['id'] as num?)?.toInt(),
      number: (json['number'] as num?)?.toInt(),
      recipe: RecipeId.fromJson(json['recipe'] as Map<String, dynamic>),
      step: StepId.fromJson(json['step'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecipeStepLinkToJson(RecipeStepLink instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'recipe': instance.recipe,
      'step': instance.step,
    };

RecipeId _$RecipeIdFromJson(Map<String, dynamic> json) => RecipeId(
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$RecipeIdToJson(RecipeId instance) => <String, dynamic>{
      'id': instance.id,
    };

StepId _$StepIdFromJson(Map<String, dynamic> json) => StepId(
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$StepIdToJson(StepId instance) => <String, dynamic>{
      'id': instance.id,
    };
