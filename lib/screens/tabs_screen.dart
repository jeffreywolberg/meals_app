import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/';

  List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  void _selectPage(int idx) {
    setState(() {
      _selectedPageIndex = idx;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': "Your Favorites",
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    return Scaffold(
      appBar: AppBar(
        // title: Text('helo'),
        title: Text(_pages[_selectedPageIndex]['title']),
        //   bottom: TabBar(
        //     // onTap: (index) {
        //     //   isBottomTapped = false;
        //     //   _selectPage(index);
        //     // },
        //     tabs: [
        //       Tab(
        //         icon: Icon(Icons.category),
        //         text: 'Categories',
        //       ),
        //       Tab(
        //         icon: Icon(Icons.star),
        //         text: 'Favorites',
        //       ),
        //     ],
        //   ),
      ),

      drawer: MainDrawer(),

      body: _pages[_selectedPageIndex]['page'],
      //   TabBarView(children: [
      //   CategoriesScreen(),
      //   FavoritesScreen(),
      // ]),

      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.shifting,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
      // ),
    );
  }
}
