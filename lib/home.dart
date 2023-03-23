import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //state variables and functions
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    //TODO: Replace with Card1
    Container(
      color: Colors.red,
    ),
    //TODO: Replace with Card2
    Container(
      color: Colors.green,
    ),
    //TODO: Replace with Card3
    Container(
      color: Colors.blue,
    ),
  ];

  void _onItemTapped(int index) {
    //setState() notifies the framework (flutter) the state of this object has changed, //then rebuilds this widget internally
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
