import 'package:flutter/material.dart';
import 'package:receitas_refeicoes/data/dummy_data.dart';
import 'package:receitas_refeicoes/models/meal.dart';
import 'package:receitas_refeicoes/models/settings.dart';
import 'package:receitas_refeicoes/screens/categories_meals_screen.dart';
import 'package:receitas_refeicoes/screens/meal_detail_screen.dart';
import 'package:receitas_refeicoes/screens/settings_screen.dart';
import 'package:receitas_refeicoes/screens/tabs_screen.dart';
import 'package:receitas_refeicoes/utils/app_routes.dart';

void main() => runApp(const DeliMeal());

class DeliMeal extends StatefulWidget {
  const DeliMeal({Key? key}) : super(key: key);

  @override
  State<DeliMeal> createState() => _DeliMealState();
}

class _DeliMealState extends State<DeliMeal> {
  Settings settings = Settings();
  List<Meal> availableMeals = dummyMeals;

  void filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Receitas DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        fontFamily: 'Raleway',
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleSmall:
                  const TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed'),
            ),
      ),
      routes: {
        AppRoutes.home: (ctx) => const TabsScreen(),
        AppRoutes.categoriesMeals: (ctx) =>
            CategoriesMealsScreen(meals: availableMeals),
        AppRoutes.mealDetail: (ctx) => const MealDetailScreen(),
        AppRoutes.settings: (ctx) => SettingsScreen(
              onSettingsChanged: filterMeals,
              settings: settings,
            ),
      },
    );
  }
}
