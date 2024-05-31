import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_homework/theme/theme.dart';
import '../../domain/entities/recipe.dart';
import '../../utils/utils.dart';

class RecipeCardApi extends StatelessWidget {
  final Recipe recipe;

  const RecipeCardApi({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: const Color(0xFFFFFFFF),
        child: Row(
          children: [
            ClipRect(
              child: Container(
                width: 149,
                height: 136,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: CachedNetworkImage(
                    imageUrl: recipe.photo,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ListTile(
                    title: Text(
                      recipe.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.textTheme.bodyLarge,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Row(
                        children: [
                          Image.asset(recipe.timeIcon ?? 'assets/images/time_icon.png', width: 16, height: 16),
                          const SizedBox(width: 10),
                          Text(
                            formatDuration(recipe.duration as int),
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
