// ignore_for_file: unused_field

import 'dart:async';

import 'package:flutter/services.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class MyLocation {
  static late Location _location;
  static LocationData? _currentLocation;

  bool _serviceEnabled = false;
  PermissionStatus? grantedPermission;

  static void initLocationService() {
    _location = Location();
  }

  Location get location => _location;
  LocationData? get currentLocation => _currentLocation;

  Future<LocationData?> getLocation() async {
    if (await _checkPermssion()) {
      _currentLocation = await _location.getLocation();
    }
    return _currentLocation;
  }

  void getLiveLocation() async {
    if (await _checkPermssion()) {
       _location.onLocationChanged.listen((result) {
        _currentLocation = result;
      });
    }
  }

  Future<bool> _checkPermssion() async {
    if (await _checkService()) {
      grantedPermission = await _location.hasPermission();
      if (grantedPermission != PermissionStatus.granted) {
        grantedPermission = await _location.requestPermission();
      }
    }
    return grantedPermission == PermissionStatus.granted;
  }

  Future<bool> _checkService() async {
    try {
      _serviceEnabled = await _location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await _location.requestService();
      }
    } on PlatformException catch (error) {
      print("the error is ${error.code} & the message is ${error.message}");
      _serviceEnabled = false;
      return await _checkService();
    }
    return _serviceEnabled;
  }
}

class LatLngModel {
  LatLng? currentLatLng;

  LatLng? getLatLng({LocationData? currentLocation}) {
    /// Until currentLocation is initially updated, Widget can locate to 0, 0
    /// by default or store previous location value to show.
    if (currentLocation != null) {
      currentLatLng =
          LatLng(currentLocation.latitude!, currentLocation.longitude!);
    }
    return currentLatLng;
  }
}


/// draft

  // LocationData? _currentLocation;
  // bool liveUpdate = false;
  // bool direction = false;
  // bool _permission = false;
  // late LatLng currentLatLng;

  // String? _serviceError = '';

  // int interActiveFlags = InteractiveFlag.all;
  // final Location _locationService = Location();

  // void initLocationService() async {
  //   LocationData? location;
  //   bool serviceEnabled;
  //   bool serviceRequestResult;
  //   await _locationService.changeSettings(
  //     accuracy: LocationAccuracy.high,
  //     interval: 1000,
  //   );

  //   try {
  //     serviceEnabled = await _locationService.serviceEnabled();

  //     if (serviceEnabled) {
  //       print('the service Enabled');
  //       final permission = await _locationService.requestPermission();
  //       _permission = permission == PermissionStatus.granted;

  //       if (_permission) {
  //         print('the permission Enabled');
  //         location = await _locationService.getLocation();
  //       }
  //     } else {
  //       print('the service is not Enabled');
  //       serviceRequestResult = await _locationService.requestService();
  //       if (serviceRequestResult) {
  //         print('the service accept');
  //         initLocationService();
  //       } else {
  //         print('the service refused');
  //       }
  //     }
  //   } on PlatformException catch (e) {
  //     debugPrint(e.toString());
  //     if (e.code == 'PERMISSION_DENIED') {
  //       _serviceError = e.message;
  //     } else if (e.code == 'SERVICE_STATUS_ERROR') {
  //       _serviceError = e.message;
  //     }
  //     location = null;
  //   }
  // }