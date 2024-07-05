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

  //function to chnage colour of nav bar icons when pressed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Theme.of(context).colorScheme.primary,
          type: BottomNavigationBarType.fixed,
          currentIndex: navBarIndex,
          onTap: _onItemClicked,
          // nav bar items and icons
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: (Core.getInstance().dashboardPageIndex == 0)
                      ? Colors.red
                      : Colors.amber,
                  size: 34.0,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.star_rate,
                  color: (Core.getInstance().dashboardPageIndex == 1)
                      ? Colors.red
                      : Colors.amber,
                  size: 34.0,
                ),
                label: "Saved"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.face,
                  color: (Core.getInstance().dashboardPageIndex == 2)
                      ? Colors.red
                      : Colors.amber,
                  size: 34.0,
                ),
                label: "Profile"),
          ],
        ),
        //display the screen of the current selected index
        body: screens.elementAt(Core.getInstance().dashboardPageIndex));
  }
}
