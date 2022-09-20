import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:team_projects/core/style/colors.dart';
import 'package:team_projects/core/widgets/default_border_button.dart';
import 'package:team_projects/core/widgets/snackpar.dart';

class AskAQuestion extends StatefulWidget {
  const AskAQuestion({Key? key}) : super(key: key);

  @override
  State<AskAQuestion> createState() => _AskAQuestionState();
}

class _AskAQuestionState extends State<AskAQuestion> {
  late TextEditingController questionController;
  late TextEditingController commentController;

  @override
  void initState() {
    super.initState();
    questionController = TextEditingController();
    commentController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    questionController.dispose();
    commentController.dispose();
  }

  sendData() {
    CollectionReference users =
        FirebaseFirestore.instance.collection('ASKQUEST');

    users
        .doc('ABC123')
        .set({
          'Write QUESTION': questionController.text,
          'commend': commentController.text
        })
        .then((value) => print("add"))
        .catchError(
            (error) => print("  $error"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarAskAQuestionPage(context),
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Ask a question',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    'Write down your question here ',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  TextFormFieldBox(
                    height: 20.h,
                    controller: questionController,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    'Add a comment  ',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  TextFormFieldBox(height: 15.h, controller: commentController),
                  SizedBox(
                    height: 5.h,
                  ),
                  DefultBorderButton(
                    title: 'Send',
                    onPressed: () {
                      sendData();
                      // TODO: firebase
                      /// take the questionController & commentController
                      /// and store them in firestore

                      // TODO: connectiviy
                      ///  check if there is network to save or not
                      openDialog();
                    },
                    isOutline: false,
                  )
                ]),
          ),
        ),
      ),
    );
  }

  /// helper mehtods

  AppBar appBarAskAQuestionPage(BuildContext context) {
    return AppBar(
      backgroundColor: kWhite,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Color(0xff1c1447),
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            titlePadding: EdgeInsets.all(5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(20)),
            title: Column(
              children: [
                Icon(Icons.check_circle_rounded, color: kBlue, size: 30),
                Center(
                    child: Text(
                  'Thank you!',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(fontSize: 15.sp),
                )),
              ],
            ),
            content: const Text(
              'Your reservation has been successfully confirmed',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF1c1447),
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            actions: [
              Center(
                child: DefultBorderButton(
                  title: 'Done',
                  onPressed: () => Navigator.pop(context),
                  size: 40.w,
                  isOutline: false,
                ),
              )
            ],
          ));
}

/// builder widgets

class TextFormFieldBox extends StatelessWidget {
  final double height;
  final TextEditingController controller;
  const TextFormFieldBox({
    Key? key,
    required this.height,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: height,
      decoration: BoxDecoration(
        color: kLightGrey,
        border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.25), width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: controller,
          style: TextStyle(fontSize: 13.sp),
          minLines: 2,
          maxLines: 5,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
              contentPadding: EdgeInsets.only(bottom: 30)),
        ),
      ),
    );
  }
}


/// Draft

  /// no need bottom navigation bar
    //bottomNavigationBar: BottomNavigationBar(
    //   fixedColor: Color(0xFF1c1447),
    //   currentIndex: currentIndex,
    //   onTap: (index) {
    //     setState(() {
    //       currentIndex = index;
    //     });
    //   },
    //   type: BottomNavigationBarType.fixed,
    //   elevation: 10,
    //   items: [
    //     BottomNavigationBarItem(
    //         icon: Icon(
    //           Icons.home_filled,
    //         ),
    //         label: 'Home'),
    //     BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Help'),
    //     BottomNavigationBarItem(icon: Icon(Icons.add_alert), label: 'Orders'),
    //     BottomNavigationBarItem(
    //         icon: Icon(Icons.settings), label: 'Settings'),
    //   ],
    // ),

  /// AppBar Draft
    // AppBar(
    //         elevation: 0.0,
    //         backgroundColor: Colors.white,
    //         leading: MaterialButton(
    //           onPressed: (){
    //             Navigator.of(context).pop();
    //           },
    //           child: Icon(
    //             Icons.arrow_back_ios,
    //             color: Color(0xff1c1447),
    //           ),
    //         ),
    // )

  /// button draft
    // SizedBox(
    //   width: double.infinity,
    //   height: 45,
    //   child: ElevatedButton(
    //     onPressed: () {
    //       openDialog();
    //     },
    //     style: ElevatedButton.styleFrom(
    //         primary: Color.fromRGBO(28, 20, 71, 1),
    //         shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(
    //           16,
    //         )) // Background color
    //         ),
    //     child: Text(
    //       "Send",
    //       textAlign: TextAlign.center,
    //       style: TextStyle(
    //         color: Colors.white,
    //         fontSize: 25,
    //         fontWeight: FontWeight.w600,
    //       ),
    //     ),
    //   ),
    // )

  /// button in alert dilog
    // Container(    
    //   width: 180,
    //   child: ElevatedButton(
    //     style: ElevatedButton.styleFrom(
    //         primary: Color(0xFF1c1447),
    //         shape: RoundedRectangleBorder(
    //             borderRadius:
    //                 BorderRadiusDirectional.circular(30))),
    //     onPressed: () {
    //       Navigator.of(context).pop();
    //     },
    //     child: Text(
    //       'Done',
    //       style: TextStyle(
    //         fontSize: 23,
    //         fontWeight: FontWeight.w500,
    //         color: Colors.white,
    //       ),
    //     ),
    //   ),
    // ),

        
      