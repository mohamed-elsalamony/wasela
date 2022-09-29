// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:team_projects/core/resources/constants_variables.dart';
import 'package:team_projects/core/style/colors.dart';
import 'package:team_projects/core/widgets/default_alert_dialog.dart';
import 'package:team_projects/core/widgets/default_border_button.dart';


class ServiceProvisionPage extends StatefulWidget {
  const ServiceProvisionPage({super.key});

  @override
  State<ServiceProvisionPage> createState() => _ServiceProvisionPage();
}

class _ServiceProvisionPage extends State<ServiceProvisionPage> {
  String? value;
  String? make;
  String? item;

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarServiceProvisionPage(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Service Provision',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.normal,
                  color: AppColors.kBlue,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'The Places where you can provide your services',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.normal,
                  color: AppColors.kBlue,
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              DefaultDropMenu(
                // TODO: firebase
                ///   the question that we will be recieved and answer it
                list: ServiceProvision.cities,
                hint: "City",
              ),
              SizedBox(
                height: 6.h,
              ),
              DefaultDropMenu(
                // TODO: firebase
                ///   the question that we will be recieved and answer it
                list: ServiceProvision.sections,
                hint: "Section",
              ),
              Spacer(),
              DefultBorderButton(
                title: 'Add',
                onPressed: () {
                  showDialog(context: context, builder: (context){
                   return DoneAlertDialog(title: "Done !", done: true);
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBarServiceProvisionPage(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.kWhite,
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
}

class DefaultDropMenu extends StatefulWidget {
  final String hint;
  final List<String> list;

  const DefaultDropMenu({
    Key? key,
    required this.list,
    required this.hint,
  }) : super(key: key);

  @override
  State<DefaultDropMenu> createState() => _DefaultDropMenuState();
}

class _DefaultDropMenuState extends State<DefaultDropMenu> {
  String? item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 2.w),
      decoration: BoxDecoration(
        color: AppColors.kLightGrey,
        border: Border.all(color: Colors.black38, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(
            widget.hint,
            style: TextStyle(fontSize: 18),
          ),
          icon: Icon(
            Icons.arrow_drop_down,
            color: AppColors.kBlue,
          ),
          iconSize: 36,
          isExpanded: true,
          value: item,
          items: widget.list.map(buildMinueItem).toList(),
          onChanged: (String? value) {
            setState(() {
              item = value;
            });
            // Navigators.naviagteTo(
            //   context,
            //   AnswerQuestionPage(question: value),
            // );
          },
        ),
      ),
    );
  }
}

DropdownMenuItem<String> buildMinueItem(String item) => DropdownMenuItem(
      value: item,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          item,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
