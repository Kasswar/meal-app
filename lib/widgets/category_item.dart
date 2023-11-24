import 'package:flutter/material.dart';
import '/screens/category_meals_screen.dart';


class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  void selectCategory(BuildContext context){
    Navigator.of(context).pushNamed(CategoryMealsScreen.routeName,
    arguments: {
      'id':id,
      'title':title,
    });
  }

  const CategoryItem(
      {required this.id, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                colors: [color, Colors.black],
                begin: Alignment.center,
                end: Alignment.centerRight)),
      ),
    );
  }
}
