import 'package:flutter/material.dart';
import 'package:foodies/auth/first_page.dart';
import 'package:foodies/intro_pages/indicator.dart';
import 'package:get_storage/get_storage.dart';

import '../constant/text.dart';
import '../home.dart';
import 'each_page.dart';

class IntroSlider extends StatefulWidget {
  @override
  _IntroSliderState createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {

  PageController controller= PageController();
  final storage = GetStorage();
  final messages = ["Add Address","Choose Favorite Food","Fastest Delivery"];
  final messages2 = [introPage1,introPage2,introPage3];
  final images = [
"assets/img/intro_1.png",
"assets/img/intro_2.png",
"assets/img/intro_3.png"
  ];
  int numberOfPages=3;
  int currentPage=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(
        children: <Widget>[PageView.builder(
          controller: controller,
          onPageChanged: (index){
            setState(() {
              currentPage=index;
            });
          },
          itemCount: numberOfPages,
          itemBuilder: (BuildContext context, int index) {
            return EachPage(messages[index],images[index],messages2[index]);
          },
        ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 260,
              decoration: BoxDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(),
                  Indicator(
                    controller: controller, pageCount: 3,
                  ),
                ],),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Home(),));
            },
              child:
              currentPage!=2? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 40),
                child: const Text("SKIP",
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      letterSpacing: 1
                    )),
              ):SizedBox(),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: InkWell(onTap: () {
              currentPage==1?controller.jumpToPage(currentPage=0):
              controller.jumpToPage(currentPage=1);
            },
              child:
              currentPage!=0? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 40),
                child: Icon(Icons.arrow_back_ios_new,)
              ):SizedBox(),
            ),
          ),
          currentPage==2?Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
                storage.write("isFirstTime", true);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FirstPage(),));
              },
              child: Container(
                height: 45,
                width: double.maxFinite,
                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 25),
                // padding: EdgeInsets.symmetric(vertical: 2),
                decoration: BoxDecoration(
                    color: Color(0xffFF683A),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Center(
                  child: (
                      Text("GET STARTED",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),)
                  ),
                ),
              ),
            ),
          ):Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
                currentPage==0?controller.jumpToPage(currentPage=1):
                controller.jumpToPage(currentPage=2)
                ;
              },
              child: Container(
                height: 45,
                width: double.maxFinite,
                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 25),
                // padding: EdgeInsets.symmetric(vertical: 2),
                decoration: BoxDecoration(
                    color: Color(0xffFF683A),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Center(
                  child: (
                      Text("NEXT",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),)
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}