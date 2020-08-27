import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:listtodo_get/screens/HomeScreen.dart';
import 'package:listtodo_get/screens/ToDoScreen.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home:HomeScreen(),
  ));
}

