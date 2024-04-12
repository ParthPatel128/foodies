import 'package:flutter/material.dart';
import 'package:foodies/auth/first_page.dart';
import 'package:foodies/home.dart';
import 'package:get_storage/get_storage.dart';

import 'constant/assets_path.dart';
import 'intro_pages/intro_slider.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Center(
            child: Image.asset(
          splashLogo,
        )),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      () {
        if(box.read("isFirstTime") == true){
          if(box.read("isLogin")==true){
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>const Home(),
                ));
          }else{
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>const FirstPage(),
                ));
          }
        }else{

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>IntroSlider(),
              ));
        }


      },
    );
  }
}
