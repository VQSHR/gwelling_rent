import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_index/index.dart';

import 'package:hook_up_rent/pages/home/tab_profile/index.dart';
import 'package:hook_up_rent/pages/home/tab_search/index.dart';

List tabViewList = [
  const TabIndex(),
  const TabSearch(),
  const TabProfile(),
];

List<BottomNavigationBarItem> barItemList = [
  const BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
  const BottomNavigationBarItem(label: 'Search', icon: Icon(Icons.search)),
  const BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.account_circle)),
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabViewList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: barItemList,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
