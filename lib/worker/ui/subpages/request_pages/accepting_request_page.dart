import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:team_projects/core/style/colors.dart';
import 'package:team_projects/core/widgets/default_border_button.dart';

// import 'package:signin_screen/core/style/colors.dart';

// import '../core/components/default_border_button.dart';
// import '../home_screens/ask a question.dart';
// import '../home_screens/help_page.dart';

class AcceptingRequestPage extends StatefulWidget {
  const AcceptingRequestPage({super.key});

  @override
  State<AcceptingRequestPage> createState() => _AcceptingRequestPageState();
}

class _AcceptingRequestPageState extends State<AcceptingRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBarAcceptingRequestPage(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Request',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(height: 5.0),
            Text(
              'Car owners who ask for services ',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 3.h),
            _ReservationCard(
              date: "20 Oct, 2022",
              progress: "Tyre Change",
              address: "Mansoura, 2nd Street",
              name: "Ahmed Ali",
              carModel: "BMW",
              plateNumber: "134-215",
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DefultBorderButton(
                  title: 'Accept',
                  onPressed: () {
                    // TODO: firebase
                    /// move the request form new list to Accepted list

                    // TODO: Map or chat
                  },
                  size: 40.w,
                ),
                DefultBorderButton(
                  isOutline: true,
                  title: 'Deny',
                  onPressed: () {
                    // TODO: firebase
                    /// move the request form new list to denied list

                    openDialog().then((value) {
                      Navigator.pop(context);
                    });
                  },
                  size: 40.w,
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }

  /// helper methods

  AppBar appBarAcceptingRequestPage(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: Color(0xff1c1447),
        ),
      ),
    );
  }

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            titlePadding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(20)),
            title: Column(
              children: const [
                Center(
                  child:
                      Icon(Icons.warning, color: Color(0xFF1c1447), size: 35),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                  'Reason for cancellation!',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: Color(0xFF1c1447)),
                )),
                SizedBox(height: 10)
              ],
            ),
            content: Container(
              // height: 80,
              decoration: BoxDecoration(
                  color: AppColors.kLightGrey,
                  borderRadius: BorderRadiusDirectional.circular(12)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: TextFormField(
                  maxLines: 3,
                  minLines: 3,
                  keyboardType: TextInputType.multiline,
                  cursorColor: AppColors.kBlue,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                      hintText: 'Notes',
                      hintStyle: TextStyle(color: AppColors.kBlue),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      contentPadding: EdgeInsetsDirectional.only(bottom: 20)),
                ),
              ),
            ),
            actions: [
              Center(
                  child: DefultBorderButton(
                onPressed: () {
                  // TODO: firebase
                  /// store the reason for cancellation of requests of users
                  Navigator.pop(context);
                },
                title: 'Send',
                size: 50.w,
              ))
            ],
          ));
}

/// builder widgets

class _ReservationCard extends StatelessWidget {
  final String date;
  final String progress;
  final String address;
  final String name;
  final String carModel;
  final String plateNumber;

