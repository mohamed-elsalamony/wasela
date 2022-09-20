import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:team_projects/core/style/colors.dart';


class ChangeLanguagePage extends StatefulWidget {
  const ChangeLanguagePage({Key? key}) : super(key: key);

  @override
  ChangeLanguagePageState createState() => ChangeLanguagePageState();
}

class ChangeLanguagePageState extends State<ChangeLanguagePage> {
  String _selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarChangeLanguagePage(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "Change Language",
              style: TextStyle(
                  color: AppColors.kBlue,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Select the language of the application",
              style: TextStyle(
                  color: AppColors.kBlue,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700),
            ),
             SizedBox(
              height: 3.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.kLightGrey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Radio<String>(
                    value: 'English',
                    groupValue: _selectedLanguage,
                    onChanged: (value) {
                          _selectedLanguage = value!;
                    },
                    activeColor: AppColors.kBlue),
                title: const Text('English'),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  AppBar appBarChangeLanguagePage(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Color(0xff1c1447),
        ),
      ),
    );
  }
}


/// Draft

  // Arabic Language
  // const SizedBox(
  //   height: 10,
  // ),
  // Container(
  //   decoration: BoxDecoration(
  //     color: AppColors.kGrey,
  //     borderRadius: BorderRadius.circular(10),
  //   ),
  //   child: ListTile(
  //     leading: Radio<String>(
  //       value: 'Arabic',
  //       groupValue: _selectedLanguage,
  //       onChanged: (value) {
  //         setState(() {
  //           _selectedLanguage = value!;
  //         });
  //       },
  //       activeColor: AppColors.kBlue,
  //     ),
  //     title: const Text('Arabic'),
  //   ),
  // ),
  // const SizedBox(height: 25),