import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ResetPass extends StatefulWidget {
  const ResetPass({Key? key}) : super(key: key);

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  final TextEditingController _emailController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void resetPassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: _emailController.text);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please check your email")));
    } on FirebaseAuthException catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(err.message.toString()),
        backgroundColor: Colors.red,
      ));
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                margin: const EdgeInsets.only(left: 0, top: 0),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                )),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Enter email address",
                    style: const TextStyle(
                        fontFamily: 'WorkSansSemiBold',
                        fontSize: 20.0,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      final RegExp emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      if (!emailValid.hasMatch(value)) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                    style: const TextStyle(
                        fontFamily: 'WorkSansSemiBold',
                        fontSize: 16.0,
                        color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      border: InputBorder.none,
                      hintText: 'example@gmail.com',
                      hintStyle: TextStyle(
                          fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Security Question",
                    style: const TextStyle(
                        fontFamily: 'WorkSansSemiBold',
                        fontSize: 20.0,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: const TextStyle(
                        fontFamily: 'WorkSansSemiBold',
                        fontSize: 16.0,
                        color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      border: InputBorder.none,
                      hintText: 'What is your favourite hobby?',
                      hintStyle: TextStyle(
                          fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      "Back to ",
                      style: TextStyle(color: Colors.grey.shade800, fontSize: 16),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    )
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey, // Background color
                          onPrimary:
                              Colors.white, // Text Color (Foreground color)
                        ),
                        onPressed: () {
                          resetPassword();
                        },
                        child: Text(
                          "Send",
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Do you have an account? ",
                    style: const TextStyle(
                        fontFamily: 'WorkSansSemiBold',
                        fontSize: 16.0,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey, // Background color
                          onPrimary:
                              Colors.white, // Text Color (Foreground color)
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed("/register");
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(fontSize: 20),
                        )),
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
