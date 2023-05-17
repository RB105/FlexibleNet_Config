import 'package:flexible/view/navigation/currency_page.dart';
import 'package:flexible/view/navigation/users_page.dart';
import 'package:flutter/material.dart';

class CurrentScreen extends StatefulWidget {
  const CurrentScreen({super.key});

  @override
  State<CurrentScreen> createState() => _HomePageState();
}

class _HomePageState extends State<CurrentScreen> {
  final List<Widget> _pages = [const UsersPage(), const CurrencyPage()];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        fixedColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.attach_money_outlined), label: "")
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
