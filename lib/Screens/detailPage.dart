import  'package:cloud_firestore/cloud_firestore.dart';
import  'package:flutter/material.dart';
import 'package:travelplanning/Screens/bookingPage.dart';


import '../misc/colors.dart';
import '../widgets/appButtons.dart';
import '../widgets/appLargeText.dart';
import '../widgets/appText.dart';
import '../widgets/responsiveButton.dart';
import 'navpages/mainPage.dart';

class DetailPage extends StatefulWidget {
  final String documentId;
  const DetailPage({Key? key, required this.documentId}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<DocumentSnapshot> getPlaceData(String documentId) {
    return firestore.collection('places').doc(documentId).snapshots();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.documentId);
    return StreamBuilder<DocumentSnapshot>(
      stream: getPlaceData(widget.documentId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var placeData = snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            body: SizedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: double.maxFinite,
                      height: 350,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(placeData['imageUrl']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 40,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const MainPage(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.arrow_back),
                          color: Colors.white,
                          iconSize: 30,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 320,
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 30),
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppLargeText(
                                text: placeData['title'],
                                color: Colors.black.withOpacity(0.8),
                              ),
                              AppLargeText(
                                text: "\$${placeData['price']}",
                                color: AppColors.mainColor,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: AppColors.mainColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              AppText(
                                text: placeData['address'],
                                color: AppColors.texColor1,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(5, (index) {
                                  return Icon(
                                    Icons.star,
                                    color: index < gottenStars
                                        ? AppColors.starColor
                                        : AppColors.textColor2,
                                  );
                                }),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              AppText(
                                text: "(4.0)",
                                color: AppColors.textColor2,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          AppLargeText(
                            text: "People",
                            color: Colors.black.withOpacity(0.8),
                            size: 20,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          AppText(
                            text: "Number of people in your group",
                            color: AppColors.mainTextColor,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Wrap(
                            children: List.generate(5, (index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: AppButtons(
                                    size: 50,
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    backgroundColor: selectedIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    borderColor: selectedIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    text: (index + 1).toString(),
                                  ),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //description
                          AppLargeText(
                            text: "Description",
                            color: Colors.black.withOpacity(0.8),
                            size: 20,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppText(
                            text: placeData['description'],
                            color: AppColors.mainTextColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const BookingPage(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          AppButtons(
                            size: 60,
                            color: AppColors.textColor2,
                            backgroundColor: Colors.white,
                            borderColor: AppColors.textColor2,
                            isIcon: true,
                            icon: Icons.favorite_border,
                            
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                            ResponsiveButton(
                              isResponsive: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
