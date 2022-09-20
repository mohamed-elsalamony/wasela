import 'package:flutter/material.dart';

class MyCarsPage extends StatefulWidget {
  const MyCarsPage({Key? key}) : super(key: key);

  @override
  State<MyCarsPage> createState() => MyCarsPageState();
}

class MyCarsPageState extends State<MyCarsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCarsPage(context),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Cars Info Page', style: Theme.of(context).textTheme.headline1
                ),
            Text(
              'It\'ll be here soon ...',
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBarCarsPage(BuildContext context) {
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
