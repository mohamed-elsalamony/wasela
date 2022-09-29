import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path/path.dart' show basename;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:team_projects/core/style/colors.dart';
import 'package:team_projects/core/widgets/default_border_button.dart';
import 'package:team_projects/core/widgets/default_drop_menu.dart';
import 'package:team_projects/core/widgets/default_text_field.dart';

// import '../home_screens/help_page.dart';

class WorkerInformations extends StatefulWidget {
  const WorkerInformations({super.key});

  @override
  State<WorkerInformations> createState() => _WorkerInformationsState();
}

class _WorkerInformationsState extends State<WorkerInformations> {
  List<String> items = ['Mansoura', 'Alex', 'Cairo', 'Poorsaid ', 'Tanta'];
  String? value;
  TextEditingController nameController = TextEditingController();
  TextEditingController xxxController = TextEditingController();
  TextEditingController addresController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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

  final Credential = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kWhite,
        appBar: AppBar(
          backgroundColor: AppColors.kWhite,
          elevation: 0,
          leading: MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColors.kBlue,
            ),
          ),
        ),
        body: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Informations',
                    style: TextStyle(
                        color: AppColors.kBlue,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Center(
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: AppColors.kLightGrey,
                          borderRadius: BorderRadiusDirectional.circular(50)),
                      child: IconButton(
                          onPressed: () {
                            pickImage(ImageSource.gallery);
                          },
                          icon: Icon(Icons.camera_alt_outlined),
                          alignment: AlignmentDirectional.bottomStart),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DefualtTextField(
                    controller: nameController,
                    labelText: 'Full Name',
                    isPassword: false,
                    isObsecure: false,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DefualtTextField(
                      controller: xxxController,
                      labelText: '5 xxx xxx xx',
                      isPassword: false,
                      isObsecure: false),
                  const SizedBox(
                    height: 15,
                  ),
                  DefualtTextField(
                      controller: addresController,
                      labelText: 'your adress',
                      isPassword: false,
                      isObsecure: false),
                  const SizedBox(
                    height: 15,
                  ),
                  DefualtTextField(
                      controller: phoneController,
                      labelText: 'your phone',
                      isPassword: false,
                      isObsecure: false),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    height: 45,
                    decoration: BoxDecoration(
                      color: AppColors.kLightGrey,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint: Padding(
                          padding: const EdgeInsetsDirectional.only(start: 15),
                          child: Text(
                            'City',
                            style:
                                TextStyle(fontSize: 18, color: AppColors.kBlue),
                          ),
                        ),
                        icon: const Padding(
                          padding: EdgeInsetsDirectional.only(end: 10),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ),
                        ),
                        isExpanded: true,
                        iconSize: 30,
                        value: value,
                        items: items.map(buildMenuItem).toList(),
                        onChanged: (value) =>
                            setState(() => this.value = value),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  DefultBorderButton(
                    title: 'Save',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 70,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
