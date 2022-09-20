import 'package:flutter/material.dart';

import 'my_reservations.dart';

class My_reservation extends StatefulWidget {
  const My_reservation({Key? key}) : super(key: key);

  @override
  State<My_reservation> createState() => _My_reservationState();
}

class _My_reservationState extends State<My_reservation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(top: 10, left: 30),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xff1c1447),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10, right: 10, left: 30),
                child: Text(
                  'My reservations',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    color: Color(0xff1c1447),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyReservations(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(23, 16, 67, 1),
                      side: const BorderSide(color: Color(0xff1c1447), width: 2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                        16,
                      ))),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                    child: Text(
                      "Coming",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyReservations(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                        16,
                      )) // Background color
                      ),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                    child: Text(
                      "precedent",
                      style: TextStyle(
                        color: Color.fromRGBO(142, 142, 142, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ]),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(243, 243, 243, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 20),
                        child: Row(
                          children: [
                            const Expanded(
                              flex: 3,
                              child: Text(
                                "20 Oct,2022 / 8:00 PM",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 80,
                            ),
                            Expanded(
                              flex: 2,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.red,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                      6,
                                    )) // Background color
                                    ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 10.0),
                                  child: Text(
                                    "NEW",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            child: const Padding(
                              padding: EdgeInsets.only(top: 10, left: 20),
                              child: Icon(
                                Icons.local_car_wash_rounded,
                                color: Color(0xff1c1447),
                              ),
                            ),
                            onTap: () {
                              //action code when clicked
                              print("The icon is clicked");
                            },
                          ),
                          const SizedBox(width: 10.0),
                          const Text("Car washing  ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                              )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [],
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, left: 20),
                              child: Icon(
                                Icons.location_on_rounded,
                                color: Color(0xff1c1447),
                              ),
                            ),
                            onTap: () {
                              //action code when clicked
                              print("The icon is clicked");
                            },
                          ),
                          SizedBox(width: 10.0),
                          const Text("Mansoura , 2nd street",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 10, right: 20),
                            child: Text(
                              "35 LE",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(243, 243, 243, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 20),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                "20 Oct,2022 / 8:00 PM",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                      6,
                                    )) // Background color
                                    ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 10),
                                  child: Text(
                                    "DONE",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, left: 20),
                              child: Icon(
                                Icons.local_car_wash_rounded,
                                color: Color(0xff1c1447),
                              ),
                            ),
                            onTap: () {
                              //action code when clicked
                              print("The icon is clicked");
                            },
                          ),
                          SizedBox(width: 10.0),
                          const Text("Car washing  ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                              )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [],
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, left: 20),
                              child: Icon(
                                Icons.location_on_rounded,
                                color: Color(0xff1c1447),
                              ),
                            ),
                            onTap: () {
                              //action code when clicked
                              print("The icon is clicked");
                            },
                          ),
                          SizedBox(width: 10.0),
                          const Text("Mansoura , 2nd street",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 10, right: 20),
                            child: Text(
                              "35 LE",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
