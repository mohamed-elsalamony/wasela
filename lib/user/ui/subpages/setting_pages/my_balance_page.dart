import 'package:flutter/material.dart';


class MyBalancePage extends StatefulWidget {
  const MyBalancePage({Key? key}) : super(key: key);

  @override
  State<MyBalancePage> createState() => MyBalancePageState();
}

class MyBalancePageState extends State<MyBalancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBalancePage(context),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Balance Info Page', style: Theme.of(context).textTheme.headline1
                // ?.copyWith(fontSize: 20.sp),
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

  AppBar appBarBalancePage(BuildContext context) {
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
