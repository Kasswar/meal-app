import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(IconData icon, String title, Function onTabFunction) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(
              icon,
              size: 30,
              color: Colors.red,
            ),
            title: Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Anton',
                color: Colors.black,
              ),
            ),
            onTap: onTabFunction as Function(),
          ),
          Divider(
            thickness: 2,
            color: Colors.red,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.purple[200],
            height: 83,
            width: double.infinity,
            child: Center(
              child: Text(
                "COOKING UP",
                style: TextStyle(
                  fontSize: 26,
                  fontFamily: 'RubickBeastly',
                ),
              ),
            ),
          ),
          buildListTile(Icons.restaurant, 'Meal', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile(Icons.settings, 'Filters', () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
