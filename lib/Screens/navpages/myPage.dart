import 'package:flutter/material.dart';
import 'package:travelplanning/Screens/history.dart';

// import 'package:travelplanning/Screens/delete.dart';

import '../personalInfo.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPage();
}

class _MyPage extends State<MyPage> with TickerProviderStateMixin {
  bool showSearchBar = false;
  int idx = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 4, vsync: this);

    return Scaffold(
      body: Stack(
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
          Container(
            padding: EdgeInsets.only(left: 35, top: 90),
            child: Text(
              'Profile',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 250,
              right: 30,
              left: 30,
            ),
            child: Column(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => PersonalInfo()));
                    },
                    child: Text(
                      'Personal Information',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 23,
                        color: Colors.grey.shade600,
                      ),
                    ))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 340,
              right: 30,
              left: 30,
            ),
            child: Column(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const History(),
                        ),
                      );
                    },
                    child: Text(
                      'History',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 23,
                        color: Colors.grey.shade600,
                      ),
                    ))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 430,
              right: 30,
              left: 30,
            ),
            child: Column(
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'My Trips',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 23,
                        color: Colors.grey.shade600,
                      ),
                    ))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 520,
              right: 30,
              left: 30,
            ),
            child: Column(
              children: [
                TextButton(
                    onPressed: () {
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //     builder: (context) =>  DeleteAccount()));
                    },
                    child: Text(
                      'Delete Account',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 23,
                        color: Colors.grey.shade600,
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
