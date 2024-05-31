import 'package:json_annotation/json_annotation.dart';

part 'recipe_step.g.dart';

@JsonSerializable()
class RecipeStep {
  final int stepId;
  final String description;
  bool isCompleted;
  final String duration;

  RecipeStep({
    required this.stepId,
    required this.description,
    this.isCompleted = false,
    this.duration = "00:00",
  });

  factory RecipeStep.fromJson(Map<String, dynamic> json) {
    return RecipeStep(
      stepId: json['id'] as int,
      description: json['name'] as String,
      duration: _formatDuration(json['duration']),
    );
  }

  static String _formatDuration(dynamic duration) {
    if (duration == null) {
      return "00:00";
    } else {
      int minutes = (duration as num).toInt();
      return '${minutes.toString().padLeft(2, '0')}:00';
    }
  }

  Map<String, dynamic> toJson() => _$RecipeStepToJson(this);
}
