import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:team_projects/core/widgets/default_border_button.dart';
import 'package:team_projects/logic/reservation/reservation_cubit.dart';
import 'package:team_projects/worker/ui/subpages/request_pages/accepted_request_page.dart';
import 'package:team_projects/worker/ui/subpages/request_pages/new_request_page.dart';


class RequestsPages extends StatefulWidget {
  const RequestsPages({super.key});

  @override
  State<RequestsPages> createState() => _RequestsPagesState();
}

class _RequestsPagesState extends State<RequestsPages> {
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
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Requests',
                      style: Theme.of(context).textTheme.headline1),
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
                              isOutline: cubit.currentIndexRequestWorker == 1
                                  ? true
                                  : false,
                              title: 'New',
                              onPressed: () {
                                cubit.chagenIndexRequestWorker(0);
                                pageController.jumpToPage(0);
                              },
                              size: 42.w,
                            ),
                            DefultBorderButton(
                              isOutline: cubit.currentIndexRequestWorker == 0
                                  ? true
                                  : false,
                              title: 'Accepted',
                              size: 42.w,
                              onPressed: () {
                                cubit.chagenIndexRequestWorker(1);
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
                        NewOrderPage(),
                        AcceptedOrderPage(),
                      ],
                    ),
                  )
                ]),
          ),
        ));
  }
}

/// draft
  ///
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
  //
  ///
  // the Date text form feild
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
  ///
  // AppBar appBarReservationsPages(BuildContext context) {
  //   return AppBar(
  //     elevation: 0.0,
  //     backgroundColor: Colors.white,
  //     leading: Padding(
  //       padding: EdgeInsets.only(top: 10, left: 30),
  //       child: IconButton(
  //         onPressed: () {
  //           Navigator.of(context).pop();
  //         },
  //         icon: Icon(
  //           Icons.arrow_back_ios,
  //           color: AppColors.kBlue,
  //         ),
  //       ),
  //     ),
  //   );
  // }







//import 'package:flutter/material.dart';

// import 'package:wasela/core/style/colors.dart';

// class RequestsPage extends StatefulWidget {
//   const RequestsPage({super.key});

//   @override
//   State<RequestsPage> createState() => _RequestsPageState();
// }

