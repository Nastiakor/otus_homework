import 'package:flutter/material.dart';
import 'package:flutter_homework/presentation/pages/recipe_detail_page.dart';
import 'package:flutter_homework/presentation/widgets/recipe_step.dart';
import 'package:flutter_homework/theme/theme.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/recipe_card.dart';

class RecipeListPage extends StatelessWidget {
  static const route = '/';

  RecipeListPage({super.key});

  final List<RecipeCardItem> recipes = [
    RecipeCardItem(
        image: 'assets/images/teriyaki_salmon.png',
        detailImage: 'assets/images/teriyaki_salmon_detail.png',
        recipeTitle: 'Лосось в соусе терияки',
        prepTime: '45 минут',
        timeIcon: 'assets/images/time_icon.png',
        ingredients: [
          MapEntry('Соевый соус', '8 ст. ложек'),
          MapEntry('Вода', '8 ст. ложек'),
          MapEntry('Мёд', '3 ст. ложки'),
          MapEntry('Коричневый сахар', '2 ст. ложки'),
          MapEntry('Чеснок', '3 зубчика'),
          MapEntry('Тёртый свежий имбирь', '1 ст. ложка'),
          MapEntry('Лимонный сок', '1¹⁄₂ ст. ложки'),
          MapEntry('Кукурузный крахмал', '1 ст. ложка'),
          MapEntry('Растительное масло', '1 ч. ложка'),
          MapEntry('Филе лосося или сёмги', '680 г'),
          MapEntry('Кунжут', 'по вкусу')
        ],
        steps: [
          RecipeStep(
            stepNumber: '1',
            description:
                'В маленькой кастрюле соедините соевый соус, 6 столовых ложек воды, мёд, сахар, измельчённый чеснок, имбирь и лимонный сок.',
            preparationTime: "06:00",
          ),
          RecipeStep(
            stepNumber: '2',
            description:
                'Поставьте на средний огонь и, помешивая, доведите до лёгкого кипения.',
            preparationTime: "07:00",
          ),
          RecipeStep(
            stepNumber: '3',
            description:
                'Смешайте оставшуюся воду с крахмалом. Добавьте в кастрюлю и перемешайте.',
            preparationTime: "06:00",
          ),
          RecipeStep(
            stepNumber: '4',
            description:
                'Готовьте, непрерывно помешивая венчиком, 1 минуту. Снимите с огня и немного остудите.',
            preparationTime: "01:00",
          ),
          RecipeStep(
            stepNumber: '5',
            description:
                'Смажьте форму маслом и выложите туда рыбу. Полейте её соусом.',
            preparationTime: "06:00",
          ),
          RecipeStep(
            stepNumber: '6',
            description:
                'Поставьте в разогретую до 200 °C духовку примерно на 15 минут.',
            preparationTime: "15:00",
          ),
          RecipeStep(
            stepNumber: '7',
            description:
                'Перед подачей полейте соусом из формы и посыпьте кунжутом.',
            preparationTime: "04:00",
          ),
        ]),
    const RecipeCardItem(
        image: 'assets/images/poke_bowl.png',
        detailImage: '',
        recipeTitle: 'Поке боул с сыром тофу',
        prepTime: '30 минут',
        timeIcon: 'assets/images/time_icon.png',
        ingredients: [],
        steps: []),
    const RecipeCardItem(
        image: 'assets/images/steak.png',
        detailImage: '',
        recipeTitle: 'Стейк из говядины по-грузински с кукурузой',
        prepTime: '1 час 15 минут',
        timeIcon: 'assets/images/time_icon.png',
        ingredients: [],
        steps: []),
    const RecipeCardItem(
        image: 'assets/images/toasts.png',
        detailImage: '',
        recipeTitle: 'Тосты с голубикой и бананом',
        prepTime: '45 минут',
        timeIcon: 'assets/images/time_icon.png',
        ingredients: [],
        steps: []),
    const RecipeCardItem(
        image: 'assets/images/seafood_pasta.png',
        detailImage: '',
        recipeTitle: 'Паста с морепродуктами',
        prepTime: '25 минут',
        timeIcon: 'assets/images/time_icon.png',
        ingredients: [],
        steps: []),
    const RecipeCardItem(
        image: 'assets/images/burger.png',
        detailImage: '',
        recipeTitle: 'Бургер с двумя котлетами',
        prepTime: '1 час',
        timeIcon: 'assets/images/time_icon.png',
        ingredients: [],
        steps: []),
    RecipeCardItem(
        image: 'assets/images/pizza.png',
        detailImage: '',
        recipeTitle: 'Пицца Маргарита домашняя',
        prepTime: '25 минут',
        timeIcon: 'assets/images/time_icon.png',
        ingredients: [],
        steps: []),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightGreyColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: List.generate(recipes.length, (index) {
            final recipe = recipes[index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, RecipeDetailPage.route,
                    arguments: recipe);
              },
              child: RecipeCardItem(
                  image: recipe.image,
                  detailImage: recipe.detailImage,
                  recipeTitle: recipe.recipeTitle,
                  prepTime: recipe.prepTime,
                  timeIcon: recipe.timeIcon,
                  ingredients: recipe.ingredients,
                  steps: []),
            );
          }),
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(currentIndex: 0),
    );
  }
}
