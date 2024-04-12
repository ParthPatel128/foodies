import 'package:flutter/material.dart';
import 'package:foodies/auth/signup_page.dart';

import '../constant/assets_path.dart';
import '../constant/text.dart';
import '../home.dart';
import 'login_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             SizedBox(
              height: MediaQuery.of(context).size.height*0.06,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Home(),));
              },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepOrange),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
                  margin: const EdgeInsets.only(right: 25),
                  child: const Text("Skip",
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 15,
                          fontWeight: FontWeight.w800
                      )),
                ),
              ),
            ),
            const SizedBox(height: 75),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 105),
              child: Image.asset(splashLogo),
            ),
            const SizedBox(height: 38),
            const Text("Welcome to FOODIES",style: TextStyle(
              color: Color(0xffFF683A),
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
            const SizedBox(height: 25),
            Text(loginText,style: const TextStyle(
              fontSize: 19,
            ),
            textAlign: TextAlign.center,),
            const SizedBox(height: 50),
           InkWell(onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
           },
             child: Container(
               width: double.maxFinite,
               margin: const EdgeInsets.symmetric(horizontal: 35),
               padding: const EdgeInsets.symmetric(vertical: 12),
               decoration: BoxDecoration(
                 color: const Color(0xffFF683A),
                 borderRadius: BorderRadius.circular(30),
                 boxShadow: [BoxShadow(
                   blurRadius: 1,
                   offset: const Offset(0,2),
                   color: Colors.grey.shade400
                 )]
               ),
               child:
               const Center(child: Text("Log In",style: TextStyle(
                 color: Colors.white,
                  fontSize: 20,
                 fontWeight: FontWeight.bold
               ),)),
             ),
           ),
           const SizedBox(height: 25,),
           InkWell(
             onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp(),));
             },
             child: Container(
               width: double.maxFinite,
               margin: const EdgeInsets.symmetric(horizontal: 35),
               padding: const EdgeInsets.symmetric(vertical: 12),
               decoration: BoxDecoration(
                 border: Border.all(color: const Color(0xffFF683A)),
                 borderRadius: BorderRadius.circular(30)
               ),
               child:
               const Center(child: Text("Sign Up",style: TextStyle(
                  fontSize: 20,
                 color: Color(0xffFF683A),
                 fontWeight: FontWeight.bold
               ),)),
             ),
           ),
          ],
        )],
      ),
    );
  }
}
