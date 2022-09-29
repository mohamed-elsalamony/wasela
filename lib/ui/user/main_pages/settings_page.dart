// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:team_projects/core/resources/navigators.dart';
import 'package:team_projects/core/style/colors.dart';
import 'package:team_projects/ui/shared/get_started.dart';
import 'package:team_projects/ui/shared/welcome_screen.dart';
import 'package:team_projects/ui/user/subpages/setting_pages/my_balance_page.dart';
import 'package:team_projects/ui/user/subpages/setting_pages/my_cards_page.dart';
import 'package:team_projects/ui/user/subpages/setting_pages/my_cars_page.dart';
import 'package:team_projects/ui/user/subpages/setting_pages/my_rewards.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Settings',
                      style: Theme.of(context).textTheme.headline1),
                  SizedBox(
                    height: 8.h,
                  ),
                  DefaultSettingsButton(
                    title: 'My cars',
                    icon: Icons.car_rental_rounded,
                    outline: false,
                    onPressed: (() {
                      Navigators.naviagteTo(context, MyCarsPage());
                    }),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  DefaultSettingsButton(
                    title: 'My cards',
                    icon: Icons.credit_card_rounded,
                    outline: true,
                    onPressed: (() {
                      Navigators.naviagteTo(context, MyCardsPage());
                    }),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  DefaultSettingsButton(
                    title: 'My balance',
                    icon: Icons.monetization_on_rounded,
                    outline: true,
                    onPressed: (() {
                      Navigators.naviagteTo(context, MyBalancePage());
                    }),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  DefaultSettingsButton(
                    title: 'My rewards',
                    icon: Icons.money,
                    outline: true,
                    onPressed: (() {
                      Navigators.naviagteTo(context, MyRewardsPage());
                    }),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  DefaultSettingsButton(
                    title: 'Sign out',
                    icon: Icons.logout,
                    outline: true,
                    onPressed: (() async {
                      await FirebaseAuth.instance.signOut();
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>  GetStarted(),
                        ),
                      );
                      //TODO: firebase
                      ///   sign out
                    }),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

class DefaultSettingsButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool outline;
  final void Function()? onPressed;

  const DefaultSettingsButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.outline,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      minWidth: double.infinity,
      elevation: 0,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: kBlue, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      color: outline ? kWhite : kBlue,
      padding: EdgeInsets.only(top: 5, right: 20, left: 40),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: outline ? kBlue : kWhite,
            size: 25,
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: outline ? kBlue : kWhite,
            ),
          ),
          Spacer(),
          Icon(
            Icons.arrow_right_outlined,
            color: outline ? kBlue : kWhite,
            size: 45,
          ),
        ],
      ),
    );
  }
}



/// draft 

  /// My reservations Button
    // DefaultSettingsButton(
    //   title: 'My reservations',
    //   icon: Icons.check_circle,
    //   outline: false,
    //   onPressed: (() {
    //     Navigators.naviagteTo(context, ReservationsPages());
    //   }),
    // ),
    // SizedBox(
    //   height: 15,
    // ),
