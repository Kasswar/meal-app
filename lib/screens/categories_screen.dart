import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map((catData) => CategoryItem(
                  id: catData.id,
                  title: catData.title,
                  color: catData.color,
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, //أكبر تمدد للعنصر
          childAspectRatio: 1.5, //نسبة طول العنصر إلى عرضه
          crossAxisSpacing: 20, //المسافة بين العناصر بالعرض
          mainAxisSpacing: 20, //المسافة بين العناصر بالطول
        ),
      ),
    );
  }
}
