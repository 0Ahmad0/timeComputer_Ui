

import 'package:flutter/material.dart';
import 'package:time_computer/constants/const.dart';

import 'chats.dart';
import 'favorite.dart';
import 'group.dart';
import 'home.dart';
import 'shopping.dart';
class BottomBarScreen extends StatefulWidget {
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 2;

  @override
  void initState() {
    _pages = [
      {
        'page': Shopping(),
      },
      {
        'page': Groups(),
      },
      {
        'page': Home(),
      },
      {
        'page': Favorite(),
      },
      {
        'page': Chats(),
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomAppBar(
        child: BottomNavigationBar(
          onTap: _selectPage,
          unselectedItemColor: Colors.black26,
          selectedItemColor: primaryColor,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_sharp),
              title: Text('Shopping'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group_rounded),
              title: Text('Group'),
            ),
            BottomNavigationBarItem(
              activeIcon: null,
              icon: Icon(null),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              title: Text('favorite'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble),
              title: Text('Chats'),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          hoverElevation: 10,
          splashColor: Colors.grey,
          tooltip: 'Home',
          elevation: 4,
          child: Icon(Icons.home,color: _selectedPageIndex == 2? primaryColor : Colors.black26,),
          onPressed: () => setState(() {
            _selectedPageIndex = 2;
          }),
        ),
      ),
    );
  }
}
