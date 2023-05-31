import 'package:flutter/material.dart';
import 'package:shop_manager/components/drawer.dart';
import 'package:shop_manager/fragments/fragment.dart';
import 'package:shop_manager/fragments/medicine_fragment.dart';
import 'package:shop_manager/fragments/reports/reports.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }

  static MainPageState? of(BuildContext context) {
    return context.findAncestorStateOfType<MainPageState>();
  }
}

class MainPageState extends State<MainPage> {
  GlobalKey<ShopManagerDrawerState> drawerkey =
      GlobalKey<ShopManagerDrawerState>();

  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  late PageController _pageController;
  int _page = 0;

  late List<Fragment> _pagesFragments;

  String _title = "";

  int get currentPage => _page;

  set title(String t) => setState(() {
        _title = t;
      });
  
  PageController get controller => _pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          _title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: _pagesFragments.elementAt(_page).optionPressed),
        ],
      ),
      drawer:
          ShopManagerDrawer(key: drawerkey, parentState: this),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: List<Widget>.of(_pagesFragments),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _page);
    _pagesFragments = [ReportFragment(this), MedicineFragment(this)];
    onPageChanged(0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      _page = index;
      try {
        title = drawerkey.currentState!.drawerItems.elementAt(index).title;
      } catch (e) {
        title = "Rapports";
      }
    });
  }
}
