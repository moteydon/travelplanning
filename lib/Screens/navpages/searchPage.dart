import 'package:flutter/material.dart';

class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10, right: 20, top: 30),
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.black,
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 180, top: 0),
              child: Text(
                "Settings",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 0,
              ),

              padding: EdgeInsets.symmetric(horizontal: 10),
              // padding: const EdgeInsets.only(left: 0, right: 230),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Text(
                        "Country",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Text(
                        "Customer Support",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Text(
                        "Privacy Policy",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("/feedback");
                      },
                      child: Text(
                        "Give us Feedback",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Text(
                        "About us",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      _showLogoutConfirmationDialog(context);
                    },
                    child: Text(
                      "Logout",
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

void _showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Logout'),
        content: Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              Navigator.of(context).pop(); // Close the screen
            },
            child: Text('Yes'),
          ),
        ],
      );
    },
  );
}
