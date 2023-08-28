import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/providers/favourites_provider.dart';
import 'package:meals/providers/filters_provider.dart';
class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPage = 0;
  var currentTitle = 'Categories';

  void _currentPageIndex(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
     await Navigator.of(context).push<Map<Filters,bool>>(
        MaterialPageRoute(
          builder: (context) =>const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals=ref.watch(filteredMealsProvider);
    Widget activeScreen = CategoriesScreen(
      availableMeals: 
      availableMeals
      ,
    );
    if (_selectedPage == 1) {
      final favouriteMeals=ref.watch(favouriteMealsProvider);
      activeScreen = MealsScreen(
        meal: favouriteMeals,
      );
      currentTitle = 'Your Favourites';
    }
    return Scaffold(
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      appBar: AppBar(
        title: Text(currentTitle),
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: _currentPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites')
        ],
      ),
    );
  }
}
