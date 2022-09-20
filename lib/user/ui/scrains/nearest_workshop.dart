import 'package:flutter/material.dart';

import '../car_wash_workshops.dart';




class Images {
  final String image;

  final String text;

  Images({required this.image, required this.text});
}

class NearestWorkShop extends StatefulWidget {
  @override
  State<NearestWorkShop> createState() => _NearestWorkShopState();
}

class _NearestWorkShopState extends State<NearestWorkShop> {
  List<Images> images = [
    Images(image: "images/wash.png", text: ('Car wash')),
    Images(image: "images/onbarding2.png", text: ('Mechanical')),
    Images(image: "images/wash.png", text: ('Electrician')),
    Images(image: "images/wash.png", text: ('Painting & Denting')),
    Images(image: "images/wash.png", text: ('Wheel aligment'))
  ];

  List<Images> down = [
    Images(image: 'images/home.png', text: 'Fuel Delivery'),
    Images(image: 'images/home.png', text: 'Engine oil change'),
    Images(image: 'images/home.png', text: 'Battery service'),
    Images(image: 'images/home.png', text: 'Tyre change'),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Color(0xFF1c1447),
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
              ),
              label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Help'),
          BottomNavigationBarItem(icon: Icon(Icons.add_alert), label: 'Orders'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Color(0xFF1c1447),
              size: 40,
            )),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nearst Workshop',
              style: TextStyle(
                  color: Color(0xFF1c1447),
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            Text(
              'Auto car workshops were you can go to fix or wash your car',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 190,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return UpScroll(images[index]);
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        width: 20,
                      ),
                  itemCount: images.length),
            ),
            SizedBox(
              height: 70,
            ),
            Text('Services',
                style: TextStyle(
                    color: Color(0xFF1c1447),
                    fontWeight: FontWeight.bold,
                    fontSize: 28)),
            Text(
              'Car services which can you come to your lacation to provide you with the help you need',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 190,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return downScroll(down[index]);
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        width: 20,
                      ),
                  itemCount: down.length),
            ),
          ],
        ),
      ),
    );
  }

  Widget UpScroll(Images user) => Row(
        children: [
          Container(
            width: 220,
            height: 180,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(17)),
            child: ElevatedButton(
            
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => CarWashWorkshops(),));
              },
             
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(17) ))
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                          height: 140,
                          width: 180,
                          child: Image(image: AssetImage('${user.image}'))),
                    ),
                    Text(
                      '${user.text}',
                      style: TextStyle(
                          color: Color(0xFF1c1447),
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      );

  Widget downScroll(Images user) => Row(
        children: [
          Container(
            width: 220,
            height: 180,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(17)),
            child: ElevatedButton(
             
              onPressed: () {}
              ,
             
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)))
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                          height: 140,
                          width: 180,
                          child: Image(image: AssetImage('${user.image}'))),
                    ),
                    Text(
                      '${user.text}',
                      style: const TextStyle(
                          color: Color(0xFF1c1447),
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      );
}
