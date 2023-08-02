import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:travelplanning/Screens/navpages/searchPage.dart';
import 'package:travelplanning/Screens/searchPage.dart';
import 'package:travelplanning/widgets/appLargeText.dart';
import 'package:travelplanning/widgets/appText.dart';
import 'package:travelplanning/controller/firebaseImages.dart';

import '../misc/colors.dart';
import '../model/userModel.dart';
import 'detailPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // Greeting logged in user
  User? user = FirebaseAuth.instance.currentUser;

  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());

      setState(() {});
    });
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> getPlaceData(String category) {
    return firestore
        .collection('places')
        .where('category', isEqualTo: category)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    return StreamBuilder<dynamic>(
        stream: getPlaceData('Mountains'),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            var placeData = snapshot.data.docs;
            print(placeData);
          }
          return Scaffold(
              body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // menu text
              Container(
                padding: const EdgeInsets.only(top: 65, left: 20),
                child: Row(
                  children: [
                    Container(child: AppLargeText(text: "Greetings!!")),
                    Expanded(child: Container()),
                    IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SearchScreen(),
                              ));
                        },
                        icon: const Icon(Icons.search)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.notifications))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 25),
                child: AppText(
                    text: '${loggedInUser.firstName}' +
                        ' ' +
                        '${loggedInUser.lastName}'),
              ),
              const SizedBox(
                height: 25,
              ),

              // discover text
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: AppLargeText(text: "Discover"),
              ),
              const SizedBox(
                height: 20,
              ),

              // tabbar
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    controller: tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: CircleTabIndicator(
                        color: AppColors.mainColor, radius: 4),
                    tabs: const [
                      Tab(text: "Heritage"),
                      Tab(text: "Mountains"),
                      Tab(text: "Lake"),
                      Tab(text: "Waterfall"),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                height: 300,
                width: double.maxFinite,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    // Heritage Part
                    StreamBuilder<dynamic>(
                      stream: getPlaceData('Heritage'),
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          var placeData = snapshot.data.docs;
                          print(placeData);
                        }
                        return ListView.builder(
                          itemCount: snapshot.data.docs.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            final imageName =
                                heritageImages.keys.elementAt(index);
                            final imageUrl =
                                snapshot.data.docs[index]["imageUrl"];
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    documentId:
                                        snapshot.data.docs[index].id.toString(),
                                  ),
                                ));
                              },
                              child: FutureBuilder<String>(
                                future: firebase_storage
                                    .FirebaseStorage.instance
                                    .refFromURL(imageUrl)
                                    .getDownloadURL(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<String> snapshot) {
                                  if (snapshot.connectionState ==
                                          ConnectionState.done &&
                                      snapshot.hasData) {
                                    return Container(
                                      margin: const EdgeInsets.only(
                                          right: 15, top: 10),
                                      width: 200,
                                      height: 300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                        image: DecorationImage(
                                          image: NetworkImage(snapshot.data!),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Container(
                                      margin: const EdgeInsets.only(
                                          right: 15, top: 10),
                                      width: 200,
                                      height: 300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      child: const Center(
                                        child: Text('Error loading image'),
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      margin: const EdgeInsets.only(
                                          right: 15, top: 10),
                                      width: 200,
                                      height: 300,
                                      child: const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  }
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),

                    // Mountain Part
                    StreamBuilder<dynamic>(
                        stream: getPlaceData('Mountains'),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var placeData = snapshot.data.docs;
                            // print(placeData);
                          }
                          return ListView.builder(
                              itemCount: snapshot.data.docs.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                final imageName2 =
                                    mountainImages.keys.elementAt(index);
                                final imageUrl =
                                    snapshot.data.docs[index]["imageUrl"];
                                return InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => DetailPage(
                                            documentId: snapshot
                                                .data.docs[index].id
                                                .toString(),
                                          ),
                                        ),
                                      );
                                    },
                                    child: FutureBuilder<String>(
                                        future: firebase_storage
                                            .FirebaseStorage.instance
                                            .refFromURL(imageUrl)
                                            .getDownloadURL(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<String> snapshot) {
                                          if (snapshot.connectionState ==
                                                  ConnectionState.done &&
                                              snapshot.hasData) {
                                            return Container(
                                              margin: const EdgeInsets.only(
                                                  right: 15, top: 10),
                                              width: 200,
                                              height: 300,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.white,
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      snapshot.data!),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          } else if (snapshot.hasError) {
                                            return Container(
                                              margin: const EdgeInsets.only(
                                                  right: 15, top: 10),
                                              width: 200,
                                              height: 300,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.white,
                                              ),
                                              child: const Center(
                                                child:
                                                    Text('Error loading image'),
                                              ),
                                            );
                                          } else {
                                            return Container(
                                                margin: const EdgeInsets.only(
                                                    right: 15, top: 10),
                                                width: 200,
                                                height: 300,
                                                child: const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ));
                                          }
                                        }));
                              });
                        }),

                    // Lake Part
                    StreamBuilder<dynamic>(
                        stream: getPlaceData('Lake'),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var placeData = snapshot.data.docs;
                            print(placeData);
                          }
                          return ListView.builder(
                              itemCount: snapshot.data.docs.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                final imageName3 =
                                    mountainImages.keys.elementAt(index);
                                final imageUrl =
                                    snapshot.data.docs[index]["imageUrl"];
                                return InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => DetailPage(
                                            documentId: snapshot
                                                .data.docs[index].id
                                                .toString(),
                                          ),
                                        ),
                                      );
                                    },
                                    child: FutureBuilder<String>(
                                        future: firebase_storage
                                            .FirebaseStorage.instance
                                            .refFromURL(imageUrl)
                                            .getDownloadURL(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<String> snapshot) {
                                          if (snapshot.connectionState ==
                                                  ConnectionState.done &&
                                              snapshot.hasData) {
                                            return Container(
                                              margin: const EdgeInsets.only(
                                                  right: 15, top: 10),
                                              width: 200,
                                              height: 300,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.white,
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      snapshot.data!),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          } else if (snapshot.hasError) {
                                            return Container(
                                              margin: const EdgeInsets.only(
                                                  right: 15, top: 10),
                                              width: 200,
                                              height: 300,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.white,
                                              ),
                                              child: const Center(
                                                child:
                                                    Text('Error loading image'),
                                              ),
                                            );
                                          } else {
                                            return Container(
                                                margin: const EdgeInsets.only(
                                                    right: 15, top: 10),
                                                width: 200,
                                                height: 300,
                                                child: const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ));
                                          }
                                        }));
                              });
                        }),

                    // Waterfall Part
                    StreamBuilder<dynamic>(
                        stream: getPlaceData('Waterfall'),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var placeData = snapshot.data.docs;
                            print(placeData);
                          }
                          return ListView.builder(
                              itemCount: snapshot.data.docs.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                final imageName3 =
                                    mountainImages.keys.elementAt(index);
                                final imageUrl =
                                    snapshot.data.docs[index]["imageUrl"];
                                return InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => DetailPage(
                                            documentId: snapshot
                                                .data.docs[index].id
                                                .toString(),
                                          ),
                                        ),
                                      );
                                    },
                                    child: FutureBuilder<String>(
                                        future: firebase_storage
                                            .FirebaseStorage.instance
                                            .refFromURL(imageUrl)
                                            .getDownloadURL(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<String> snapshot) {
                                          if (snapshot.connectionState ==
                                                  ConnectionState.done &&
                                              snapshot.hasData) {
                                            return Container(
                                              margin: const EdgeInsets.only(
                                                  right: 15, top: 10),
                                              width: 200,
                                              height: 300,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.white,
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      snapshot.data!),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          } else if (snapshot.hasError) {
                                            return Container(
                                              margin: const EdgeInsets.only(
                                                  right: 15, top: 10),
                                              width: 200,
                                              height: 300,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.white,
                                              ),
                                              child: const Center(
                                                child:
                                                    Text('Error loading image'),
                                              ),
                                            );
                                          } else {
                                            return Container(
                                                margin: const EdgeInsets.only(
                                                    right: 15, top: 10),
                                                width: 200,
                                                height: 300,
                                                child: const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ));
                                          }
                                        }));
                              });
                        }),
                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLargeText(
                      text: "Top Destination",
                      size: 22,
                    ),
                    AppText(text: "See all", color: AppColors.texColor1)
                  ],
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              Container(
                height: 120,
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 20),
                child: ListView.builder(
                  itemCount: topDestinationImages.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final imageName =
                        topDestinationImages.keys.elementAt(index);
                    final imageUrl =
                        'gs://travelplanning-64738.appspot.com/topDestination/$imageName';

                    return FutureBuilder<String>(
                      future: firebase_storage.FirebaseStorage.instance
                          .refFromURL(imageUrl)
                          .getDownloadURL(),
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          // Display a placeholder or loading indicator while fetching the URL
                          return CircularProgressIndicator();
                        }
                        if (snapshot.hasError) {
                          // Handle the error if URL retrieval fails
                          return Text('Error retrieving image URL');
                        }
                        if (snapshot.hasData) {
                          String httpsUrl = snapshot.data!;
                          return Container(
                            margin: const EdgeInsets.only(right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: NetworkImage(httpsUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  child: AppText(
                                    text: topDestinationImages.values
                                        .elementAt(index),
                                    color: AppColors.textColor2,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        // Handle other snapshot states if necessary
                        return Container();
                      },
                    );
                  },
                ),
              )
            ],
          ));
        });
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
