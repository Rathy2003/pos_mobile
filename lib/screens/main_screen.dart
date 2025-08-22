import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:learning/screens/contact_us.dart';
import 'package:learning/screens/home_screen.dart';
import 'package:learning/screens/menu_screen.dart';
import 'package:learning/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageViewController = PageController(initialPage: 0);
  int currentIndex = 0;
  List<String> pageTitleList = ["Home","Menu","Contact Us","Profile"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu, color: Colors.black, size: 30),
            );
          },
        ),
        title: Text(pageTitleList[currentIndex]),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_outlined,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {},
          ),
          SizedBox(width: 15),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              child: CircleAvatar(
                backgroundColor: Colors.amberAccent,
                backgroundImage: AssetImage("assets/images/profile_01.jpg"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text('Profile'),
              onTap: null,
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
            ListTile(
              leading: Icon(Icons.settings_outlined),
              title: Text('Settings'),
              onTap: null,
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageViewController,
        physics: NeverScrollableScrollPhysics(),
        children: const [
          HomeScreen(),
          MenuScreen(),
          ContactUs(),
          ProfileScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: CircleBorder(),
        child: Icon(
          Icons.home,
          color: currentIndex == 0 ? Colors.blue : Colors.black,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [Icons.home, Icons.menu, Icons.contact_page, Icons.person],
        activeIndex: currentIndex,
        activeColor: Colors.blueAccent,
        elevation: 1,
        leftCornerRadius: 0,
        rightCornerRadius: 0,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            _pageViewController.animateToPage(
              index,
              duration: Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
            );
          });
        },
        //other params
      ),
    );
  }
}
