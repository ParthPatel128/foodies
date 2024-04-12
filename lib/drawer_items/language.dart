import 'package:flutter/material.dart';
import 'package:foodies/widgets/custom_drawer.dart';

import '../appbarIcons/qr_scanner.dart';
import '../appbarIcons/search_page.dart';
import '../constant/assets_path.dart';
import '../constant/vars.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
            setState(() {

            });
          },
          icon:
          Image.asset(menuIcon, color: Colors.white, height: 20, width: 20),
        ),
        title: Text(language, style: TextStyle(fontSize: 15)),
        actions: [
          IconButton(
            icon: Image.asset(qrcodeIcon,
                color: Colors.white, height: 20, width: 20),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => QRViewExample(),));
            },
          ),
          IconButton(
            icon: Image.asset(searchIcon,
                color: Colors.white, height: 18, width: 18),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Search(),));
            },
          ),
          IconButton(
            icon: Image.asset(mapIcon,
                color: Colors.white, height: 18, width: 18),
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => ));
            },
          ),
          IconButton(
            icon: Image.asset(cartIcon,
                color: Colors.white, height: 18, width: 18),
            onPressed: () {},
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17,vertical: 20),
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xffFF683A),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: (
                Text("Save",
                  style: TextStyle(
                    color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),)
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
