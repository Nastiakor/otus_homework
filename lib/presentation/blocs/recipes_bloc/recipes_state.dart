part of 'recipes_bloc.dart';

@immutable
sealed class RecipesState {}

final class RecipesInitial extends RecipesState {}

class RecipesLoading extends RecipesState {}

class RecipesLoaded extends RecipesState {
  final List<Recipe> recipesList;

  RecipesLoaded(this.recipesList);
}

class FailedToLoadRecipes extends RecipesState {
  final Object? exception;

  FailedToLoadRecipes(this.exception);
}
