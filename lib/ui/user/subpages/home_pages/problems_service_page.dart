
/// external packages
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:path/path.dart' show basename;

/// core packges
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';

/// app files
import 'package:team_projects/core/resources/navigators.dart';
import 'package:team_projects/core/widgets/default_alert_dialog.dart';
import 'package:team_projects/core/widgets/default_border_button.dart';
import 'package:team_projects/ui/shared/map_pages/flutter_map.dart';
// import 'package:signin_screen/home_screens/review_reservation.dart';

class ProblemServicePage extends StatefulWidget {
  const ProblemServicePage({super.key});

  @override
  State<ProblemServicePage> createState() => _ProblemServicePageState();
}

class _ProblemServicePageState extends State<ProblemServicePage> {
  String? imgName;
  late TextEditingController discriptionController;
  File? image;
  confirmPhptp() async {
    final storageRef = FirebaseStorage.instance.ref(imgName);
    await storageRef.putFile(image!);
  }

  Future pickImage(ImageSource source) async {
    image = null;
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemorary = File(image.path);
      this.image = imageTemorary;
      String imgName = basename(image.path);
       int random = Random().nextInt(9999999);
  imgName = "$random$imgName";
    } on PlatformException catch (error) {
      print('the error of pick image is $error');
    }
  }

  @override
  void initState() {
    super.initState();
    discriptionController = TextEditingController();
  }

  @override
  void dispose() {
    discriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBarProblemServicePage(context),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Problems Service',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1c1447)),
              ),
              SizedBox(
                height: 4.h,
              ),
              const Text(
                'Upload Image',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color(0xFF1c1447)),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Container(
                // height: 80,
                padding: const EdgeInsets.symmetric(vertical: 5),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(17)),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          pickImage(ImageSource.gallery).then((value) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return DoneAlertDialog(
                                    title: image != null
                                        ? 'The Image Uploaded Successfully'
                                        : 'No Image Uploadoed',
                                    done: image != null ? true : false,
                                  );
                                });
                          });
                        },
                        child: const Icon(Icons.add_box_rounded,
                            size: 55, color: Color(0xFF1c1447)),
                      ),
                      InkWell(
                        onTap: () {
                          pickImage(ImageSource.camera).then((value) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return DoneAlertDialog(
                                  title: image != null
                                      ? 'The Image Uploaded Successfully'
                                      : 'No Image Uploadoed',
                                  done: image != null ? true : false,
                                );
                              },
                            );
                          });
                        },
                        child: const Icon(Icons.camera_alt,
                            size: 55, color: Color(0xFF1c1447)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              const Text(
                'Add discription',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(17),
                ),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: discriptionController,
                  style: TextStyle(fontSize: 20),
                  minLines: 4,
                  maxLines: 4,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      contentPadding: EdgeInsets.only(bottom: 30)),
                ),
              ),
              const Spacer(),
              DefultBorderButton(
                title: 'Confirm',
                onPressed: () {
                  // confirmPhptp();
                  if(image!=null){
                     confirmPhptp();
                  }
                  //TODO: firebase
                  /// you can use discriptionController & image

                  Navigators.naviagteTo(context, MapPage());
                },
                isOutline: false,
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBarProblemServicePage(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Color(0xFF1c1447),
            size: 40,
          )),
    );
  }
}



/// Draft 
  /// the confirm button
  // Container(
  //   height: 45,
  //   width: double.infinity,
  //   decoration: BoxDecoration(
  //     color: Color(0xFF1c1447),
  //     borderRadius: BorderRadius.circular(17),
  //   ),
  //   child: TextButton(
  //     onPressed: () {
  //       // Navigator.push(context,
  //       //     MaterialPageRoute(builder: (context)=>ReviewReservation()));
  //     },
  //     child: Text(
  //       'Confirm',
  //       style: TextStyle(
  //           fontWeight: FontWeight.bold,
  //           fontSize: 25,
  //           color: Colors.white),
  //     ),
  //   ),
  // )
