import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:team_projects/core/style/colors.dart';
import 'package:team_projects/core/widgets/default_border_button.dart';
import 'package:team_projects/logic/reservation/reservation_cubit.dart';
import 'package:team_projects/ui/user/subpages/orders_pages/precedent_page.dart';
import 'package:team_projects/ui/user/subpages/orders_pages/required_page.dart';


class OrdersPages extends StatefulWidget {
  const OrdersPages({super.key});

  @override
  State<OrdersPages> createState() => _OrdersPagesState();
}

class _OrdersPagesState extends State<OrdersPages> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: appBarReservationsPages(context),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Orders',
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        ?.copyWith(fontSize: 18.sp),
                  ),
                  SizedBox(height: 4.h),
                  BlocProvider(
                    create: (context) => ReservationCubit(),
                    child: BlocBuilder<ReservationCubit, ReservationState>(
                      builder: (context, state) {
                        var cubit = ReservationCubit.get(context);
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DefultBorderButton(
                              isOutline: cubit.currentIndexUser == 1 ? true : false,
                              title: 'Required',
                              onPressed: () {
                                cubit.chagenIndexUser(0);
                                pageController.jumpToPage(0);
                              },
                              size: 42.w,
                            ),
                            DefultBorderButton(
                              isOutline: cubit.currentIndexUser == 0 ? true : false,
                              title: 'Precedent',
                              size: 42.w,
                              onPressed: () {
                                cubit.chagenIndexUser(1);
                                pageController.jumpToPage(1);
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Expanded(
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: pageController,
                      children: const [
                        RequiredPage(),
                        PrecedentPage(),
                      ],
                    ),
                  )
                ]),
          ),
        ));
  }

  /// helper methods

  AppBar appBarReservationsPages(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      leading: Padding(
        padding: EdgeInsets.only(top: 10, left: 30),
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: kBlue,
          ),
        ),
      ),
    );
  }
}

/// draft

/// Row of two button
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
//   Expanded(
//     child: SizedBox(
//       height: 45,
//       child: ElevatedButton(
//         onPressed: () {},
//         style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.white,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(
//               16,
//             )) // Background color
//             ),
//         child: Text(
//           "Coming",
//           style: TextStyle(
//             color: Color.fromRGBO(142, 142, 142, 1),
//             fontSize: 20,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     ),
//   ),
//   SizedBox(
//     width: 20,
//   ),
//   Expanded(
//     child: SizedBox(
//       height: 45,
//       child: ElevatedButton(
//         onPressed: () {},
//         style: ElevatedButton.styleFrom(
//             backgroundColor: Color.fromRGBO(23, 16, 67, 1),
//             side: BorderSide(
//                 color: Color(0xff1c1447), width: 2),
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(
//               16,
//             ))),
//         child: Text(
//           "precedent",
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     ),
//   ),
// ])

/// the Date text form feild
//Text(
//   'Date',
//   style: TextStyle(
//     fontSize: 17,
//     fontWeight: FontWeight.w500,
//     fontFamily: 'Roboto',
//     fontStyle: FontStyle.normal,
//     color: Color.fromRGBO(106, 103, 103, 1),
//   ),
// ),
// SizedBox(
//   height: 6,
// ),
// TextFormField(
//   style: TextStyle(
//     color: Color.fromRGBO(106, 103, 103, 1),
//   ),
//   keyboardType: TextInputType.datetime,
//   controller: dateController,
//   onFieldSubmitted: (value) {
//     print(value);
//   },
//   onChanged: (value) {
//     print(value);
//   },
//   decoration: InputDecoration(
//     filled: true,
//     fillColor: Color.fromRGBO(242, 240, 240, 1),
//     labelText: '00-00-0000',
//     labelStyle: TextStyle(
//       color: Color.fromRGBO(271, 271, 271, 1),
//     ),
//     prefixIcon: Icon(
//       Icons.calendar_today,
//       color: Color.fromRGBO(28, 20, 71, 1),
//     ),
//     border: OutlineInputBorder(),
//     enabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(16.0),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(16),
//     ),
//   ),
// ),
// SizedBox(
//   height: 15.0,
// ),
