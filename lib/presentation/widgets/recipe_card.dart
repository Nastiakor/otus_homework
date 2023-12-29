import 'package:flutter/material.dart';

class RecipeCardItem extends StatelessWidget {
  final String image;
  final String recipeTitle;
  final String timeIcon;
  final String prepTime;

  const RecipeCardItem(
      {required this.image,
      required this.recipeTitle,
      required this.prepTime,
      required this.timeIcon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Row(
          children: [
            Image.asset(image, width: 149, height: 136),
            Expanded(
              child: ListTile(
                title: Text(recipeTitle, style: Theme.of(context).textTheme.bodyLarge),
                subtitle: Row(
                  children: [
                    Image.asset(timeIcon, width: 16, height: 16),
                    const SizedBox(width: 4),
                    Text(prepTime, style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
