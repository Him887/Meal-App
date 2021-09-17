import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";

  final Function updateFilters;
  final Map<String, bool> filters;

  FiltersScreen(this.filters, this.updateFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree;
  bool _isLactoseFree;
  bool _isVegan;
  bool _isVegetarian;

  @override
  void initState() {
    _isGlutenFree = widget.filters['gluten'];
    _isLactoseFree = widget.filters['lactose'];
    _isVegan = widget.filters['vegan'];
    _isVegetarian = widget.filters['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters", style: Theme.of(context).textTheme.headline6),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.updateFilters({
                'lactose': _isLactoseFree,
                'gluten': _isGlutenFree,
                'vegetarian': _isVegetarian,
                'vegan': _isVegan,
              });
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            "Adjust Your Meal Selection",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Expanded(
          child: ListView(children: [
            SwitchListTile(
                title: Text("Gluten-Free"),
                subtitle: Text("Only Include Gluten-Free Food"),
                value: _isGlutenFree,
                onChanged: (newValue) {
                  setState(() {
                    _isGlutenFree = newValue;
                  });
                }),
            SwitchListTile(
              title: Text("Lactose-Free"),
              subtitle: Text("Only Include Lactose-Free Food"),
              value: _isLactoseFree,
              onChanged: (newValue) {
                setState(() {
                  _isLactoseFree = newValue;
                });
              },
            ),
            SwitchListTile(
                title: Text("Vegan"),
                subtitle: Text("Only Include Vegan Food"),
                value: _isVegan,
                onChanged: (newValue) {
                  setState(() {
                    _isVegan = newValue;
                  });
                }),
            SwitchListTile(
                title: Text("Vegetarian"),
                subtitle: Text("Only Include Vegetarian Food"),
                value: _isVegetarian,
                onChanged: (newValue) {
                  setState(() {
                    _isVegetarian = newValue;
                  });
                }),
          ]),
        ),
      ]),
    );
  }
}
