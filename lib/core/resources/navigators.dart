import 'package:flutter/material.dart';

class Navigators {
  static  naviagteTo(BuildContext context, Widget page)  {
   return Navigator.push(context, MaterialPageRoute(builder: ((context) => page)));
  }

  static  naviagteReplacementTo(BuildContext context, Widget page) {
    return Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => page)));
  }
}
