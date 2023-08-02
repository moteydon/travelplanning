import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../misc/colors.dart';
import '../widgets/appLargeText.dart';
import '../widgets/appText.dart';


class CoverPage extends StatefulWidget {
  const CoverPage({super.key});

  @override
  State<CoverPage> createState() => _CoverPageState();
}

class _CoverPageState extends State<CoverPage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: 
        GestureDetector(
          child: PageView.builder(
            scrollDirection: Axis.vertical,
              itemCount: images.length,
              itemBuilder: (_, index) {
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "img/" + images[index]
        
                    ),
                    fit: BoxFit.cover
                  )
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppLargeText(text: "Trips"),
                  AppText(text: "Heritage", size: 30,),
                  SizedBox(height: 20,),
                  Container(
                    width: 250,
                    child: AppText(
                      text: "Heritages explores give you an incredible sense of freedom along with endurance test",
                      color: AppColors.textColor2,
                      size: 14,
                    ),
                  ),
                  SizedBox(height: 40,),
        
                ],
                  ),
                  Column(
                    children: List.generate(3, (indexDots){
                      return Container(
                        margin: const EdgeInsets.only(bottom:2),
                        width: 8,
                        height: index==indexDots?25:8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color:index==indexDots? AppColors.mainColor:AppColors.mainColor.withOpacity(0.3)
                        ),
                      );
                }),
                  )
              ],
                  )
                )
              );
          }),
        ),
    );
  }
}