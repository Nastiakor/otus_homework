import 'package:flutter/material.dart';
import '../presentation/pages/recipe_list_page.dart';
import '../utils/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appThemeData,
      home: RecipeListPage(title: 'home'),
    );
  }
}
