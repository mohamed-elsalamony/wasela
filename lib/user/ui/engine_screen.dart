import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:team_projects/user/ui/subpages/home_pages/problems_service_page.dart';






class ReviewScreen extends StatefulWidget{
  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    int? _value = 1 ;
  return Scaffold(appBar: AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.keyboard_arrow_left,
          color: Color(0xFF1c1447),
          size: 40,
        )),
  ),
    backgroundColor: Colors.white,
    body: Padding(
      padding: const EdgeInsets.only(top: 50,left: 30,right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Engine oil change',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 30,color: Color(0xFF1c1447) ),),
         Text('Same price as the petrol station',style: TextStyle(color: Colors.grey),),
          SizedBox(height: 30,),
           Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadiusDirectional.circular(10)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 120),
                    child: Text('Oil for 1000 KM',style: TextStyle(fontSize: 20),),
                  ),
                  Transform.scale(
                    scale: 1.2,
                    child: Radio<int>(value: 1, groupValue:_value,
                      onChanged:(value){
                      setState(() {
                        _value= value;
                      });
                      },activeColor: Color(0xFF1c1447),),
                  ),

                ],
              ),
            ),
          SizedBox(height: 20,),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadiusDirectional.circular(10)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 120),
                  child: Text('Oil for 5000 KM',style: TextStyle(fontSize: 20),),
                ),
                Transform.scale(
                  scale: 1.2,
                  child: Radio<int>(value: 2, groupValue:_value,
                    onChanged:(value){
                      setState(() {
                        _value= value ;
                      });
                    },activeColor: Color(0xFF1c1447),),
                ),

              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadiusDirectional.circular(10)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 110),
                  child: Text('Oil for 10000 KM',style: TextStyle(fontSize: 20),),
                ),
                Transform.scale(
                  scale:1.2,
                  child: Radio<int>(value: 3, groupValue:_value,
                    onChanged:(value){
                      setState(() {
                       _value = value;
                      });
                    },activeColor: Color(0xFF1c1447),),
                ),

              ],
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadiusDirectional.circular(10)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 110),
                  child: Text('Oil for 20000 KM',style: TextStyle(fontSize: 20),),
                ),
                Transform.scale(
                  scale: 1.2,
                  child: Radio<int>(value:4, groupValue:_value,
                    onChanged:(value){
                      setState(() {
                        _value=value ;
                      });
                    },activeColor: Color(0xFF1c1447),),
                ),

              ],
            ),
          ),
          const SizedBox(height: 160,),
          Center(
            child: Container(
              width: double.infinity,
                height: 45,
                decoration: BoxDecoration(color: const Color(0xFF1c1447),borderRadius: BorderRadius.circular(20)),
                child: TextButton(onPressed: (){
                  Navigator.push(context, 
                      MaterialPageRoute(builder: (context)=>ProblemServicePage()));
                }, child: const Text('Confirm'
                  ,style: TextStyle(fontSize:27,fontWeight: FontWeight.bold,color: Colors.white),))),
          )







        ],
      ),
    ),
  );
  }
}