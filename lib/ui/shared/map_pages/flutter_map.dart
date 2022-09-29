/// the External Package

/// add latlong2 package

/// add flutter_map package
///
/// some additional setup
///
/// add in add in android/app/src/main/AndroidManifests.xml file
///
/// <manifest xmlns:android="http://schemas.android.com/apk/res/android"
///   package="com.example.wasela">
///   <uses-permission android:name="android.permission.INTERNET"/>      # the new line
///   <application

/// add location package
///
/// some additional setup
///
/// add in add in android/app/src/main/AndroidManifests.xml file
///
/// <manifest xmlns:android="http://schemas.android.com/apk/res/android"
///   package="com.example.wasela">
///   <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />  # the new line
///   <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/> # the new line
///   <application

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:team_projects/core/resources/asset_path.dart';
import 'package:team_projects/core/resources/constants_variables.dart';
import 'package:team_projects/core/resources/navigators.dart';
import 'package:team_projects/core/widgets/default_alert_dialog.dart';
import 'package:team_projects/data/my_location.dart';
import 'package:team_projects/ui/shared/chat/chat_screen.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LocationData? currentLocation;

  late final MapController _mapController;

  bool liveUpdate = false;
  bool direction = false;
  late LatLng currentLatLng;

  @override
  void initState() {
    super.initState();
    initLocationService();
    _mapController = MapController();
  }

  @override
  void dispose() {
    super.dispose();
    _mapController.dispose();
  }

  void initLocationService() async {
    currentLocation = await MyLocation().getLocation();
    if (currentLocation != null) {
      print(
          'the current location in init location service is $currentLocation');
      MyLocation().getLiveLocation();
      _mapController.move(
          LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
          _mapController.zoom);

      MyLocation()
          .location
          .onLocationChanged
          .listen((LocationData result) async {
        if (mounted) {
          setState(() {
            currentLocation = result;
            // If Live Update is enabled, move map center
            if (liveUpdate & direction) {
              _mapController.move(
                  LatLng(
                      currentLocation!.latitude!, currentLocation!.longitude!),
                  _mapController.zoom);
            }
          });
        }
      });
    }
  }

  getMyCurrentPoint() {
    /// Until currentLocation is initially updated, Widget can locate to 0, 0
    /// by default or store previous location value to show.
    if (currentLocation != null) {
      currentLatLng =
          LatLng(currentLocation!.latitude!, currentLocation!.longitude!);
    } else {
      currentLatLng = LatLng(31.041675579989295, 31.378892190271888);
    }
  }

  @override
  Widget build(BuildContext context) {
    getMyCurrentPoint();
    print('currentlocation is $currentLatLng');
    return Scaffold(
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          center: currentLatLng,
          zoom: 13.5,
          maxZoom: 18,
          minZoom: 3,
          maxBounds: LatLngBounds(LatLng(-90, -180), LatLng(90, 180)),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(
            markers: [
              ...markersList,
              makeMarker(
                latLng: currentLatLng,
                color: Colors.blue,
                canContact: false,
                isMe: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// markerModel
Marker makeMarker({
  Key? key,
  required LatLng latLng,
  Color? color,
  required bool canContact,
  bool isMe = false,
}) {
  return Marker(
    key: key,
    point: latLng,
    builder: (context) => InkWell(
      child: Image.asset(
        AppAssets.marker,
        color: color,
      ),
      onTap: () async {
        LocationData? currentLocation = MyLocation().currentLocation;
        LatLng? currentLatLng =
            LatLngModel().getLatLng(currentLocation: currentLocation);
        if (!isMe) {
          print("the current location $currentLocation");
          print("the current latlong $currentLatLng");
          await showDialog(
            context: context,
            builder: ((BuildContext context) {
              return MyAlertDialog(
                // TODO: firebaes
                ///  data of workers and is enable to contact to not
                origin: currentLatLng ??
                    LatLng(31.042401247377263, 31.381649902241946),
                title: 'Compu Car WrokShop',
                contant: 'Nader Ahmed',
                canContact: canContact,
                distination: latLng,
                contactButton: () {
                  //TODO: Chat
                  /// chat with worker

                  Navigators.naviagteTo(context, ChatScreen());
                },
              );
            }),
          );
        }
      },
    ),
    height: 30,
    width: 30,
  );
}

/// Draft

  ///  Location Service 
  //  void initLocationService() async {
  //     LocationData? location;
  //     bool serviceEnabled;
  //     bool serviceRequestResult;
  //     await _locationService.changeSettings(
  //       accuracy: LocationAccuracy.high,
  //       interval: 1000,
  //     );
  //
  //     try {
  //       serviceEnabled = await _locationService.serviceEnabled();
  //
  //       if (serviceEnabled) {
  //         print('the service Enabled');
  //         final permission = await _locationService.requestPermission();
  //         _permission = permission == PermissionStatus.granted;
  //
  //         if (_permission) {
  //           print('the permission Enabled');
  //           location = await _locationService.getLocation();
  //           _currentLocation = location;
  //           _mapController.move(
  //               LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
  //               _mapController.zoom);
  //           _locationService.onLocationChanged
  //               .listen((LocationData result) async {
  //             if (mounted) {
  //               setState(() {
  //                 _currentLocation = result;
  //                 // If Live Update is enabled, move map center
  //                 if (liveUpdate & direction) {
  //                   _mapController.move(
  //                       LatLng(_currentLocation!.latitude!,
  //                           _currentLocation!.longitude!),
  //                       _mapController.zoom);
  //                 }
  //               });
  //             }
  //           });
  //         }
  //       } else {
  //         print('the service is not Enabled');
  //         serviceRequestResult = await _locationService.requestService();
  //         if (serviceRequestResult) {
  //           print('the service accept');
  //           initLocationService();
  //         } else {
  //           print('the service refused');
  //         }
  //       }
  //     } on PlatformException catch (e) {
  //       debugPrint(e.toString());
  //       if (e.code == 'PERMISSION_DENIED') {
  //         _serviceError = e.message;
  //       } else if (e.code == 'SERVICE_STATUS_ERROR') {
  //         _serviceError = e.message;
  //       }
  //       location = null;
  //     }
  //   }


  /// Marker Model
  // need some edits to work
  //
  // List<MarkerModel> markersModel = [];
  //
  // void addMarker({Key? key, required LatLng point, Color? color}) {
  //   markersList.add(
  //     makeMarker(
  //       latLng: point,
  //       color: color,
  //     ),
  //   );
  // }
  //
  // var markerLayer = MarkerLayer(
  //   markers: [
  //     makeMarker(
  //         latLng: LatLng(31.041042423811355, 31.377995886076345),
  //         color: Colors.blue),
  //     makeMarker(
  //         latLng: LatLng(31.04223278333965, 31.378233608541276),
  //         color: Colors.red),
  //     makeMarker(
  //         latLng: LatLng(31.042894628923133, 31.383211788154323),
  //         color: Colors.red),
  //     makeMarker(
  //         latLng: LatLng(31.04414476913723, 31.398146326993466),
  //         color: Colors.red),
  //   ],
  // );
  //
  // class MarkerModel {
  //   Key? key;
  //   LatLng point;
  //   Color? color;
  //
  //   MarkerModel({this.key, required this.point, this.color});
  //
  // factory MarkerModel.fromJson(){return MarkerModel(point: point);}
  // }

  /// Live Location Service Draft
  // class LiveLocationServiceDraft {
  //   final Location _locationService = Location();
  //   bool _sevriceEnable = false;
  //   PermissionStatus _permissionGranted = PermissionStatus.denied;
  //   LocationData? location;
  //   Future<void> initLocation() async {
  //     await _locationService.changeSettings(
  //       accuracy: LocationAccuracy.high,
  //       interval: 1000,
  //     );
  //     try {
  //       _sevriceEnable = await _locationService.serviceEnabled();
  //       if (!_sevriceEnable) {
  //         _sevriceEnable = await _locationService.requestService();
  //         print('the service is enabled');
  //         if (!_sevriceEnable) {
  //           print('the service is not enabled');
  //
  //           /// this mean that he don't give you premision to live location
  //           /// so, the right action to return him back to home page
  //           return;
  //         }
  //       }
  //       _permissionGranted = await _locationService.hasPermission();
  //       if (_permissionGranted == PermissionStatus.granted) {
  //         await getLocation();
  //         print('the service hs permission ');
  //       } else {
  //         _permissionGranted = await _locationService.requestPermission();
  //         if (_permissionGranted == PermissionStatus.granted) {
  //           await getLocation();
  //           print('the service has permission');
  //         } else {
  //           /// this mean that he don't give you premision to live location
  //           /// so, the right action to return him back to home page
  //           print('the service dose not have permssion');
  //           return;
  //         }
  //       }
  //     } on PlatformException catch (e) {
  //       /// need more understanding
  //       debugPrint(e.toString());
  //       if (e.code == 'PERMISSION_DENIED') {
  //         // _serviceError = e.message;
  //       } else if (e.code == 'SERVICE_STATUS_ERROR') {
  //         // _serviceError = e.message;
  //       }
  //       // location = null;
  //     }
  //   }
  //
  //   Future<void> getLocation() async {
  //     location = await _locationService.getLocation();
  //     print(location.toString());
  //   }
  // }
  //
  // class LiveLocationService {
  //   final _locationService = Location();
  //   bool _permission = false;
  //   LocationData? _currentLocation;
  //   String? _serviceError;
  //   bool _liveUpdate = true;
  //
  //   void initLocationService() async {
  //     await _locationService.changeSettings(
  //       accuracy: LocationAccuracy.high,
  //       interval: 1000,
  //     );
  //
  //     LocationData? location;
  //     bool serviceEnabled;
  //     bool serviceRequestResult;
  //
  //     try {
  //       serviceEnabled = await _locationService.serviceEnabled();
  //
  //       if (serviceEnabled) {
  //         final permission = await _locationService.requestPermission();
  //         _permission = permission == PermissionStatus.granted;
  //
  //         if (_permission) {
  //           location = await _locationService.getLocation();
  //           _currentLocation = location;
  //           _locationService.onLocationChanged
  //               .listen((LocationData result) async {
  //             if (mounted) {
  //               setState(() {
  //                 _currentLocation = result;
  //
  //                 // If Live Update is enabled, move map center
  //                 if (_liveUpdate) {
  //                   _mapController.move(
  //                       LatLng(_currentLocation!.latitude!,
  //                           _currentLocation!.longitude!),
  //                       _mapController.zoom);
  //                 }
  //               });
  //             }
  //           });
  //         }
  //       } else {
  //         serviceRequestResult = await _locationService.requestService();
  //         if (serviceRequestResult) {
  //           initLocationService();
  //           return;
  //         }
  //       }
  //     } on PlatformException catch (e) {
  //       debugPrint(e.toString());
  //       if (e.code == 'PERMISSION_DENIED') {
  //         _serviceError = e.message;
  //       } else if (e.code == 'SERVICE_STATUS_ERROR') {
  //         _serviceError = e.message;
  //       }
  //       location = null;
  //     }
  //   }
  // }

  /// floating Action Button Draft
  // floatingActionButton: Builder(builder: (BuildContext context) {
  //   return FloatingActionButton(
  //     onPressed: () {
  //       setState(() {
  //         liveUpdate = !liveUpdate;
  //         if (liveUpdate) {
  //           interActiveFlags = InteractiveFlag.rotate |
  //               InteractiveFlag.pinchZoom |
  //               InteractiveFlag.doubleTapZoom;
  //           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //             content: Text(
  //                 'In live update mode only zoom and rotation are enable'),
  //           ));
  //         } else {
  //           interActiveFlags = InteractiveFlag.all;
  //         }
  //       });
  //     },
  //     child: liveUpdate
  //         ? const Icon(Icons.location_on)
  //         : const Icon(Icons.location_off),
  //   );
  // }),

  /// live location listen
  // _locationService.onLocationChanged
  //     .listen((LocationData result) async {
  //   if (mounted) {
  //     setState(() {
  //       _currentLocation = result;
  //
  //       // If Live Update is enabled, move map center
  //       if (liveUpdate & direction) {
  //         _mapController.move(
  //             LatLng(_currentLocation!.latitude!,
  //                 _currentLocation!.longitude!),
  //             _mapController.zoom);
  //       }
  //     });
  //   }
  // });
