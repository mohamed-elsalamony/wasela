import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_projects/user/ui/my-reservation.dart';
import 'package:team_projects/user/ui/my_rewards.dart';




class Settings_page extends StatefulWidget {
  @override
  State<Settings_page> createState() => _Settings_pageState();
}

class _Settings_pageState extends State<Settings_page> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(top: 10, left: 30),
          child: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xff1c1447),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 10,
          ),
          Text(
            'Settings',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              fontFamily: 'Roboto',
              fontStyle: FontStyle.normal,
              color: Color(0xff1c1447),
            ),
          ),
          SizedBox(height: 25,),
          SingleChildScrollView(
            child: Container(
              height: 50,
              child: MaterialButton(
                height: 50,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                color: Color(0xff1c1447),
                padding: EdgeInsets.only(top: 5, right: 40, left: 40),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => My_reservation(),));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                     Expanded(
                      child: Icon(Icons.check_circle_rounded, color: Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 9,
                      child: Text(
                        'My reservations',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(child: Icon(
                        Icons.arrow_right_outlined, color: Colors.white,size: 45,)),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 15,),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xff1c1447), width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: MaterialButton(
              height: 50,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              color: Colors.white,
              padding: EdgeInsets.only(top: 5, right: 10, left: 40),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Expanded(
                    child: InkWell(
                      child: Icon(
                        Icons.car_rental_rounded,
                        color: Color(0xff1c1447),
                      ),
                    ),

                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    flex: 10,
                    child: Text(
                      'My cars',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1c1447),
                      ),
                    ),
                  ),
                  Expanded(
                    flex:3,
                      child: Icon(
                    Icons.arrow_right_outlined,
                    color: Color(0xff1c1447),
                        size: 45,
                  )),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15,),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xff1c1447), width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: MaterialButton(
              height: 50,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              color: Colors.white,
              padding: EdgeInsets.only(top: 5, right: 40, left: 40),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: InkWell(
                      child: Icon(
                        Icons.credit_card_rounded,
                        color: Color(0xff1c1447),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 9,
                    child: Text(
                      'My cards',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1c1447),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                      child: Icon(
                    Icons.arrow_right_outlined,
                    color: Color(0xff1c1447),
                        size: 45,
                  )),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15,),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xff1c1447), width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: MaterialButton(
              height: 50,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              color: Colors.white,
              padding: EdgeInsets.only(top: 5, right: 40, left: 40),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: InkWell(
                      child: Icon(
                        Icons.monetization_on_rounded,
                        color: Color(0xff1c1447),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 11,
                  ),
                  Expanded(
                    flex: 9,
                    child: Text(
                      'My balance',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1c1447),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Icon(
                    Icons.arrow_right_outlined,
                    color: Color(0xff1c1447),
                        size: 45,
                  )),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15,),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xff1c1447), width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: MaterialButton(
              height: 50,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              color: Colors.white,
              padding: EdgeInsets.only(top: 5, right: 40, left: 40),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyRewards(),));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: InkWell(
                      child: Icon(
                        Icons.money,
                        color: Color(0xff1c1447),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 8,
                    child: Text(
                      'My rewards',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1c1447),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Icon(
                    Icons.arrow_right_outlined,
                    color: Color(0xff1c1447),
                        size: 45,
                  )),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15,),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xff1c1447), width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: MaterialButton(
              height: 50,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              color: Colors.white,
              padding: EdgeInsets.only(top: 5, right: 40, left: 40),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: InkWell(
                      child: Icon(
                        Icons.logout,
                        color: Color(0xff1c1447),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 8,
                    child: Text(
                      'Sign out',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1c1447),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Icon(
                    Icons.arrow_right_outlined,
                    color: Color(0xff1c1447),
                        size: 45,
                  )),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
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
    );
  }
}
