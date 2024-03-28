class RecipeStep {
  final String stepNumber;
  final String description;
  bool isCompleted;
  final String preparationTime;

  RecipeStep({
    required this.stepNumber,
    required this.description,
    this.preparationTime = "00:00",
    this.isCompleted = false,
  });
}
