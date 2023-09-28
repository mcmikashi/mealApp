import 'package:flutter/material.dart';
import 'package:meals_app/widget/common/app_bar.dart';
import 'package:meals_app/widget/common/drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});
  static const routeName = "/filter";
  // final Function saveFilters;
  // final Map<String, bool> currentFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  @override
  initState() {
    // _isGlutenFree = widget.currentFilters['gluten']!;
    // _isLactoseFree = widget.currentFilters['lactose']!;
    // _isVegetarian = widget.currentFilters['vegetarian']!;
    // _isVegan = widget.currentFilters['vegan']!;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    void Function(bool) updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        description,
      ),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: 'filter'),
      drawer: const DefaultDrawer(),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text("Filter your meal"),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  _isGlutenFree,
                  (newValue) {
                    setState(
                      () {
                        _isGlutenFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only include lactose-free meals.',
                  _isLactoseFree,
                  (newValue) {
                    setState(
                      () {
                        _isLactoseFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals.',
                  _isVegetarian,
                  (newValue) {
                    setState(
                      () {
                        _isVegetarian = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals.',
                  _isVegan,
                  (newValue) {
                    setState(
                      () {
                        _isVegan = newValue;
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
