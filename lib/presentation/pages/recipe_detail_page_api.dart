import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_homework/domain/entities/recipe.dart';
import 'package:flutter_homework/domain/entities/recipe_ingredient.dart';
import 'package:flutter_homework/domain/entities/recipe_step.dart';
import 'package:flutter_homework/theme/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../data/service/recipe_api_service.dart';
import '../../utils/utils.dart';

class RecipeDetailPage extends StatefulWidget {
  static const route = '/recipe-details';
  final Recipe recipe;
  final int recipeId;

  RecipeDetailPage({Key? key, required this.recipe, required this.recipeId})
      : super(key: key);

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  bool isFavourite = false;
  late TextEditingController _commentController = TextEditingController();
  final List<String> comments = [];
  List<RecipeStep> _recipeSteps = [];
  late List<RecipeIngredient> recipeIngredients = [];
  bool isLoadingSteps = true;
  List<RecipeIngredient> _ingredients = [];

  @override
  void initState() {
    super.initState();
    _loadRecipeSteps();
    _loadAllIngredients();
    _loadRecipeIngredients();
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _loadRecipeSteps() async {
    try {
      isLoadingSteps = true;
      final dio = Dio();
      final apiService = RecipeApiService(dio);
      final allLinks = await apiService.getAllRecipeStepLinks();

      final stepLinks =
          allLinks.where((link) => link.recipe.id == widget.recipeId).toList();
      final stepIds = stepLinks.map((link) => link.step.id).toList();

      final steps =
          await Future.wait(stepIds.map((id) => apiService.getStepById(id)));
      setState(() {
        _recipeSteps = steps;
        isLoadingSteps = false;
      });
    } catch (e) {
      setState(() {
        isLoadingSteps = false;
        print("Error loading steps: $e");
      });
    }
  }

  Map<int, String> ingredientsMap = {};

  void _loadAllIngredients() async {
    try {
      final dio = Dio();
      final apiService = RecipeApiService(dio);
      final ingredients = await apiService.getIngredients();

      print("Loaded ingredients: ${ingredients.map((i) => i.name).toList()}");  // Affiche les noms

      setState(() {
        ingredientsMap = {for (var ingredient in ingredients) ingredient.id: ingredient.name};
      });
    } catch (e) {
      print('Error loading all ingredients: $e');
    }
  }


  void _loadRecipeIngredients() async {
    try {
      final dio = Dio();
      final apiService = RecipeApiService(dio);
      final allIngredientLinks = await apiService.getAllRecipeIngredientLinks();
      print("Ingredient links: $allIngredientLinks");  // Ajoutez cette ligne

      final ingredientLinks = allIngredientLinks.where((link) => link.recipe.id == widget.recipeId).toList();
      print("Filtered ingredient links: $ingredientLinks");  // Ajoutez cette ligne

      final ingredientIds = ingredientLinks.map((link) => link.ingredient.id).toList();
      final ingredients = await Future.wait(ingredientIds.map((id) => apiService.getIngredient(id)));
      print("Loaded ingredients by ID: ${ingredients.map((i) => i.name).toList()}");


      setState(() {
        _ingredients = ingredients.map((ingredient) {
          return RecipeIngredient(
            id: ingredient.id,
            count: 0,
            ingredient: IngredientId(id: ingredient.id),
            recipe: RecipeId(id: widget.recipeId),
          );
        }).toList();
      });
    } catch (e) {
      print("Error loading ingredients: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Рецепт', style: AppTheme.textTheme.titleMedium),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.recipe.name,
                          style: AppTheme.textTheme.titleLarge,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 6,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isFavourite = !isFavourite;
                          });
                        },
                        child: Image.asset(
                          isFavourite
                              ? 'assets/images/red_heart.png'
                              : 'assets/images/black_heart.png',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset(widget.recipe.timeIcon ??
                          'assets/images/time_icon.png'),
                      SizedBox(width: 10),
                      Text(
                        widget.recipe.duration != null
                            ? formatDuration(widget.recipe.duration ?? 0)
                            : '',
                        style: AppTheme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  CachedNetworkImage(
                    imageUrl: widget.recipe.photo,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Ингредиенты',
                    style: AppTheme.textTheme.titleSmall,
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 3,
                        color: AppTheme.darkGreyColor,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: _ingredients.map((recipeIngredient) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  '• ${ingredientsMap[recipeIngredient.ingredient.id]}',
                                  style: AppTheme.textTheme.labelLarge,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  '${recipeIngredient.count.toString()}',
                                  textAlign: TextAlign.left,
                                  style: AppTheme.textTheme.labelMedium,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Шаги приготовления',
                    style: AppTheme.textTheme.titleSmall,
                  ),
                ],
              ),
            ),
          ),
          if (isLoadingSteps)
            SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          else if (_recipeSteps.isEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('Nothing to display'),
              ),
            )
          else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  print("Building step: ${_recipeSteps[index].description}");
                  final step = _recipeSteps[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: SizedBox(
                      height: 200,
                      width: 398,
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: AppTheme.lightGreyColor,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                Container(
                                  width: 40,
                                  child: Center(
                                    child: Text(
                                      '${index + 1}',
                                      style: AppTheme.textTheme.displayLarge,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                    child: Text(step.description,
                                        style: AppTheme.textTheme.labelSmall),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Transform.scale(
                                      scale: 1.5,
                                      child: Checkbox(
                                        side:
                                            MaterialStateBorderSide.resolveWith(
                                          (states) => BorderSide(
                                              width: 2,
                                              color: AppTheme.darkGreyColor),
                                        ),
                                        checkColor: Colors.white,
                                        activeColor: AppTheme.darkGreenColor,
                                        value: step.isCompleted,
                                        onChanged: null,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(step.duration,
                                          style:
                                              AppTheme.textTheme.displaySmall),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                childCount: _recipeSteps.length,
              ),
            ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.darkGreenColor,
                      minimumSize: Size(232, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      'Начать готовить',
                      style: AppTheme.textTheme.titleSmall
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    comments[index],
                    style: AppTheme.textTheme.bodyMedium
                        ?.copyWith(color: Colors.black),
                  ),
                );
              },
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: _commentController,
                style: AppTheme.textTheme.bodyMedium
                    ?.copyWith(color: Colors.black),
                onSubmitted: (value) {
                  if (value.trim().isNotEmpty) {
                    setState(() {
                      comments.add(value.trim());
                      _commentController.clear();
                    });
                  }
                },
                decoration: InputDecoration(
                  hintText: 'оставить комментарий',
                  hintStyle: AppTheme.textTheme.titleSmall
                      ?.copyWith(color: AppTheme.mediumGreyColor),
                  contentPadding: EdgeInsets.all(15.0),
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppTheme.darkGreenColor,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppTheme.darkGreenColor, width: 2),
                  ),
                  suffixIcon: Image.asset('assets/images/comment.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
