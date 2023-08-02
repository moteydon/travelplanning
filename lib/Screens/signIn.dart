import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:travelplanning/Screens/navpages/mainPage.dart';

import 'registrationScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // form key

  final _formkey = GlobalKey<FormState>();

  //editing Controller

  final TextEditingController emailEditingController = TextEditingController();

  final TextEditingController passwordEditingController =
      TextEditingController();

  // firebase

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    double h = MediaQuery.of(context).size.height;

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

    final loginButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey,
        child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signIn(emailEditingController.text, passwordEditingController.text);
          },
          child: const Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));

    return Scaffold(
        appBar: AppBar(
          title: const Text("Travel Planning"),
        ),
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
                      const Text(
                        "\"Let the adventure beign\"",
                        style: TextStyle(
                            color: Color.fromARGB(255, 89, 149, 197),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
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
                      const Row(
                        children: [
                          Text(
                            "Sign into your account",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      emailField,
                      const SizedBox(height: 15),
                      passwordField,
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          const Text(
                            "Forgot your password?",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      loginButton,
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text("Don't have an account? "),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegistrationScreen()));
                                },
                                child: const Text("SignUp",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)))
                          ])
                    ],
                  ),
                )),
          ),
        ));
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const MainPage())),
              })

          // ignore: body_might_complete_normally_catch_error

          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
