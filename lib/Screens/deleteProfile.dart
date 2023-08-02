import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:travelplanning/Screens/signIn.dart';




class DeleteAccount extends StatelessWidget {

  TextEditingController email = TextEditingController();

  TextEditingController pass = TextEditingController();




  @override

  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

        child: Stack(

          children: [

            Container(

              decoration: BoxDecoration(

                image: DecorationImage(

                  image: AssetImage("img/bookingImage.png"),

                  fit: BoxFit.cover,

                ),

              ),

            ),

            Padding(

              padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.center,

                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  Container(

                    height: 100,

                    width: 100,

                    child: SvgPicture.asset("img/patan-durbar.jpg"),

                  ),

                  SizedBox(height: 10),

                  Text(

                    "Delete Account",

                    style: TextStyle(color: Colors.white, fontSize: 20),

                  ),

                  SizedBox(height: 20),

                  Padding(

                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),

                    child: TextField(

                      controller: email,

                      decoration: InputDecoration(

                        hintText: 'Email',

                        hintStyle: TextStyle(color: Colors.white),

                        enabledBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(10.0),

                          borderSide: BorderSide(color: Colors.white),

                        ),

                        focusedBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(10.0),

                          borderSide: BorderSide(color: Colors.blue),

                        ),

                        isDense: true,

                        contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),

                      ),

                      cursorColor: Colors.white,

                      style: TextStyle(color: Colors.white),

                    ),

                  ),
                  SizedBox(height: 20),

                  Padding(

                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),

                    child: TextField(

                      controller: pass,

                      decoration: InputDecoration(

                        hintText: 'Password',

                        hintStyle: TextStyle(color: Colors.white),

                        enabledBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(10.0),

                          borderSide: BorderSide(color: Colors.white),

                        ),

                        focusedBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(10.0),

                          borderSide: BorderSide(color: Colors.blue),

                        ),

                        isDense: true,

                        contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),

                      ),

                      cursorColor: Colors.white,

                      style: TextStyle(color: Colors.white),

                    ),

                  ),

                  SizedBox(height: 20),

                  GestureDetector(

                    onTap: () {

                      print("Delete Account Clicked Event");

                      _deleteAccount(context, email.text, pass.text);

                      Navigator.pushReplacement(

                        context,

                        MaterialPageRoute(

                            builder: (context) => const LoginPage()),

                      );

                    },

                    child: Text(

                      "Delete Account",

                      style: TextStyle(color: Colors.white),

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




  Future<void> _deleteAccount(

      BuildContext context, String email, String password) async {

    try {

      UserCredential userCredential = await FirebaseAuth.instance

          .signInWithEmailAndPassword(email: email, password: password);




      if (userCredential.user != null) {

        await _deleteUserFromFirestore(userCredential.user!.uid);

        await userCredential.user!.delete();




        // Account deleted successfully

        print("User account deleted successfully.");

        _showSnackBar(context, "User account deleted successfully.");

        _clearFields();

      } else {

        // User is not signed in or does not exist

        print("User does not exist or is not signed in.");

        _showSnackBar(context, "User does not exist or is not signed in.");

      }

    } on FirebaseAuthException catch (e) {

      if (e.code == 'wrong-password') {

        // Incorrect password

        print("Wrong password. Please try again.");

        _showSnackBar(context, "Wrong password. Please try again.");

      } else {


        print("Error deleting user account: ${e.message}");

        _showSnackBar(context, "Error deleting user account: ${e.message}");

      }

    } catch (e) {

      // General error

      print("Error deleting user account: $e");

      _showSnackBar(context, "Error deleting user account: $e");

    }

  }




  Future<void> _deleteUserFromFirestore(String userId) async {

    try {

      await FirebaseFirestore.instance.collection('users').doc(userId).delete();

      print("User deleted from Firestore successfully.");

    } catch (e) {

      print("Error deleting user from Firestore: $e");

    }

  }

  void _showSnackBar(BuildContext context, String message) {

    ScaffoldMessenger.of(context).showSnackBar(

      SnackBar(

        content: Text(message),

      ),

    );

  }


  void _clearFields() {

    email.clear();

    pass.clear();

  }

}