  const _ReservationCard({
    required this.date,
    required this.progress,
    required this.address,
    required this.name,
    required this.carModel,
    required this.plateNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      width: 100.w,
      decoration: BoxDecoration(
        color: Color.fromRGBO(243, 243, 243, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    color: Colors.red,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(
                        6,
                      )),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 3.w),
                    child: Text(
                      "New",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.car_repair,
                  color: AppColors.kBlue,
                ),
                SizedBox(width: 10.0),
                Text(
                  progress,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: AppColors.kBlue,
                ),
                SizedBox(width: 10.0),
                Text(address,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    )),
              ],
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.person,
                  color: AppColors.kBlue,
                ),
                SizedBox(width: 10.0),
                Text(name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    )),
              ],
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.local_car_wash_outlined,
                  color: AppColors.kBlue,
                ),
                SizedBox(width: 10.0),
                Text("Car Model : $carModel",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    )),
              ],
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.numbers,
                  color: AppColors.kBlue,
                ),
                SizedBox(width: 10.0),
                Text(
                  "Plate Number : $plateNumber",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


/// Draft 

  // Container(
  //   padding: EdgeInsetsDirectional.all(20),
  //   width: 90.w,
  //   // height: 305,
  //   decoration: BoxDecoration(
  //     color: AppColors.kLightGrey,
  //     borderRadius: BorderRadius.circular(20),
  //   ),
  //   child: Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Row(
  //         children: [
  //           Expanded(
  //             child: Text(
  //               "20 Oct,2022 / 8:00 PM",
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 14.0,
  //                 color: Colors.red,
  //               ),
  //             ),
  //           ),
  //           ElevatedButton(
  //             onPressed: () {},
  //             style: ElevatedButton.styleFrom(
  //                 primary: Colors.red,
  //                 shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(
  //                   6,
  //                 )) // Background color
  //                 ),
  //             child: const Padding(
  //               padding: EdgeInsets.symmetric(
  //                   vertical: 5.0, horizontal: 10.0),
  //               child: Text(
  //                 "NEW",
  //                 style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 20,
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //               ),
  //             ),
  //           )
  //         ],
  //       ),
  //       Row(
  //         crossAxisAlignment: CrossAxisAlignment.end,
  //         children: [
  //           InkWell(
  //             child: Padding(
  //               padding: const EdgeInsets.only(top: 10, left: 20),
  //               child: Icon(
  //                 Icons.local_car_wash_rounded,
  //                 color: Color(0xff1c1447),
  //               ),
  //             ),
  //             onTap: () {
  //               //action code when clicked
  //               print("The icon is clicked");
  //             },
  //           ),
  //           SizedBox(width: 10.0),
  //           const Text("Car washing  ",
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 17.0,
  //               )),
  //         ],
  //       ),
  //       Row(
  //         crossAxisAlignment: CrossAxisAlignment.end,
  //         children: [
  //           InkWell(
  //             child: Padding(
  //               padding: const EdgeInsets.only(top: 10, left: 20),
  //               child: Icon(
  //                 Icons.location_on_rounded,
  //                 color: Color(0xff1c1447),
  //               ),
  //             ),
  //             onTap: () {
  //               //action code when clicked
  //               print("The icon is clicked");
  //             },
  //           ),
  //           SizedBox(width: 10.0),
  //           const Text("Mansoura , 2nd street",
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 17.0,
  //               )),
  //         ],
  //       ),
  //       Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.only(top: 10, left: 50),
  //               child: Text("Ahmed Mohammed",
  //                   style: TextStyle(
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 17.0,
  //                   )),
  //             ),
  //             SizedBox(height: 10.0),
  //             Padding(
  //               padding: const EdgeInsets.only(top: 10, left: 50),
  //               child: Text("Car model : Abarth  ",
  //                   style: TextStyle(
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 17.0,
  //                   )),
  //             ),
  //             SizedBox(height: 10.0),
  //             Padding(
  //               padding: const EdgeInsets.only(top: 10, left: 50),
  //               child: Text("Plate number : 65738 ",
  //                   style: TextStyle(
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 17.0,
  //                   )),
  //             ),
  //           ]),
  //       SizedBox(height: 5.0),
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.end,
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.only(
  //                 left: 10, right: 10, bottom: 10),
  //             child: Text(
  //               "35 LE",
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 17.0,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ],
  //   ),
  // )

  // Row of two buttons
  // Row(
  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //     children: [
  //   Expanded(
  //     child: Container(
  //       height: 45,
  //       child: ElevatedButton(
  //         onPressed: () {},
  //         style: ElevatedButton.styleFrom(
  //             primary: Color.fromRGBO(23, 16, 67, 1),
  //             side: BorderSide(color: Color(0xff1c1447), width: 2),
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(
  //               16,
  //             ))),
  //         child: Text(
  //           "Accept",
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontSize: 23,
  //             fontWeight: FontWeight.w600,
  //           ),
  //         ),
  //       ),
  //     ),
  //   ),
  //   SizedBox(width: 15),
  //   Expanded(
  //     child: Container(
  //       height: 45,
  //       child: ElevatedButton(
  //         onPressed: () {
  //           openDialog();
  //         },
  //         style: ElevatedButton.styleFrom(
  //             primary: Colors.white,
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(
  //               16,
  //             )) // Background color
  //             ),
  //         child: Text(
  //           "deny",
  //           style: TextStyle(
  //             color: AppColors.kBlue,
  //             fontSize: 23,
  //             fontWeight: FontWeight.w600,
  //           ),
  //         ),
  //       ),
  //     ),
  //   ),
  // ])

  // menu for dening request
  //  Container(
  //   width: 235,
  //   clipBehavior: Clip.antiAlias,
  //   height: 40,
  //   decoration: BoxDecoration(
  //     color: AppColors.kGrey,
  //     borderRadius: BorderRadius.circular(50),
  //   ),
  //   child: DropdownButtonHideUnderline(
  //     child: DropdownButton<String>(
  //       hint: Padding(
  //         padding: const EdgeInsets.all(9),
  //         child: Text(
  //           'Choose a reason',
  //           style:
  //               TextStyle(fontSize: 18, color: AppColors.kBlue),
  //         ),
  //       ),
  //       icon: const Icon(
  //         Icons.arrow_drop_down,
  //         color: Colors.black,
  //       ),
  //       isExpanded: true,
  //       iconSize: 30,
  //       value: value,
  //       // items: items.map(buildMinueItem).toList(),
  //       onChanged: (value) => setState(() => this.value = value),
  //     ),
  //   ),
  // )