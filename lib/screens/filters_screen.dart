import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = 'FiltersScreen';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFree = false;
  bool lactoseFree = false;
  bool vegan = false;
  bool vegetarian = false;

  @override
  initState() {
    glutenFree = widget.currentFilters['gluten'] as bool;
    lactoseFree = widget.currentFilters['lactoseFree'] as bool;
    vegan = widget.currentFilters['vegan'] as bool;
    vegetarian = widget.currentFilters['vegetarian'] as bool;
    super.initState();
  }

  Widget buildSwitchListTile(String title, String description,
      bool currentValue, void updateValue(bool newValue)) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters',
            style: TextStyle(
              fontFamily: "Anton",
              fontSize: 20,
            )),
        actions: [
          IconButton(
              onPressed: () {
                final Map<String, bool> selectedFilters = {
                  'gluten': glutenFree,
                  'lactoseFree': lactoseFree,
                  'vegan': vegan,
                  'vegetarian': vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection.",
              style: TextStyle(
                fontFamily: "Anton",
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                  "Gluten-free", "Only include gluten free meals", glutenFree,
                  (newValue) {
                setState(() {
                  glutenFree = newValue;
                });
              }),
              buildSwitchListTile("Lactose-free",
                  "Only include lactose free meals", lactoseFree, (newValue) {
                setState(() {
                  lactoseFree = newValue;
                });
              }),
              buildSwitchListTile("Vegan", "Only include vegan meals", vegan,
                  (newValue) {
                setState(() {
                  vegan = newValue;
                });
              }),
              buildSwitchListTile("Vegetarian",
                  "Only include vegetarian free meals", vegetarian, (newValue) {
                setState(() {
                  vegetarian = newValue;
                });
              }),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
