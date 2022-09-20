import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:team_projects/core/resources/asset_path.dart';
import 'package:team_projects/user/data/models/image_model.dart';
import 'package:team_projects/user/ui/subpages/map_pages/flutter_map.dart';


class HomepageImage {
 static List<ImageModel> nearsetWorkshopImages = [
    ImageModel(image: AppAssets.wash, text: ('Car wash')),
    ImageModel(image: AppAssets.onboarding2, text: ('Mechanical')),
    ImageModel(image: AppAssets.wash, text: ('Electrician')),
    ImageModel(image: AppAssets.wash, text: ('Painting & Denting')),
    ImageModel(image: AppAssets.wash, text: ('Wheel aligment'))
  ];

 static List<ImageModel> servicesImages = [
    ImageModel(image: AppAssets.home, text: 'Fuel Delivery'),
    ImageModel(image: AppAssets.home, text: 'Engine oil change'),
    ImageModel(image: AppAssets.home, text: 'Battery service'),
    ImageModel(image: AppAssets.home, text: 'Tyre change'),
  ];
}

//TODO: firebase 
///   the question that we will be recieved and answer it

class QuestionsList {
  static const List<String> question1 = [
    'is visa is available?',
    '',
    '',
    ' ',
    ''
  ];
  static const List<String> question2 = ['a', 'b', 'c', 'd'];
  static const List<String> question3 = ['a', 'b', 'c', 'd'];
}


// TODO: firebase
/// this is a constant markers, but get this data from firestore 
List<Marker> markersList = [
  makeMarker(
      latLng: LatLng(31.041042423811355, 31.377995886076345),
      color: Colors.red,
      canContact: true),
  makeMarker(
      latLng: LatLng(31.04223278333965, 31.378233608541276),
      color: Colors.red,
      canContact: true),
  makeMarker(
      latLng: LatLng(31.042894628923133, 31.383211788154323),
      color: Colors.red,
      canContact: true),
  makeMarker(
      latLng: LatLng(31.04414476913723, 31.398146326993466),
      color: Colors.red,
      canContact: true),
  makeMarker(
      latLng: LatLng(31.042894628923133, 31.383211888154323),
      color: Colors.red,
      canContact: true),
  makeMarker(
      latLng: LatLng(31.040818475148818, 31.365189678805443),
      color: Colors.red,
      canContact: true),
  makeMarker(
      latLng: LatLng(31.032276054849323, 31.369922766572675),
      color: Colors.red,
      canContact: true),
  makeMarker(
      latLng: LatLng(31.035382478174323, 31.37485726233),
      color: Colors.purple,
      canContact: false),
  makeMarker(
      latLng: LatLng(31.03633164286689, 31.397213549230557),
      color: Colors.red,
      canContact: true),
  makeMarker(
      latLng: LatLng(31.03020504967085, 31.37878471813686),
      color: Colors.purple,
      canContact: false),
  makeMarker(
      latLng: LatLng(31.031154265967917, 31.36055729503325),
      color: Colors.red,
      canContact: true),
  makeMarker(
      latLng: LatLng(31.054709057249422, 31.371231918508293),
      color: Colors.purple,
      canContact: false),
];

class SelectPageLists{

 static const List<String> engineOilList = [
    'Oil for 1000 KM',
    'Oil for 5000 KM',
    'Oil for 10000 KM',
    'Oil for 20000 KM',
  ];
 static const List<String> fuelTypeList = [
    'Fuel 95',
    'Fuel 92',
    'Fuel 80',
    'Natural Gas',
    'Solar',
  ];

}
class ServiceProvision {
  static const List<String> cities = [
      "Mansoura",
      "Cairo",
      "Alex",

  ];
  static const List<String> sections = [
      "Street 12",
      "Street 10",
      "street 8",

  ];
}
