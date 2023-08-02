import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class main_page extends StatefulWidget {
  const main_page({Key? key}) : super(key: key);

  @override
  State<main_page> createState() => _main_pageeState();
}

class _main_pageeState extends State<main_page> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned(child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("Assets/Images/Group 94.png"),
                      fit: BoxFit.cover,
                )
              ),

            )),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 595, width: 400, ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      height: 40,
                      width: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('Assets/Images/Rectangle 9.png'),
                          )
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 200,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      onPrimary: Colors.white,
                    ),
                    onPressed: (){

                    },
                    child: Text('Sign in', style: TextStyle(fontSize: 20
                    ),),
                  ),

                ),
                SizedBox(height: 0,),


                // Container(

                  // width: 200,
                  SizedBox(height: 10, width: 0,), // Optional spacing between widgets

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.grey
                      ),
                      onPressed: () {
                        // Button action
                      },
                      child: Text('Sign up', style: TextStyle(fontSize: 20),),
                    ),
                // )



              ],
            ),
          ],
        ),
      ),

    );
  }
}
