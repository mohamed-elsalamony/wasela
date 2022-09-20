import 'package:flutter/material.dart';
import 'package:team_projects/user/ui/scrains/welcome_screen.dart';



class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: MaterialButton(
        onPressed: (){
          Navigator.push(context
              ,MaterialPageRoute(
                  builder: (context)=>WelcomeScreen()));
        },
          child: Center(
              child: Image(
                image: AssetImage(
                    'images/Logo (1).jpg'),)))
      ,
    );
  }

}