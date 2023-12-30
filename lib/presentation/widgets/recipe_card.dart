import 'package:flutter/material.dart';

class RecipeCardItem extends StatelessWidget {
  final String image;
  final String recipeTitle;
  final String timeIcon;
  final String prepTime;

  const RecipeCardItem({
    required this.image,
    required this.recipeTitle,
    required this.prepTime,
    required this.timeIcon,
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
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
              child: Image.asset(image, width: 149, height: 136),
            ),
            Expanded(
              child: Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ListTile(
                    title: Text(
                      recipeTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Row(
                        children: [
                          Image.asset(timeIcon, width: 16, height: 16),
                          const SizedBox(width: 10),
                          Text(
                            prepTime,
                            style: Theme.of(context).textTheme.bodyMedium,
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
