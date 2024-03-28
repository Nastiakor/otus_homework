import 'package:flutter/material.dart';
import 'package:flutter_homework/presentation/pages/recipe_detail_page_activated.dart';
import 'package:flutter_homework/presentation/widgets/recipe_card.dart';
import '../../theme/theme.dart';

class RecipeDetailPage extends StatefulWidget {
  static const route = '/recipe-details';
  final RecipeCardItem recipeCardItem;

  RecipeDetailPage({super.key, required this.recipeCardItem});

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  bool isButtonPressed = false;

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
                  Text(widget.recipeCardItem.recipeTitle,
                      style: AppTheme.textTheme.titleLarge),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset(widget.recipeCardItem.timeIcon),
                      SizedBox(width: 10),
                      Text(widget.recipeCardItem.prepTime,
                          style: AppTheme.textTheme.bodyMedium),
                    ],
                  ),
                  SizedBox(height: 15),
                  Image.asset(widget.recipeCardItem.detailImage),
                  SizedBox(height: 15),
                  Text('Ингредиенты', style: AppTheme.textTheme.titleSmall),
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
                    child: Table(
                      columnWidths: const {
                        0: FlexColumnWidth(3),
                        1: FlexColumnWidth(1.5),
                      },
                      children:
                          widget.recipeCardItem.ingredients.map((ingredient) {
                        return TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('• ${ingredient.key}',
                                  style: AppTheme.textTheme.labelLarge),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(ingredient.value,
                                  textAlign: TextAlign.left,
                                  style: AppTheme.textTheme.labelMedium),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text('Шаги приготовления',
                      style: AppTheme.textTheme.titleSmall),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final step = widget.recipeCardItem.steps[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: SizedBox(
                    height: 120,
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
                                    step.stepNumber,
                                    style: AppTheme.textTheme.displayLarge,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
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
                                      side: MaterialStateBorderSide.resolveWith(
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
                                    child: Text(step.preparationTime,
                                        style: AppTheme.textTheme.displaySmall),
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
              childCount: widget.recipeCardItem.steps.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RecipeDetailPageActivated.route,
                          arguments: {
                            'recipeCardItem': widget.recipeCardItem,
                          });
                    },
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
        ],
      ),
    );
  }
}
