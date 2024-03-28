import 'package:flutter/material.dart';
import 'package:flutter_homework/presentation/pages/recipe_detail_page.dart';
import 'package:flutter_homework/presentation/pages/recipe_detail_page_activated.dart';
import '../pages/recipe_list_page.dart';
import 'package:flutter_homework/presentation/widgets/recipe_card.dart';

Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => RecipeListPage(),
  '/recipe-details': (context) {
    final recipeCardItem =
        ModalRoute.of(context)!.settings.arguments as RecipeCardItem;
    return RecipeDetailPage(recipeCardItem: recipeCardItem);
  },
  '/recipe-details-actions': (context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final recipeCardItem = arguments['recipeCardItem'] as RecipeCardItem;
    return RecipeDetailPageActivated(recipeCardItem: recipeCardItem);
  },
};
