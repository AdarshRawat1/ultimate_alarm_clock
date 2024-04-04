import 'package:flutter/material.dart';
import 'package:ultimate_alarm_clock/app/modules/timer/views/timer_view.dart';
import 'package:ultimate_alarm_clock/app/modules/home/views/home_view.dart';


class HomeTimerSwitcherView extends StatefulWidget {
  @override
  _HomeTimerSwitcherViewState createState() => _HomeTimerSwitcherViewState();
}

class _HomeTimerSwitcherViewState extends State<HomeTimerSwitcherView> {
  final PageController _pageController = PageController();

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _selectedIndex = _pageController.page!.round();
      });
    });
  }

  void _onItemTapped(int index) {
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          HomeView(),
          TimerView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'Timer'),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
