import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:travelplanning/Screens/homePage.dart';

import 'package:travelplanning/Screens/signIn.dart';

import 'package:travelplanning/model/userModel.dart';




class RegistrationScreen extends StatefulWidget {

  const RegistrationScreen({Key? key}) : super(key: key);




  @override

  State<RegistrationScreen> createState() => _RegistrationScreenState();

}




class _RegistrationScreenState extends State<RegistrationScreen> {

  final _auth = FirebaseAuth.instance;




  // form key

  final _formkey = GlobalKey<FormState>();




  // editing Controller

  final firstNameEditingController = TextEditingController();

  final LastNameEditingController = TextEditingController();

  final emailEditingController = TextEditingController();

  final passwordEditingController = TextEditingController();

  final confirmPasswordEditingController = TextEditingController();





  @override

  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;

    double h = MediaQuery.of(context).size.height;




    // first name field

    final firstNameField = TextFormField(

      autofocus: false,

      controller: firstNameEditingController,

      keyboardType: TextInputType.name,

      validator: (value) {

        RegExp regex = RegExp(r'^.{3,}$');

        if (value!.isEmpty) {

          return ("First Name cannot be empty");

        }

        if (!regex.hasMatch(value)) {

          return ("Enter valid name(Min. 3 Character)");

        }

        return null;

      },

      onSaved: (value) {

        firstNameEditingController.text = value!;

      },

      textInputAction: TextInputAction.next,

      decoration: InputDecoration(

          prefixIcon: const Icon(Icons.account_circle),

          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),

          hintText: "First Name",

          border: OutlineInputBorder(

            borderRadius: BorderRadius.circular(10),

          )),

    );




    //second name field

    final LastNameField = TextFormField(

      autofocus: false,

      controller: LastNameEditingController,

      keyboardType: TextInputType.name,

      validator: (value) {

        if (value!.isEmpty) {

          return ("Last Name cannot be empty");

        }

        return null;

      },

      onSaved: (value) {

        LastNameEditingController.text = value!;

      },

      textInputAction: TextInputAction.next,

      decoration: InputDecoration(

          prefixIcon: const Icon(Icons.account_circle),

          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),

          hintText: "Last Name",

          border: OutlineInputBorder(

            borderRadius: BorderRadius.circular(10),

          )),

    );




    // email field

    final emailField = TextFormField(

      autofocus: false,

      controller: emailEditingController,

      keyboardType: TextInputType.emailAddress,

      validator: (value) {

        if (value!.isEmpty) {

          return ("Please Enter Your Email");

        }

        // reg expression for email validation

        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {

          return ("Please Enter a valid email");

        }

        return null;

      },

      onSaved: (value) {

        emailEditingController.text = value!;

      },

      textInputAction: TextInputAction.next,

      decoration: InputDecoration(

          prefixIcon: const Icon(Icons.mail),

          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),

          hintText: "Email",

          border: OutlineInputBorder(

            borderRadius: BorderRadius.circular(10),

          )),

    );




    // password field

    final passwordField = TextFormField(

      autofocus: false,

      controller: passwordEditingController,

      obscureText: true,

      validator: (value) {

        RegExp regex = RegExp(r'^.{6,}$');

        if (value!.isEmpty) {

          return ("Password is required for login");

        }

        if (!regex.hasMatch(value)) {

          return ("Please Enter Valid Password(Min. 6 Character)");

        }

        return null;

      },

      onSaved: (value) {

        passwordEditingController.text = value!;

      },

      textInputAction: TextInputAction.next,

      decoration: InputDecoration(

          prefixIcon: const Icon(Icons.vpn_key),

          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),

          hintText: "Password",

          border: OutlineInputBorder(

            borderRadius: BorderRadius.circular(10),

          )),

    );




    //Confirm password

    final confirmPasswordField = TextFormField(

      autofocus: false,

      controller: confirmPasswordEditingController,

      obscureText: true,

      validator: (value) {

        if (confirmPasswordEditingController.text !=

            passwordEditingController.text) {

          return "Password dont match";

        }

        return null;

      },

      onSaved: (value) {

        confirmPasswordEditingController.text = value!;

      },

      textInputAction: TextInputAction.done,

      decoration: InputDecoration(

          prefixIcon: const Icon(Icons.vpn_key),

          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),

          hintText: "Confirm Password",

          border: OutlineInputBorder(

            borderRadius: BorderRadius.circular(10),

          )),

    );




    // login/signup image

    final img = Container(

      width: w,

      height: 0.3 * h,

      decoration: const BoxDecoration(

        image: DecorationImage(

          image: AssetImage(

            "img/login Signup.png",

          ),

          fit: BoxFit.cover,

        ),

      ),

    );




    //SignUp button

    final SignUpButton = Material(

        elevation: 5,

        borderRadius: BorderRadius.circular(30),

        color: Colors.grey,

        child: MaterialButton(

          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),

          minWidth: MediaQuery.of(context).size.width,

          onPressed: () {

            signUp(emailEditingController.text, passwordEditingController.text);

          },

          child: const Text(

            "SignUp",

            textAlign: TextAlign.center,

            style: TextStyle(

                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),

          ),

        ));




    return Scaffold(

        appBar: AppBar(

          title: const Text("Travel Planning")),

        backgroundColor: Colors.white,

        body: Center(

          child: SingleChildScrollView(

            child: Container(

                color: Colors.white,

                padding:

                    const EdgeInsets.only(left: 20, bottom: 120, right: 20),

                child: Form(

                  key: _formkey,

                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,

                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: <Widget>[

                      img,

                      Padding(

                        padding: const EdgeInsets.only(left: 0),

                        child: Align(

                          alignment: Alignment.topLeft,

                          child: SizedBox(

                            width: 100,

                            height: 58,

                            child: Image.asset(

                              "img/minicar.png",

                              fit: BoxFit.fitWidth,

                            ),

                          ),

                        ),

                      ),

                      const SizedBox(

                        height: 15,

                      ),

                      firstNameField,

                      const SizedBox(

                        height: 15,

                      ),

                      LastNameField,

                      const SizedBox(

                        height: 15,

                      ),

                      emailField,

                      const SizedBox(height: 15),

                      passwordField,

                      const SizedBox(

                        height: 15,

                      ),

                      confirmPasswordField,

                      const SizedBox(

                        height: 15,

                      ),

                      SignUpButton

                    ],

                  ),

                )),

          ),

        ));

  }




  void signUp(String email, String password) async {

    if (_formkey.currentState!.validate()) {

      await _auth

          .createUserWithEmailAndPassword(email: email, password: password)

          .then((value) => {postDetailToFirestore()})

          .catchError((e) {

        Fluttertoast.showToast(msg: e!.message);

      });

    }

  }




  postDetailToFirestore() async {

    // calling our firestore

    //calling our user model

    //sending these values




    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    User? user = _auth.currentUser;




    UserModel userModel = UserModel();




    // writing all the values

    userModel.email = user!.email;

    userModel.uid = user.uid;

    userModel.firstName = firstNameEditingController.text;

    userModel.lastName = LastNameEditingController.text;




    await firebaseFirestore

        .collection("users")

        .doc(user.uid)

        .set(userModel.toMap());

    Fluttertoast.showToast(msg: "Account created successfully :) ");




    Navigator.pushAndRemoveUntil(

        (context),

        MaterialPageRoute(builder: (context) => const LoginPage()),

        (route) => false);

  }

}
