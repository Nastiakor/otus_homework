import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_homework/data/service/recipe_api_service.dart';
import 'package:flutter_homework/presentation/blocs/recipes_bloc/recipes_bloc.dart';
import 'package:flutter_homework/presentation/pages/recipe_detail_page_api.dart';
import 'package:flutter_homework/presentation/widgets/recipe_card_api.dart';
import '../widgets/bottom_navigation_bar.dart';

class RecipePage extends StatefulWidget {
  static const route = '/';

  RecipePage({Key? key}) : super(key: key);

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  late final RecipeApiService recipeApiService;
  late final RecipesBloc _recipesBloc;

  @override
  void initState() {
    super.initState();
    recipeApiService = RecipeApiService(Dio());
    _recipesBloc = RecipesBloc(recipeApiService);
    _recipesBloc.add(LoadRecipes());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(),
      body: BlocBuilder<RecipesBloc, RecipesState>(
          bloc: _recipesBloc,
          builder: (context, state) {
            if (state is RecipesLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is FailedToLoadRecipes) {
              return Center(child: Text('Unable to load recipes'));
            } else if (state is RecipesLoaded) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: state.recipesList.length,
                  itemBuilder: (context, index) {
                    final recipe = state.recipesList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RecipeDetailPage.route,
                            arguments: recipe);
                      },
                      child: RecipeCardApi(recipe: recipe),
                    );
                  },
                ),
              );
            } else {
              return Center(child: Text('Unable to load recipes'));
            }
          }),
      bottomNavigationBar: MyBottomNavigationBar(currentIndex: 0),
    );
  }
}
