import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/categories/meals/details";

  Widget buildSelectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    });
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSelectionTitle(context, "Ingredients"),
            buildContainer(
                context,
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                        color: Theme.of(context).accentColor,
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(meal.ingredients[index])));
                  },
                  itemCount: meal.ingredients.length,
                )),
            buildSelectionTitle(context, "Steps"),
            buildContainer(
                context,
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(child: Text("# ${index + 1}")),
                          title: Text(meal.steps[index]),
                        ),
                        Divider(),
                      ],
                    );
                  },
                  itemCount: meal.steps.length,
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.delete),
          onPressed: () {
            Navigator.of(context).pop(mealId);
          }
      ),
    );
  }
}
