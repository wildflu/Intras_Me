


import 'package:get/get.dart';

class NavBarController extends GetxController {
  RxInt indexPage = 0.obs; 
  setIndexPage(int i) {
    indexPage.value = i;
  }
}