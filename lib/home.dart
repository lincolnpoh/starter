import 'package:flutter/material.dart';
import 'card1.dart';
import 'card2.dart';
import 'card3.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //state variables and functions
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    const Card1(), //Display Card1
    const Card2(), //Display Card2
    const Card3(), //Display Card3
  ];

  void _onItemTapped(int index) {
    //setState() notifies the framework (flutter) the state of this object has changed, //then rebuilds this widget internally
    //If we don't specify setState() here, the screen UI will not reflect any changes//
    setState(() {
      //the selected index is the state being tracked by _HomeState
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fooderlich'),
        //replacement of deprecated headline6
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
      ),

      //show selected tab
      body: pages[_selectedIndex],

      //bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        //set selected tab bar
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card3',
          ),
        ],
      ),
    );
  }
}
