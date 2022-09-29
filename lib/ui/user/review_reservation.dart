import 'package:flutter/material.dart';
import 'package:team_projects/draft/suitable_way.dart';
import 'package:team_projects/ui/user/main_pages/bottom_navigation_page.dart';




class ReviewReservation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          padding: const EdgeInsetsDirectional.only(
            start: 30,
            end: 30,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Review your reservation',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1c1447)),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {}, child: Icon(Icons.border_color_sharp)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {}, child: Icon(Icons.delete_sharp)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 10),
                    child: Row(
                      children: [
                        Text('Car number',
                            style: TextStyle(color: Colors.grey, fontSize: 20)),
                        SizedBox(
                          width: 150,
                        ),
                        Text('36748',
                            style: TextStyle(color: Colors.grey, fontSize: 20))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 10),
                    child: Row(
                      children: [
                        Text(
                          'Model',
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                        SizedBox(
                          width: 198,
                        ),
                        Text('36748',
                            style: TextStyle(color: Colors.grey, fontSize: 20))
                      ],
                    ),
                  ),
                ],
              ),
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(17)),
            ),
            SizedBox(height: 70),
            Text(
              'Services',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFF1c1447)),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 10),
                child: Row(
                  children: [
                    Text('Car wash',
                        style: TextStyle(color: Colors.grey, fontSize: 20)),
                    SizedBox(
                      width: 175,
                    ),
                    Text('35 LE',
                        style: TextStyle(color: Colors.grey, fontSize: 20))
                  ],
                ),
              ),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(17)),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 10),
                child: Row(
                  children: [
                    Text('Tyre change',
                        style: TextStyle(color: Colors.grey, fontSize: 20)),
                    SizedBox(
                      width: 150,
                    ),
                    Text('70 LE',
                        style: TextStyle(color: Colors.grey, fontSize: 20))
                  ],
                ),
              ),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(17)),
            ),
            const SizedBox(
              height: 12,
            ),
            const Divider(
              color: Color(0xFF1c1447),
              height: 0,
              thickness: 1,
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(17)),
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 10),
                child: Row(
                  children: [
                     Text('Total amount',
                        style:
                            TextStyle(color: Color(0xFF1c1447), fontSize: 20)),
                    SizedBox(
                      width: 130,
                    ),
                    Text('105 LE',
                        style:
                            TextStyle(color: Color(0xFF1c1447), fontSize: 20))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                        side: const BorderSide(
                            color: Color(0xFF1c1447),
                            width: 1,
                            style: BorderStyle.solid)))),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SuitAble()));
                },
                child: const Text(
                  'Confirm reservation',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                        side: const BorderSide(
                            color: Color(0xFF1c1447),
                            width: 1,
                            style: BorderStyle.solid)))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomNavigationPage()));
                },
                child: const Text(
                  'Add new service',
                  style: TextStyle(
                      color: Color(0xFF1c1447),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ])),
      // SizedBox(height: 70),
      // Text('Services',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Color(0xFF1c1447)),)
      //
    );
  }
}
