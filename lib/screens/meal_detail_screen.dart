import 'package:flutter/material.dart';
import 'package:receitas_refeicoes/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(meal.title),
        ),
      ),
      body: const Center(
        child: Text('Detalhes da Refeição'),
      ),
    );
  }
}
