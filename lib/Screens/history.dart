import 'package:flutter/material.dart';

class History extends StatefulWidget {
 const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 428,
        height: 926,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Colors.white),
        child: Stack(
        children: [
          Positioned(
            left: 0,
              top: 0,
              child: Container(
                width: 428,
                height: 926,
                decoration: const BoxDecoration(color: Colors.white),
              ),
            ),
            const Positioned(
              left: 35,
              top: 74,
              child: Text(
                'My Trips',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontFamily: 'Akshar',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              left: 14,
              top: 21,
              child: SizedBox(
                width: 21,
                height: 16,
                child: Stack(
                  children: [
                    Positioned(
                      left: 3,
                      top: 8,
                      child: Container(
                        width: 18,
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 0.50,
                              strokeAlign: BorderSide.strokeAlignCenter,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 1,
                      top: 7.54,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(-0.76),
                        child: Container(
                          width: 10.99,
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.50,
                                strokeAlign: BorderSide.strokeAlignCenter,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 7,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(0.98),
                        child: Container(
                          width: 10.82,
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.50,
                                strokeAlign: BorderSide.strokeAlignCenter,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              left: 361,
              top: 48,
              child: Container(
                width: 46,
                height: 43,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('img/patan-durbar.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 17,
              top: 161,
              child: Container(
                width: 400,
                height: 311,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 400,
                        height: 311,
                        decoration: ShapeDecoration(
                          image: const DecorationImage(
                            image: AssetImage('img/patan-durbar.jpg'),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 32,
                      top: 235,
                      child: SizedBox(
                        width: 134,
                        height: 37.31,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 4,
                              top: 21.60,
                              child: Container(
                                width: 14,
                                height: 15.71,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('img/button-one.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 9,
                              top: 20,
                              child: SizedBox(
                                width: 125,
                                height: 16,
                                child: Text(
                                  'Nepal, South Asia',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFFE7E7E7),
                                    fontSize: 16,
                                    fontFamily: 'Akshar',
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 0,
                              top: 0,
                              child: SizedBox(
                                width: 75,
                                height: 21.60,
                                child: Text(
                                  'Pokhara',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Akshar',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 9,
                              top: 24.55,
                              child: Container(
                                width: 4,
                                height: 3.93,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFF031A2A),
                                  shape: OvalBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 846,
              child: Container(
                width: 428,
                height: 80,
                decoration: const BoxDecoration(color: Color(0xFFE3E3E3)),
              ),
            ),
            
            Positioned(
              left: 14,
              top: 503,
              child: Container(
                width: 400,
                height: 330,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: AssetImage("img/manaslu.jpeg"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 49,
              top: 760,
              child: Container(
                width: 137,
                height: 37.31,
                child: Stack(
                  children: [
                    Positioned(
                      left: 4,
                      top: 21.60,
                      child: Container(
                        width: 14,
                        height: 15.71,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image:
                                NetworkImage("https://via.placeholder.com/14x16"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 9,
                      top: 20,
                      child: SizedBox(
                        width: 125,
                        height: 16,
                        child: Text(
                          'Nepal, South Asia',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFE7E7E7),
                            fontSize: 16,
                            fontFamily: 'Akshar',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 0,
                      top: 0,
                      child: SizedBox(
                        width: 137,
                        height: 22,
                        child: Text(
                          'Machhapuchhre',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Akshar',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 9,
                      top: 24.55,
                      child: Container(
                        width: 4,
                        height: 3.93,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF031A2A),
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              left: 255,
              top: 136,
              child: Text(
                '2 Jan - 9 Jan, 2023',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Akshar',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Positioned(
              left: 207,
              top: 477,
              child: Text(
                '17 March - 30 March, 2023',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Akshar',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
