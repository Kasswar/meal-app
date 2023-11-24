import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static String routeName = "meal_detail_screen";
  final Function toggleFavorite;
  final Function isMealFavorites;

  MealDetailScreen(this.toggleFavorite, this.isMealFavorites);

  Widget buildSectionTitle(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(fontFamily: 'Anton', fontSize: 20),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
      height: 200,
      width: 300,
      child: Padding(padding: const EdgeInsets.all(10), child: child),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedMeal.title,
          style: TextStyle(fontSize: 14),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle("Ingredients"),
            buildContainer(ListView.builder(
              itemBuilder: (context, index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    selectedMeal.ingredients[index],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              itemCount: selectedMeal.ingredients.length,
            )),
            buildSectionTitle("Steps"),
            buildContainer(ListView.builder(
              itemBuilder: (context, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Text(
                        "#${index + 1}",
                        style: TextStyle(color: Colors.yellow),
                      ),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                ],
              ),
              itemCount: selectedMeal.steps.length,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()=> toggleFavorite(mealId),
        child: Icon(
          isMealFavorites(mealId) ? Icons.favorite : Icons.favorite_border,
        ),
      ),
    );
  }
}
