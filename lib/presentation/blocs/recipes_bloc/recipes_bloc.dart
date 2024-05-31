import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_homework/data/service/recipe_api_service.dart';

import '../../../domain/entities/recipe.dart';

part 'recipes_event.dart';

part 'recipes_state.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  RecipesBloc(this.recipeApiService) : super(RecipesInitial()) {
    on<LoadRecipes>((event, emit) async {
      try {
        final recipesList = await recipeApiService.getRecipes();
        emit(RecipesLoaded(recipesList));
      } catch (e) {
        emit(FailedToLoadRecipes(e));
      }
    });
  }

  final RecipeApiService recipeApiService;
}
