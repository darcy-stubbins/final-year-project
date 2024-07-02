import 'package:flutter/material.dart';
import 'package:my_app/coreFunctionality/core.dart';
import 'package:my_app/pages/home.dart';
import 'package:my_app/pages/patternDetails.dart';
import 'package:my_app/pages/profile.dart';
import 'package:my_app/pages/saved.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int navBarIndex = 0;
// list of screens used for the index linking to files
  List<Widget> screens = [
    const Home(),
    const Saved(),
    const Profile(),
    const PatternDetails(),
  ];

// function to set index based on what is clicked
  void _onItemClicked(int index) {
    if (index < 3) {
      navBarIndex = index;
    }
    Core.getInstance().changeDashboardPageIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: navBarIndex,
          onTap: _onItemClicked,
          // nav bar items and icons
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.star_rate), label: "Saved"),
            BottomNavigationBarItem(icon: Icon(Icons.face), label: "Profile"),
          ],
        ),
        //display the screen of the current selected index
        body: screens.elementAt(Core.getInstance().dashboardPageIndex));
  }
}
