part of 'recipes_bloc.dart';

@immutable
sealed class RecipesEvent {}
class LoadRecipes extends RecipesEvent {}
