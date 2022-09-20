class BoardingContent{
  String image;
  String title;
  String description ;
  BoardingContent({required this.image,required this.title,required this.description});
}
List<BoardingContent> contents = [
  BoardingContent(image: 'images/onboarding1.png',
      title: "Search for a work",
      description:"Lörem ipsum förnamn vass metates "
"betårta. Orade tresamma prepretobelt "
"kövur pensionärskuvös "),
  BoardingContent(image: 'images/onbarding2.png',
      title: "Make Payment",
      description:"Lörem ipsum förnamn vass metates "
          "betårta. Orade tresamma prepretobelt "
          "kövur pensionärskuvös "),
  BoardingContent(image: 'images/onboarding3.png',
      title: "Git your service",
      description:"Lörem ipsum förnamn vass metates "
          "betårta. Orade tresamma prepretobelt "
          "kövur pensionärskuvös "),

];