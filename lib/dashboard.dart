import 'package:flutter/material.dart';
import 'package:my_app/coreFunctionality/core.dart';
import 'package:my_app/pages/home.dart';
import 'package:my_app/pages/patternDetails.dart';
import 'package:my_app/pages/profile.dart';
import 'package:my_app/pages/saved.dart';
import 'package:my_app/pages/add.dart';

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
    const Add(),
    const Saved(),
    const Profile(),
    const PatternDetails(),
  ];

// function to set index based on what is clicked
  void _onItemClicked(int index) {
    if (index < 4) {
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
          backgroundColor: Theme.of(context).colorScheme.surface,
          type: BottomNavigationBarType.fixed,
          currentIndex: navBarIndex,
          onTap: _onItemClicked,
          // nav bar items and icons
          items: [
            //home nav bar
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: (Core.getInstance().dashboardPageIndex == 0)
                      ? Theme.of(context).colorScheme.onSurface
                      : Theme.of(context).colorScheme.onPrimary,
                  size: 34.0,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                  color: (Core.getInstance().dashboardPageIndex == 1)
                      ? Theme.of(context).colorScheme.onSurface
                      : Theme.of(context).colorScheme.onPrimary,
                  size: 40.0,
                ),
                label: "Add"),
            //saved nav bar
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.star_rate,
                  color: (Core.getInstance().dashboardPageIndex == 2)
                      ? Theme.of(context).colorScheme.onSurface
                      : Theme.of(context).colorScheme.onPrimary,
                  size: 34.0,
                ),
                label: "Saved"),
            //profile nav bar
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.face,
                  color: (Core.getInstance().dashboardPageIndex == 3)
                      ? Theme.of(context).colorScheme.onSurface
                      : Theme.of(context).colorScheme.onPrimary,
                  size: 34.0,
                ),
                label: "Profile"),
          ],
        ),
        //display the screen of the current selected index
        body: screens.elementAt(Core.getInstance().dashboardPageIndex));
  }
}
