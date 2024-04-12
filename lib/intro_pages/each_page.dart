import 'package:flutter/material.dart';

class EachPage extends StatelessWidget {
  final String message;
  final String message2;
  final String image;


  EachPage(this.message, this.image,this.message2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffFAFAFA),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: double.maxFinite,
              // padding: EdgeInsets.symmetric(vertical: 90, horizontal: 40),
              padding: EdgeInsets.only(right: 40,left: 40,top: 120,bottom: 70),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(155)),
                  color: Color(0xffFCEFE9)),
              child: Image.asset(
                image,
                fit: BoxFit.scaleDown,
                width: double.maxFinite,
                height: 200,
              ),
            ),
            SizedBox(height: 70,),
            Text(message,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 40,),
            Text(message2,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black54,
              letterSpacing: 1,
              fontWeight: FontWeight.w100,
              height: 1.8
            ),)
          ],
        ),
      ),
    );
  }
}
