import 'package:flutter/material.dart';
import 'package:movies_app/home/tabs/browser_screen.dart';
import 'package:movies_app/home/tabs/home_screen.dart';
import 'package:movies_app/home/tabs/search_screen.dart';
import 'package:movies_app/home/tabs/watchlist_screen.dart';

class HomeLayout extends StatefulWidget {
static const String routeName="home_layout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
int index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121312),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xff1A1A1A)
        ),
        child: BottomNavigationBar(
          onTap: (neIndex){
            index=neIndex;
            setState((){});
          },
          currentIndex: index,
          //fixedColor: Color(),
          selectedIconTheme: IconThemeData(
            color: Colors.yellow
          ),
          items: [
            BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/home_icon.png")),label: "Home"),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/search.png")),label: "Search"),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/icon_browser.png")),label: "Browser"),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/icon_watch_list.png")),label: "WatchList"),
          ],
        ),
      ),
      body: tabsScreens[index],
    );
  }
  //commit
  List<Widget> tabsScreens=[
    HomeScreen(),
    SearchScreen(),
    BrowserScreen(),
    WatchListScreen()
  ];
}
