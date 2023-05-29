import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shop_manager/pages/main.dart';

void main() {
  initializeDateFormatting("fr_FR");
  runApp(const ShopManagerApp());
}

class ShopManagerApp extends StatelessWidget {
  const ShopManagerApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopManager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 140, 255)),
        useMaterial3: true,
      ),
      home: const MainPage(),
      routes: const <String, WidgetBuilder>{},
    );
  }
}
