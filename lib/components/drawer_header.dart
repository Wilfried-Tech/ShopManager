import 'dart:ui';

import 'package:flutter/material.dart';

class ShopManagerDrawerHeader extends StatelessWidget {
  const ShopManagerDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/drawer_header_img.jpg"),
                fit: BoxFit.cover)),
        child: ClipRRect(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0)),
                  width: MediaQuery.sizeOf(context).width,
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Shop Manager",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        )));
  }
}
