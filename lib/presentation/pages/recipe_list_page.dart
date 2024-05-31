import 'package:flutter/material.dart';
import 'package:flutter_homework/presentation/pages/recipe_detail_page_api.dart';
import 'package:flutter_homework/theme/theme.dart';
import '../../domain/repositories/recipe/repositories.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/recipe_card.dart';

class RecipeListPage extends StatelessWidget {
  static const route = '/';

  RecipeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightGreyColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: FutureBuilder<List<RecipeCardItem>>(
          future: fetchRecipes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error loading recipes: ${snapshot.error}'),
              );
            } else {
              final List<RecipeCardItem> recipes = snapshot.data!;
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RecipeDetailPage.route,
                          arguments: recipe);
                    },
                    child: RecipeCardItem(
                      image: recipe.image,
                      detailImage: recipe.detailImage,
                      recipeTitle: recipe.recipeTitle,
                      prepTime: recipe.prepTime,
                      timeIcon: recipe.timeIcon,
                      ingredients: recipe.ingredients,
                      steps: [],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(currentIndex: 0),
    );
  }

  Future<List<RecipeCardItem>> fetchRecipes() async {
    return RecipeRepository.getRecipes();
  }
}
