
/// the External Package

  // add latlong2 package

  // add webView_flutter package
  //
  // some additional setup
  //
    //  add in android/app/src/main/AndroidManifests.xml file
    //     <application
    //           android:usesCleartextTraffic = "true"   # the new line
    //           android:label="wasela"
    //           android:name="${applicationName}"
    //           android:icon="@mipmap/ic_launcher">
    //           <activity
    //  edit in android/app/build.gridle file 
    //     minSdkVersion 20
    //     compileSdkVersion 32

import 'package:latlong2/latlong.dart';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  static const String routeName = "Web View Screen";
  final LatLng origin;
  final LatLng distination;
  final double zoom;

  late String _origin;
  late String _distination;

  late WebViewController webController;
  WebViewScreen({
    super.key,
    required this.origin,
    required this.distination,
    required this.zoom,
  });
  LatLng pointLatLong = LatLng(10, 20);
  getUrl() {
    _origin = "${origin.latitude},${origin.longitude}";
    _distination = "${distination.latitude},${distination.longitude}";
  }

  @override
  Widget build(BuildContext context) {
    getUrl();

    // TODO: try 
    /// to add data string move the variable outside build method
    String? initUrl =
        "https://www.google.com/maps/dir/$_origin/$_distination/@$_origin,${zoom}z";
    return Scaffold(
      body: SafeArea(
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: initUrl,
          onWebViewCreated: (controller) {
            webController = controller;
          },
          onPageStarted: ((url)async {
            await Future.delayed(const Duration(milliseconds: 300));
            webController.runJavascript(
                "document.getElementsByTagName('header')[0].style.display='none'");
            webController.runJavascript(
                "document.getElementsByTagName('footer')[0].style.display='none'");
          }),
        ),
      ),
    );
  }
}