// class _RequestsPageState extends State<RequestsPage> {
//   int currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(15),
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Orders',
//                     style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.w600,
//                       fontFamily: 'Roboto',
//                       fontStyle: FontStyle.normal,
//                       color: Color(0xff1c1447),
//                     ),
//                   ),
//                   const SizedBox(height: 6),
//                   const Text(
//                     'Car owners who ask for services ',
//                     style: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                         fontFamily: 'Roboto',
//                         fontStyle: FontStyle.normal,
//                         color: Color.fromRGBO(0, 0, 0, 0.6)),
//                   ),
//                   const SizedBox(height: 10.0),
//                   Container(
//                     padding: EdgeInsetsDirectional.only(end: 7),
//                     width: MediaQuery.of(context).size.width,
//                     height: 200,
//                     decoration: BoxDecoration(
//                       color: const Color.fromRGBO(243, 243, 243, 1),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top: 10, left: 20),
//                           child: Row(
//                             children: [
//                               const Expanded(
//                                 flex: 2,
//                                 child: Text(
//                                   "20 Oct,2022 / 8:00 PM",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 14.0,
//                                     color: Colors.red,
//                                   ),
//                                 ),
//                               ),
//                               ElevatedButton(
//                                 onPressed: () {
//                                   openDialog();
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                     primary: Colors.red,
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(
//                                       6,
//                                     )) // Background color
//                                     ),
//                                 child: const Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       vertical: 5.0, horizontal: 10.0),
//                                   child: Text(
//                                     "NEW",
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             InkWell(
//                               child: const Padding(
//                                 padding: EdgeInsets.only(top: 10, left: 20),
//                                 child: Icon(
//                                   Icons.local_car_wash_rounded,
//                                   color: Color(0xff1c1447),
//                                 ),
//                               ),
//                               onTap: () {
//                                 //action code when clicked
//                                 print("The icon is clicked");
//                               },
//                             ),
//                             const SizedBox(width: 10.0),
//                             const Text("Car washing  ",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 17.0,
//                                 )),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: const [],
//                             ),
//                           ],
//                         ),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             InkWell(
//                               child: const Padding(
//                                 padding: EdgeInsets.only(top: 10, left: 20),
//                                 child: Icon(
//                                   Icons.location_on_rounded,
//                                   color: Color(0xff1c1447),
//                                 ),
//                               ),
//                               onTap: () {
//                                 //action code when clicked
//                                 print("The icon is clicked");
//                               },
//                             ),
//                             SizedBox(width: 10.0),
//                             const Text("Mansoura , 2nd street",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 17.0,
//                                 )),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: const [
//                             Padding(
//                               padding:
//                                   EdgeInsets.only(top: 10, left: 10, right: 10),
//                               child: Text(
//                                 "35 LE",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 17.0,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     padding: EdgeInsetsDirectional.only(end: 7),
//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.height / 4,
//                     decoration: BoxDecoration(
//                       color: const Color.fromRGBO(243, 243, 243, 1),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsetsDirectional.only(top: 10),
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(top: 10, left: 20),
//                             child: Row(
//                               children: [
//                                 const Expanded(
//                                   child: Text(
//                                     "20 Oct,2022 / 8:00 PM",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 14.0,
//                                       color: Colors.red,
//                                     ),
//                                   ),
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     //   Navigator.push(
//                                     //       // context,
//                                     //       // MaterialPageRoute(
//                                     //       //   builder: (context) => WorkerPage(),
//                                     //       // ));
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                       primary: Colors.green,
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(
//                                         6,
//                                       )) // Background color
//                                       ),
//                                   child: const Text(
//                                     "Acceptable",
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               InkWell(
//                                 child: const Padding(
//                                   padding: EdgeInsets.only(top: 10, left: 20),
//                                   child: Icon(
//                                     Icons.local_car_wash_rounded,
//                                     color: Color(0xff1c1447),
//                                   ),
//                                 ),
//                                 onTap: () {
//                                   //action code when clicked
//                                   print("The icon is clicked");
//                                 },
//                               ),
//                               const SizedBox(width: 10.0),
//                               const Text("Car washing  ",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 17.0,
//                                   )),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: const [],
//                               ),
//                             ],
//                           ),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               InkWell(
//                                 child: const Padding(
//                                   padding: EdgeInsets.only(top: 10, left: 20),
//                                   child: Icon(
//                                     Icons.location_on_rounded,
//                                     color: Color(0xff1c1447),
//                                   ),
//                                 ),
//                                 onTap: () {
//                                   //action code when clicked
//                                   print("The icon is clicked");
//                                 },
//                               ),
//                               const SizedBox(width: 10.0),
//                               const Text("Mansoura , 2nd street",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 17.0,
//                                   )),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: const [
//                               Padding(
//                                 padding:
//                                     EdgeInsets.only(top: 10, left: 10, right: 10),
//                                 child: Text(
//                                   "35 LE",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 17.0,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ]),
//           ),
//         ),
//       ),
//     );
//   }

//   Future openDialog() => showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           titlePadding: const EdgeInsets.all(5),
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadiusDirectional.circular(20)),
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: const [
//               Icon(Icons.check_circle_rounded,
//                   color: Color(0xFF1c1447), size: 30),
//             ],
//           ),
//           content: const Text(
//             'You should sign in to see customer details',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 color: Color(0xFF1c1447),
//                 fontSize: 20,
//                 fontWeight: FontWeight.w500),
//           ),
//           actions: [
//             Center(
//               child: SizedBox(
//                 width: 180,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       primary: AppColors.kBlue,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadiusDirectional.circular(30))),
//                   onPressed: () {
//                     // Navigator.push(
//                     //     context,
//                     //     MaterialPageRoute(
//                     //       builder: (context) => SignIn(),
//                     //     ));
//                   },
//                   child: const Text(
//                     'SignIn',
//                     style: TextStyle(
//                       fontSize: 23,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       );
// }
