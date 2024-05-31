import 'package:json_annotation/json_annotation.dart';

part 'recipe_step_link.g.dart';

@JsonSerializable()
class RecipeStepLink {
  final int? id;
  final int? number;
  final RecipeId recipe;
  final StepId step;

  RecipeStepLink({
    this.id,
    this.number,
    required this.recipe,
    required this.step,
  });

  factory RecipeStepLink.fromJson(Map<String, dynamic> json) => _$RecipeStepLinkFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeStepLinkToJson(this);
}

@JsonSerializable()
class RecipeId {
  final int id;

  RecipeId({required this.id});

  factory RecipeId.fromJson(Map<String, dynamic> json) => _$RecipeIdFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeIdToJson(this);
}

@JsonSerializable()
class StepId {
  final int id;

  StepId({required this.id});

  factory StepId.fromJson(Map<String, dynamic> json) => _$StepIdFromJson(json);
  Map<String, dynamic> toJson() => _$StepIdToJson(this);
}
