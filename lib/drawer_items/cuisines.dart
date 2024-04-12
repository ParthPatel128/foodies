import 'package:flutter/material.dart';

import '../appbarIcons/qr_scanner.dart';
import '../appbarIcons/search_page.dart';
import '../constant/assets_path.dart';
import '../constant/vars.dart';
import '../widgets/custom_drawer.dart';

class Cuisines extends StatefulWidget {
  const Cuisines({super.key});

  @override
  State<Cuisines> createState() => _CuisinesState();
}

class _CuisinesState extends State<Cuisines> {
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
        title: Text(cuisines, style: TextStyle(fontSize: 15)),
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
    );
  }
}
