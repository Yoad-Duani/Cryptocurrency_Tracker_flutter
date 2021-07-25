import 'package:crypto_stock_tracker_flutter/core/bottomNavigationAppbarItems.dart';
import 'package:crypto_stock_tracker_flutter/screen/homePage/view/homePage_Screen.dart';
import 'package:flutter/material.dart';
// import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/rendering.dart';
import 'package:crypto_stock_tracker_flutter/screen/portfolioPage/view/portfolioPage.dart';
//

// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
//

class MainScreenPage extends StatefulWidget {
  @override
  _MainScreenPageState createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  // bool _isVisible = true;
  int selectedIndex = 0;
  PageController _myPage = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    // PersistentTabController _controller;

    // _controller = PersistentTabController(initialIndex: 0);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        // centerTitle: true,
        title: Text(
          'Coin Tracker',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 21.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.refresh,
                size: 22.0,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 21.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                size: 22.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: _isVisible
      //     ? Container(
      //         height: 65.0,
      //         width: 65.0,
      //         child: FittedBox(
      //           child: FloatingActionButton(
      //             backgroundColor: Colors.black,
      //             onPressed: () {},
      //             child: Icon(
      //               Icons.add,
      //               color: Colors.white,
      //             ),
      //           ),
      //         ),
      //       )
      //     : null,
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.white,
          selectedItemBackgroundColor: Colors.grey[200],
          selectedItemIconColor: Colors.black,
          selectedItemLabelColor: Colors.black,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
            _myPage.jumpToPage(index);
            // if (index == 3) {
            //   _isVisible = false;
            // } else {
            //   _isVisible = true;
            // }
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.home,
            label: 'Home',
          ),
          FFNavigationBarItem(
            iconData: Icons.person,
            label: 'Portfolio',
          ),
          FFNavigationBarItem(
            iconData: Icons.notifications,
            label: 'Alerts',
          ),
          FFNavigationBarItem(
            iconData: Icons.settings,
            label: 'Settings',
          ),
        ],
      ),
      body: PageView(
        controller: _myPage,
        onPageChanged: (int) {
          // print('Page Changes to index $int');
          setState(() {
            selectedIndex = int;
            // if (int == 3) {
            //   _isVisible = false;
            // } else {
            //   _isVisible = true;
            // }
          });
        },
        children: <Widget>[
          homePage(),
          PortfolioPage(),
          Center(
            child: Container(
              child: Text('Empty Body 2'),
            ),
          ),
          Center(
            child: Container(
              child: Text('Empty Body 3'),
            ),
          )
        ],
        physics: AlwaysScrollableScrollPhysics(), // Comment this if you need to use Swipe. todo:
      ),
    );
  }
}
