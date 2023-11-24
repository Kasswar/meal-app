import 'package:flutter/material.dart';
import './dummy_data.dart';
import './models/meal.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactoseFree': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  void toggleFavorite(String mealId) {
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if(existingIndex>=0){
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    }else{
      setState(() {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
      });
    }
  }

  bool isMealFavorites(String mealId){
    return favoriteMeals.any((meal) => meal.id==mealId);
  }

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] == true && meal.isGlutenFree == false) {
          return false;
        }
        if (filters['lactoseFree'] == true && meal.isLactoseFree == false) {
          return false;
        }
        if (filters['vegan'] == true && meal.isVegan == false) {
          return false;
        }
        if (filters['vegetarian'] == true && meal.isVegetarian == false) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "meal_app",
      theme: ThemeData(
          primaryColor: Colors.purple,
          accentColor: Colors.purple[200],
          canvasColor: Colors.white,
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Colors.black,
              ),
              body2: TextStyle(
                color: Color.fromRGBO(27, 255, 27, 1),
              ),
              title: TextStyle(
                fontSize: 18,
                fontFamily: 'Anton',
                color: Colors.white,
              ))),
      //home: MyHomePage(),
      //home: CategoriesScreen(),
      routes: {
        '/': (context) => TabsScreen(favoriteMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(toggleFavorite,isMealFavorites),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(filters, setFilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal App"),
      ),
      body: CategoriesScreen(),
    );
  }
}
