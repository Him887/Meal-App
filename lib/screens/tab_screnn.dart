import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favourites_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

// class TabScreen extends StatefulWidget {
//   @override
//   _TabScreenState createState() => _TabScreenState();
// }

// class _TabScreenState extends State<TabScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(length: 2, child: Scaffold(
//       appBar: AppBar(
//         title: Text("Meals"),
//         bottom: TabBar(tabs: [
//           Tab(icon: Icon(Icons.category), text: "Categories",),
//           Tab(icon: Icon(Icons.favorite), text: "Favourites",),
//         ]),
//       ),
//       body: TabBarView(children: [
//         CategoriesScreen(),
//         Favourites()
//       ]),
//       ));
//   }
// }

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String,Object>> _pages = [
    {'page': CategoriesScreen(), 'title': "Meals"}, 
    {'page': FavouritesScreen(), 'title': "Favourites"}
  ];

  int _selecttedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selecttedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selecttedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selecttedPageIndex]['page'], 
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: _selectPage,
        currentIndex: _selecttedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text("Favourites",),
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
