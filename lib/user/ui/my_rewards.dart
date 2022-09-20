import 'package:flutter/material.dart';

class MyRewards extends StatefulWidget {
  const MyRewards({Key? key}) : super(key: key);

  @override
  State<MyRewards> createState() => _My_RewardsState();
}

class _My_RewardsState extends State<MyRewards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: MaterialButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xff1c1447),
            ),
          ),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, right: 10, left: 30),
                child: Text(
                  'My rewards ',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Roboto',
                   fontStyle: FontStyle.normal,
                    color: Color(0xff1c1447),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 10, left: 30),
                child: Text(
                  'When you order the service for the tenth time, you will get a free service ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    color: Color(0xff1c1447),
                  ),
                ),
              ),
            ]));
  }
}
