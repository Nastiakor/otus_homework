import 'package:flutter_homework/presentation/pages/recipe_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_homework/presentation/pages/recipe_list_page.dart';
import 'package:flutter_homework/presentation/widgets/recipe_card.dart';
import '../../theme/theme.dart';

class RecipeDetailPageActivated extends RecipeDetailPage {
  final RecipeCardItem recipeCardItem;
  static const route = '/recipe-details-actions';

  RecipeDetailPageActivated({Key? key, required this.recipeCardItem})
      : super(key: key, recipeCardItem: recipeCardItem);

  @override
  State<RecipeDetailPageActivated> createState() =>
      _RecipeDetailPageActivatedState();
}

class _RecipeDetailPageActivatedState extends State<RecipeDetailPageActivated> {
  bool isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Рецепт', style: AppTheme.textTheme.titleMedium),
        backgroundColor: AppTheme.lightGreenColor,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Таймер',
                  style: AppTheme.textTheme.titleSmall!
                      .copyWith(fontSize: 15, color: Colors.white),
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 4),
                Text(
                  '38:59',
                  style: AppTheme.textTheme.displayLarge!
                      .copyWith(fontSize: 24, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushNamed(context, RecipeListPage.route),
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
                      color: AppTheme.lightGreenColor.withOpacity(0.15),
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
                                    style: AppTheme.textTheme.displayLarge!
                                        .copyWith(
                                            color: AppTheme.lightGreenColor),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    step.description,
                                    style: AppTheme.textTheme.labelSmall!
                                        .copyWith(
                                            color: AppTheme.darkGreenColor2),
                                  ),
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
                                            color: AppTheme.darkGreenColor),
                                      ),
                                      checkColor: Colors.white,
                                      activeColor: AppTheme.darkGreenColor,
                                      value: step.isCompleted,
                                      onChanged: (bool? newValue) {
                                        setState(() {
                                          step.isCompleted = newValue ?? false;
                                        });
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      step.preparationTime,
                                      style: AppTheme.textTheme.displaySmall!
                                          .copyWith(
                                              color: AppTheme.darkGreenColor),
                                    ),
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
                      setState(() {
                        widget.recipeCardItem.steps.forEach((step) {
                          step.isCompleted = false;
                        });
                      });
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side:
                          BorderSide(color: AppTheme.darkGreenColor, width: 4),
                      minimumSize: Size(232, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      'Закончить готовить',
                      style: AppTheme.textTheme.titleSmall,
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
