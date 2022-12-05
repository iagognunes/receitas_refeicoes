import 'package:flutter/material.dart';
import 'package:receitas_refeicoes/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);

  Widget createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget createSectionContainer(Widget child) {
    return Container(
      width: 330,
      height: 250,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(meal.title),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.star),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              createSectionTitle(context, 'Ingredientes'),
              createSectionContainer(
                ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: ((context, index) {
                    return Card(
                      color: Theme.of(context).colorScheme.secondary,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(meal.ingredients[index]),
                      ),
                    );
                  }),
                ),
              ),
              createSectionTitle(context, 'Passos'),
              createSectionContainer(
                ListView.builder(
                  itemCount: meal.steps.length,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                          title: Text(meal.steps[index]),
                        ),
                        const Divider(),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ));
  }
}
