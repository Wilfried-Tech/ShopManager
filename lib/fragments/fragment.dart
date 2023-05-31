import 'package:flutter/material.dart';
import 'package:shop_manager/screens/main.dart';

abstract class Fragment extends StatefulWidget{
  const Fragment(this.parentState, {super.key});
  final MainPageState parentState;

  void optionPressed();
}
