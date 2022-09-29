import 'package:flutter/material.dart';


class MyReservations extends StatefulWidget {
  const MyReservations({super.key});



  @override
  State<MyReservations> createState() => _MyReservationsState();
}

class _MyReservationsState extends State<MyReservations> {
  var dateController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(top:10,left: 30),
          child: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff1c1447),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        Text(
          'My reservations',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            fontFamily: 'Roboto',
            fontStyle: FontStyle.normal,
            color: Color(0xff1c1447),
          ),
        ),
              SizedBox(height: 20.0),
              Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Expanded(
                      child: Container(
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(
                                    16,
                                  ))// Background color
                          ),
                          child: Text(
                            "Coming",
                            style: TextStyle(
                              color:  Color.fromRGBO(
                                  142, 142, 142, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Container(
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(
                                  23, 16, 67, 1),
                              side: BorderSide( color: Color(0xff1c1447), width: 2),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(
                                    16,

                                  ))
                          ),
                          child: Text(
                            "precedent",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),

                  ]

              ),
              SizedBox(height:30 ,),

              Text(
                'Date',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.normal,
                  color:  Color.fromRGBO(
                      106, 103, 103, 1),
                ),
              ),
              SizedBox(height: 6,),
              TextFormField(

                style: TextStyle(color:  Color.fromRGBO(
                    106, 103, 103, 1),),
                keyboardType: TextInputType.datetime,
                controller: dateController,
                onFieldSubmitted: (value) {
                  print(value);
                },
                onChanged: (value) {
                  print(value);
                },
                decoration: InputDecoration(
                  filled: true,

                  fillColor: Color.fromRGBO(
    242, 240, 240, 1),
                  labelText: '00-00-0000',
                  labelStyle: TextStyle(
                    color:  Color.fromRGBO(
                        271, 271, 271, 1),

                  ),

                  prefixIcon: Icon(
                    Icons.calendar_today,
                    color: Color.fromRGBO(
                        28, 20, 71, 1),
                  ),

                  border: OutlineInputBorder(),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  focusedBorder: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(16),

                  ),


                ),
              ),
              SizedBox(
                height: 15.0,
              ),
    ]),
      )
    );
  }
}
