import 'package:flutter/material.dart';
import '../widgets/recipe_card.dart';

class RecipeListPage extends StatelessWidget {
  RecipeListPage({super.key, required this.title});

  final String title;
  final List<RecipeCardItem> recipes = [
    const RecipeCardItem(
      image: 'assets/images/teriyaki_salmon.png',
      recipeTitle: 'Лосось в соусе терияки',
      prepTime: '45 минут',
      timeIcon: 'assets/images/time_icon.png',
    ),
    const RecipeCardItem(
      image: 'assets/images/poke_bowl.png',
      recipeTitle: 'Поке боул с сыром тофу',
      prepTime: '30 минут',
      timeIcon: 'assets/images/time_icon.png',
    ),
    const RecipeCardItem(
      image: 'assets/images/steak.png',
      recipeTitle: 'Стейк из говядины по-грузински с кукурузой',
      prepTime: '1 час 15 минут',
      timeIcon: 'assets/images/time_icon.png',
    ),
    const RecipeCardItem(
      image: 'assets/images/toasts.png',
      recipeTitle: 'Тосты с голубикой и бананом',
      prepTime: '45 минут',
      timeIcon: 'assets/images/time_icon.png',
    ),
    const RecipeCardItem(
      image: 'assets/images/seafood_pasta.png',
      recipeTitle: 'Паста с морепродуктами',
      prepTime: '25 минут',
      timeIcon: 'assets/images/time_icon.png',
    ),
    const RecipeCardItem(
      image: 'assets/images/burger.png',
      recipeTitle: 'Бургер с двумя котлетами',
      prepTime: '1 час',
      timeIcon: 'assets/images/time_icon.png',
    ),
    const RecipeCardItem(
      image: 'assets/images/pizza.png',
      recipeTitle: 'Пицца Маргарита домашняя',
      prepTime: '25 минут',
      timeIcon: 'assets/images/time_icon.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ListView(
          children: List.generate(recipes.length, (index) {
            final recipe = recipes[index];
            return RecipeCardItem(
              image: recipe.image,
              recipeTitle: recipe.recipeTitle,
              prepTime: recipe.prepTime,
              timeIcon: recipe.timeIcon,
            );
          }),
        ),
      ),
    );
  }
}
