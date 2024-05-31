import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'core/constants/constants.dart';
import 'data/repositories/recipe/recipe_repository_impl.dart';
import 'domain/repositories/recipe/repositories.dart';

GetIt getIt = GetIt.instance;

void initConfig() {
  final Dio dio = Dio(
    BaseOptions(baseUrl: apiGetRecipeUrl),
  );
  getIt.registerLazySingleton(() => dio);
}

void registerRepositories() {
  getIt.registerFactory<RecipeRepository>(
    () => RecipeRepositoryImpl(),
  );
}
