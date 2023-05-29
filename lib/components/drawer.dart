import 'package:flutter/material.dart';
import 'package:shop_manager/components/drawer_header.dart';
import 'package:shop_manager/pages/main.dart';
import 'package:shop_manager/utils/ui_helpers.dart';

class ShopManagerDrawer extends StatefulWidget {
  const ShopManagerDrawer({super.key, required this.parentState});

  final MainPageState parentState;

  @override
  State<ShopManagerDrawer> createState() => ShopManagerDrawerState();
}

class ShopManagerDrawerState extends State<ShopManagerDrawer> {
  int _activePage = 0;

  List<DrawerItem> drawerItems = const [
    DrawerItem(
        title: "Rapports", icon: Icons.assignment_outlined, route: "/rapports"),
    DrawerItem(
        title: "Medicaments",
        icon: Icons.medical_information_outlined,
        route: "/medicaments")
  ];

  @override
  initState() {
    super.initState();
    _activePage = widget.parentState.currentPage;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: MediaQuery.of(context).size.width * 0.75,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const ShopManagerDrawerHeader(),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: drawerItems.length,
              itemBuilder: (context, index) {
                var item = drawerItems[index];
                return ListTile(
                    leading: Icon(item.icon),
                    title: Text(item.title),
                    selected: index == _activePage,
                    onTap: () {
                      widget.parentState.controller.jumpToPage(index);
                      Navigator.pop(context);
                    });
              },
            )
          ],
        ));
  }
}
