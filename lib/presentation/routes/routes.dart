import 'package:flutter/material.dart';
import 'package:flutter_homework/domain/entities/recipe.dart';
import 'package:flutter_homework/presentation/pages/recipe_page_api.dart';
import '../pages/recipe_detail_page_api.dart';

Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => RecipePage(),
  '/recipe-details': (context) {
    final recipe = ModalRoute.of(context)!.settings.arguments as Recipe;
    return RecipeDetailPage(recipe: recipe, recipeId: recipe.id);
  },
  /*'/recipe-details-actions': (context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final recipeCardItem = arguments['recipeCardItem'] as RecipeCardItem;
    return RecipeDetailPageActivated(recipeCardItem: recipeCardItem);
  },*/
};
