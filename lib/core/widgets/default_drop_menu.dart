import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:team_projects/core/style/colors.dart';

class DefaultDropMenu extends StatefulWidget {
  final String hint;
  final List<String> list;

  const DefaultDropMenu({
    Key? key,
    required this.hint,
    required this.list,
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
          items: widget.list.map(buildMenuItem).toList(),
          onChanged: (String? value) {
            setState(() {
              item = value;
            });
          },
        ),
      ),
    );
  }
}
   DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(
        value: item,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            item,
            style: TextStyle(fontSize: 20),
          ),
        ),
      );