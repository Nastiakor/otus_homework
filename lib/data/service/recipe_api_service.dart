import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_homework/domain/entities/recipe_ingredient.dart';
import 'package:flutter_homework/domain/entities/recipe_step.dart';
import 'package:flutter_homework/domain/entities/recipe_step_link.dart';
import 'package:flutter_homework/domain/entities/ingredient.dart';
import 'package:flutter_homework/domain/entities/measure_unit.dart';
import '../../core/constants/constants.dart';
import '../../domain/entities/recipe.dart';

part 'recipe_api_service.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class RecipeApiService {
  factory RecipeApiService(Dio dio, {String baseUrl}) = _RecipeApiService;

  @GET('https://foodapi.dzolotov.tech/recipe')
  Future<List<Recipe>> getRecipes();

  @GET('https://foodapi.dzolotov.tech/recipe_step')
  Future<List<RecipeStep>> getRecipeSteps(@Query('recipeId') int recipeId);

  @GET('https://foodapi.dzolotov.tech/recipe_step/{id}')
  Future<RecipeStep> getStepById(@Path('id') int id);

  @GET('https://foodapi.dzolotov.tech/recipe_step_link')
  Future<List<RecipeStepLink>> getAllRecipeStepLinks();

  @GET('https://foodapi.dzolotov.tech/recipe_step_link/{id}')
  Future<RecipeStepLink> getRecipeStepLink(@Path('id') int id);

  @GET('https://foodapi.dzolotov.tech/recipe_ingredient')
  Future<List<RecipeIngredient>> getAllRecipeIngredientLinks();
  @GET('https://foodapi.dzolotov.tech/recipe_ingredient')
  Future<List<RecipeIngredient>> getAllRecipeIngredients();

  @GET('https://foodapi.dzolotov.tech/recipe_ingredient/{id}')
  Future<List<RecipeIngredient>> getRecipeIngredientByRecipeId(@Path('id') int recipeId);

  @GET('https://foodapi.dzolotov.tech/ingredient')
  Future<List<Ingredient>> getIngredients();

  @GET('https://foodapi.dzolotov.tech/ingredient/{id}')
  Future<Ingredient> getIngredient(@Path('id') int id);

  @GET('https://foodapi.dzolotov.tech/measure_unit')
  Future<List<MeasureUnit>> getMeasureUnits();
}
