import 'package:team_projects/core/resources/asset_path.dart';

class BoardingContent {
  String image;
  String title;
  String description;
  BoardingContent(
      {required this.image, required this.title, required this.description});
}

List<BoardingContent> contents = [
  BoardingContent(
      image: AppAssets.onboarding1,
      title: "Search for a work",
      description: "Lörem ipsum förnamn vass metates "
          "betårta. Orade tresamma prepretobelt "
          "kövur pensionärskuvös "),
  BoardingContent(
      image:  AppAssets.onboarding2,
      title: "Make Payment",
      description: "Lörem ipsum förnamn vass metates "
          "betårta. Orade tresamma prepretobelt "
          "kövur pensionärskuvös "),
  BoardingContent(
      image: AppAssets.onboarding3,
      title: "Git your service",
      description: "Lörem ipsum förnamn vass metates "
          "betårta. Orade tresamma prepretobelt "
          "kövur pensionärskuvös "),
];
