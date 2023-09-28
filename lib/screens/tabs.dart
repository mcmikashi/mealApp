import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/favorite.dart';
import 'package:meals_app/widget/common/app_bar.dart';
import 'package:meals_app/widget/common/drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  static const routeName = "/";

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Map<String, dynamic>> _selectedPage = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoriteScreen(), 'title': 'Favorite'},
  ];

  void _onNavigateToPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: DefaultAppBar(
              title: _selectedPage.elementAt(_selectedIndex)['title']),
          drawer: const DefaultDrawer(),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star), label: 'favorites')
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue.shade900,
            backgroundColor: Theme.of(context).primaryColorLight,
            onTap: _onNavigateToPage,
          ),
          body: Center(
            child: _selectedPage.elementAt(_selectedIndex)['page'],
          ),
        ));
  }
}
