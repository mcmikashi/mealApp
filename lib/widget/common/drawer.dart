import 'package:flutter/material.dart';
import 'package:meals_app/screens/filter.dart';
import 'package:meals_app/screens/tabs.dart';

class DefaultDrawer extends StatelessWidget {
  const DefaultDrawer({super.key});

  Widget buildListTitle(String title, IconData icon, Function onTapGoToPage) {
    return ListTile(
      leading: Icon(icon, size: 24),
      title: Text(title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      onTap: () => onTapGoToPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            color: Theme.of(context).primaryColorLight,
            child: const Center(
                child: Text(
              "Meal's App",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
            )),
          ),
          const SizedBox(
            height: 5,
          ),
          buildListTitle(
              "Meals",
              Icons.restaurant,
              () => Navigator.pushReplacementNamed(
                  context, TabsScreen.routeName)),
          buildListTitle(
              "Filter",
              Icons.search,
              () => Navigator.pushReplacementNamed(
                  context, FilterScreen.routeName))
        ],
      ),
    );
  }
}
