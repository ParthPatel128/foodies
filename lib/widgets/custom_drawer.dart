import 'package:flutter/material.dart';
import 'package:foodies/constant/vars.dart';
import 'package:foodies/drawer_items/cuisines.dart';
import 'package:foodies/drawer_items/restaurants.dart';

import '../appbarIcons/search_page.dart';
import '../auth/first_page.dart';
import '../constant/assets_path.dart';
import '../drawer_items/language.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: isSwitchOn ? Colors.black : Colors.white,
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(color: Color(0xffFF683A)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: userDetails['photo'] == null
                          ? Image.asset(
                              drawerLogo,
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              userDetails['photo'] ?? "",
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                    ),
                    Row(
                      children: [
                        const Text("Login to Manage",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        const Spacer(),
                        isSwitchOn
                            ? const Icon(
                                Icons.dark_mode,
                                color: Colors.white,
                              )
                            : const Icon(Icons.light_mode),
                        Switch(
                          activeColor: const Color(0xff70F9D9),
                          activeTrackColor: const Color(0xffB5B18E),
                          inactiveTrackColor: Colors.black38,
                          splashRadius: 50.0,
                          value: isSwitchOn,
                          onChanged: (value) {
                            isSwitchOn = value;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          drawerItems(
              icons: restaurantIcon,
              title: "Restaurants",
              index: 0,
              onTap: () {
                selectedDrawerIndex = 0;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Restaurants(),
                    ));
              },
              isImage: true),
          drawerItems(
              icons: splashLogo,
              index: 1,
              title: "Cuisines",
              onTap: () {
                selectedDrawerIndex = 1;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cuisines(),
                    ));
              },
              isImage: true),
          drawerItems(
              icons: Icons.search,
              title: "Search",
              index: 2,
              onTap: () {
                selectedDrawerIndex = 2;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Search(),
                    ));
              }),
          drawerItems(
              icons: Icons.favorite_border,
              title: "Favourite Restaurants",
              index: 3,
              onTap: () {
                selectedDrawerIndex = 3;
              }),
          drawerItems(
              icons: Icons.favorite_border,
              title: "Favourite Foods",
              index: 4,
              onTap: () {
                selectedDrawerIndex = 4;
              }),
          drawerItems(
              icons: Icons.shopping_cart_outlined,
              title: "Cart",
              index: 5,
              onTap: () {
                selectedDrawerIndex = 5;
              }),
          drawerItems(
              icons: Icons.person_outline,
              title: "Profile",
              index: 6,
              onTap: () {
                selectedDrawerIndex = 6;
              }),
          drawerItems(
              icons: truckIcon,
              title: "Orders",
              index: 7,
              onTap: () {
                selectedDrawerIndex = 7;
              },
              isImage: true),
          drawerItems(
              icons: Icons.person_add_alt_outlined,
              title: "Refer a friend",
              index: 8,
              onTap: () {
                selectedDrawerIndex = 8;
              }),
          drawerItems(
              icons: Icons.language,
              title: "Language",
              index: 9,
              onTap: () {
                selectedDrawerIndex = 9;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Language(),
                    ));
              }),
          drawerItems(
              icons: Icons.wechat_sharp,
              title: "Restaurant Inbox",
              index: 10,
              onTap: () {
                selectedDrawerIndex = 10;
              }),
          drawerItems(
              icons: Icons.wechat_sharp,
              title: "Driver Inbox",
              index: 11,
              onTap: () {
                selectedDrawerIndex = 11;
              }),
          drawerItems(
              icons: Icons.health_and_safety,
              title: "Terms and Condition",
              index: 12,
              onTap: () {
                selectedDrawerIndex = 12;
              }),
          drawerItems(
              icons: Icons.privacy_tip,
              title: "Privacy policy",
              index: 13,
              onTap: () {
                selectedDrawerIndex = 13;
              }),
          drawerItems(
              icons: Icons.login,
              title: "Login",
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FirstPage(),
                    ));
              }),
        ],
      ),
    );
  }

  Widget drawerItems(
      {required dynamic icons,
      required String title,
      Function? onTap,
      int? index,
      bool isImage = false}) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: ListTile(
        title: Row(
          children: [
            isImage
                ? Image.asset(
                    icons,
                    width: 20,
                    height: 20,
                    // color: isSwitchOn ? Colors.white : const Color(0xff8C8C8C),
                    color: index == selectedDrawerIndex
                        ? Color(0xffFF683A)
                        : Color(0xff8C8C8C),
                  )
                : Icon(
                    icons as IconData?,
                    // color: isSwitchOn ? Colors.white : Color(0xff8C8C8C),
                    color: index == selectedDrawerIndex
                        ? Color(0xffFF683A)
                        : Color(0xff8C8C8C),
                  ),
            const SizedBox(width: 25),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                // color: isSwitchOn ? Colors.white : Colors.black,
                color: index == selectedDrawerIndex
                    ? Color(0xffFF683A)
                    : Color(0xff8C8C8C),
              ),
            )
          ],
        ),
      ),
    );
  }
}
