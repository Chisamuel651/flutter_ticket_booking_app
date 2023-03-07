import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ticket_booking/screens/home_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  // create a variable that keeps track of the _widgetOptions[] value
  int _selectedIndex = 0;
  // we have to provide 4 different widgets for the different tabs we are having
  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    const Text("Search"),
    const Text("Ticket"),
    const Text("Profile")
  ];

  // void method doesnt do doesnt return but something happens
  void _onItemTapped(int index) {
    // Notify the framework that the internal state of this object has changed.
    setState(() {
      _selectedIndex = index;
    });
    // print('Tapped number is ${_selectedIndex}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // scaffold widgets
      // appBar: AppBar(
      //   title: const Text("My ticket"),
      // ),

      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blueGrey,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color(0xFF526480),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
              label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
              label: "Ticket"),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
              label: "Profile")
        ],
      ),
    );
  }
}
