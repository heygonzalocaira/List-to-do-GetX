import 'package:flutter/material.dart';
import 'package:get/get.dart';


class InitOnboardingController extends GetxController{
  PageController pageController = PageController();
  int _index = 0;
  int get index => _index;

  onPageChanged(int value) {
    _index = value;
    print("_index "+_index.toString());
    update();
  }
}