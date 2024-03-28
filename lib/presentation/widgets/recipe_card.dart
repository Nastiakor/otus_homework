import 'package:flutter/material.dart';
import 'package:flutter_homework/presentation/widgets/recipe_step.dart';
import 'package:flutter_homework/theme/theme.dart';

class RecipeCardItem extends StatelessWidget {
  final String image;
  final String detailImage;
  final String recipeTitle;
  final String timeIcon;
  final String prepTime;
  final List<MapEntry<String, String>> ingredients;
  final List<RecipeStep> steps;

  const RecipeCardItem({
    required this.image,
    required this.detailImage,
    required this.recipeTitle,
    required this.timeIcon,
    required this.prepTime,
    required this.ingredients,
    required this.steps,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: const Color(0xFFFFFFFF),
        child: Row(
          children: [
            Image.asset(image, width: 149, height: 136),
            Expanded(
              child: Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ListTile(
                    title: Text(
                      recipeTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.textTheme.bodyLarge,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Row(
                        children: [
                          Image.asset(timeIcon, width: 16, height: 16),
                          const SizedBox(width: 10),
                          Text(
                            prepTime,
                            style: AppTheme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
