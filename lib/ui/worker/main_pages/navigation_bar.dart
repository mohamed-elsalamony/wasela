import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_projects/core/style/colors.dart';
import 'package:team_projects/logic/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:team_projects/ui/worker/main_pages/ex_orders_pages.dart';
import 'package:team_projects/ui/worker/main_pages/requests_pages.dart';

// import 'package:signin_screen/worker_screen/worker_page.dart';

import 'worker_profile_page.dart';
import 'mybalance.dart';

class BottomNavigationPageWorker extends StatelessWidget {
  BottomNavigationPageWorker({super.key});

  List<Widget> screens = [
    RequestsPages(),
    ExOrdersPages(),
    MyBalance(),
    WorkerProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (context, state) {
        var cubit = BottomNavigationCubit.get(context);
        return Scaffold(
          body: IndexedStack(
            index: cubit.currentIndexWorker,
            children: screens,
          ),
          bottomNavigationBar: homePageBottomNavigationBar(cubit),
        );
      },
    );
  }

  homePageBottomNavigationBar(cubit) {
    return BottomNavigationBar(
      fixedColor: AppColors.kBlue,
      currentIndex: cubit.currentIndexWorker,
      onTap: (index) {
        cubit.changeIndexWorker(index);
      },
      type: BottomNavigationBarType.fixed,
      elevation: 10,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.local_car_wash_outlined,
            ),
            label: 'Request'),
        BottomNavigationBarItem(
          icon: Icon(Icons.check_circle_rounded),
          label: 'Ex Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.monetization_on_rounded),
          label: 'Balance',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_rounded),
          label: 'Profile',
        ),
      ],
    );
  }
}






/// Draft
  // class NavigationTest extends StatefulWidget {
  //
  //   const NavigationTest({super.key});
  //
  //   @override
  //   State<NavigationTest> createState() => _NavigationTestState();
  // }
  //
  // class _NavigationTestState extends State<NavigationTest> {
  //   int currentIndex = 0;
  //   List<Widget> screens = [
  //     HomePageOrders(),
  //     ExpiredOrders(),
  //     MyBalance(),
  //     WorkerProfile()
  //   ];
  //   @override
  //   Widget build(BuildContext context) {
  //     return Scaffold(
  //       body: screens[currentIndex],
  //       backgroundColor: AppColors.kWhite,
  //       bottomNavigationBar: BottomNavigationBar(
  //         fixedColor: AppColors.kBlue,
  //         currentIndex: currentIndex,
  //         onTap: (index) {
  //           setState(() {
  //             currentIndex = index;
  //           });
  //         },
  //         type: BottomNavigationBarType.fixed,
  //         elevation: 10,
  //         items: const [
  //           BottomNavigationBarItem(
  //               icon: Icon(
  //                 Icons.local_car_wash_outlined,
  //               ),
  //               label: 'Request'),
  //           BottomNavigationBarItem(
  //             icon: Icon(Icons.check_circle_rounded),
  //             label: 'Ex Orders',
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Icon(Icons.monetization_on_rounded),
  //             label: 'Balance',
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Icon(Icons.account_circle_rounded),
  //             label: 'Profile',
  //           ),
  //         ],
  //       ),
  //     );
  //   }
// }
