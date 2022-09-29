/// External Packages
import 'package:flutter_bloc/flutter_bloc.dart';

/// Core Packages
import 'package:flutter/material.dart';
import 'package:team_projects/core/style/colors.dart';
import 'package:team_projects/logic/bottom_navigation/bottom_navigation_cubit.dart';

import 'package:team_projects/ui/user/main_pages/help_page.dart';
import 'package:team_projects/ui/user/main_pages/home_page.dart';
import 'package:team_projects/ui/user/main_pages/orders_pages.dart';
import 'package:team_projects/ui/user/main_pages/settings_page.dart';

/// App Files


class BottomNavigationPage extends StatelessWidget {
  BottomNavigationPage({super.key});

  List<Widget> screens = [
    HomePage(),
    HelpPage(),
    OrdersPages(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (context, state) {
        var cubit = BottomNavigationCubit.get(context);
        return Scaffold(
          body: IndexedStack(
            index: cubit.currentIndexUser,
            children: screens,
          ),
          bottomNavigationBar: homePageBottomNavigationBar(cubit),
        );
      },
    );
  }

  homePageBottomNavigationBar(cubit) {
    return BottomNavigationBar(
      fixedColor: kBlue,
      currentIndex: cubit.currentIndexUser,
      onTap: (index) {
        cubit.changeIndexUser(index);
      },
      type: BottomNavigationBarType.fixed,
      elevation: 10,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Help'),
        BottomNavigationBarItem(icon: Icon(Icons.add_alert), label: 'Orders'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }
}
