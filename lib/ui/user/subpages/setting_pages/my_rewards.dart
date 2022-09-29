import 'package:flutter/material.dart';
import 'package:team_projects/core/style/colors.dart';




class MyRewardsPage extends StatefulWidget {
  const MyRewardsPage({Key? key}) : super(key: key);

  @override
  State<MyRewardsPage> createState() => MyRewardsPageState();
}

class MyRewardsPageState extends State<MyRewardsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarRewardsPage(context),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 10, right: 10, left: 30),
                child: Text(
                  'My rewards ',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    color: Color(0xFF1c1447)
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, right: 10, left: 30),
                child: Text(
                  'When you order the service for the tenth time, you will get a free service ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    color: Color(0xFF1c1447)
                  ),
                ),
              ),
            ]));
  }

  AppBar appBarRewardsPage(BuildContext context) {
    return AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: MaterialButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff1c1447),
          ),
        ),
      );
  }
}
