import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travelplanning/Screens/coverPage.dart';
import 'package:travelplanning/Screens/homePage.dart';
import 'package:travelplanning/Screens/finalPayment.dart';
import 'package:travelplanning/Screens/navpages/mainPage.dart';
import 'package:travelplanning/Screens/payment.dart';
import 'package:travelplanning/Screens/searchPage.dart';
import 'package:travelplanning/Screens/signIn.dart';
import 'package:travelplanning/Screens/welcomePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: LoginPage());
  }
}
