import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:team_projects/core/resources/navigators.dart';
import 'package:team_projects/core/style/colors.dart';
import 'package:team_projects/core/widgets/default_border_button.dart';
import 'package:team_projects/user/ui/subpages/map_pages/flutter_map.dart';


class SelectPage extends StatefulWidget {
  final String headLine;
  final String subTitle;
  final List selectList;
  const SelectPage({
    super.key,
    required this.headLine,
    required this.subTitle,
    required this.selectList,
  });

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  int currentValue = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSelectPage(context),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 5.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.headLine,
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              widget.subTitle,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 4.h,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: widget.selectList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 2.h,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        if (currentValue != index) {
                          currentValue = index;
                        }
                      });
                    },
                    child: RadioContainer(
                      title: widget.selectList[index],
                      value: index,
                      currentValue: currentValue,
                    ),
                  );
                },
              ),
            ),
            DefultBorderButton(
              title: 'Confirm',
              onPressed: () {
                // TODO: remember
                /// you can use variable currentvalue index to know any choice
                /// String choice = widget.selectList[currentValue];
                Navigators.naviagteTo(context, MapPage());
              }, isOutline: false,
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBarSelectPage(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Color(0xFF1c1447),
            size: 40,
          )),
    );
  }
}

class RadioContainer extends StatelessWidget {
  final String title;
  final int value;
  final int currentValue;

  const RadioContainer({
    super.key,
    required this.title,
    required this.value,
    required this.currentValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadiusDirectional.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, color: kBlue),
          ),
          Transform.scale(
            scale: 1.2,
            child: Radio<int>(
              value: value,
              groupValue: currentValue,
              onChanged: (_) {},
              activeColor: Color(0xFF1c1447),
            ),
          ),
        ],
      ),
    );
  }
}

/// Draft

/// Column of radio list
//   Container(
//     width: double.infinity,
//     decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadiusDirectional.circular(10)),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(right: 120),
//           child: Text(
//             'Oil for 1000 KM',
//             style: TextStyle(fontSize: 20),
//           ),
//         ),
//         Transform.scale(
//           scale: 1.2,
//           child: Radio<int>(
//             value: 1,
//             groupValue: _value,
//             onChanged: (value) {
//               setState(() {
//                 _value = value;
//               });
//             },
//             activeColor: Color(0xFF1c1447),
//           ),
//         ),
//       ],
//     ),
//   ),
//   SizedBox(
//     height: 20,
//   ),
//   Container(
//     width: double.infinity,
//     decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadiusDirectional.circular(10)),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(right: 120),
//           child: Text(
//             'Oil for 5000 KM',
//             style: TextStyle(fontSize: 20),
//           ),
//         ),
//         Transform.scale(
//           scale: 1.2,
//           child: Radio<int>(
//             value: 2,
//             groupValue: _value,
//             onChanged: (value) {
//               setState(() {
//                 _value = value;
//               });
//             },
//             activeColor: Color(0xFF1c1447),
//           ),
//         ),
//       ],
//     ),
//   ),
//   SizedBox(
//     height: 20,
//   ),
//   Container(
//     width: double.infinity,
//     decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadiusDirectional.circular(10)),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(right: 110),
//           child: Text(
//             'Oil for 10000 KM',
//             style: TextStyle(fontSize: 20),
//           ),
//         ),
//         Transform.scale(
//           scale: 1.2,
//           child: Radio<int>(
//             value: 3,
//             groupValue: _value,
//             onChanged: (value) {
//               setState(() {
//                 _value = value;
//               });
//             },
//             activeColor: Color(0xFF1c1447),
//           ),
//         ),
//       ],
//     ),
//   ),
//   SizedBox(
//     height: 20,
//   ),
//   Container(
//     width: double.infinity,
//     decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadiusDirectional.circular(10)),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(right: 110),
//           child: Text(
//             'Oil for 20000 KM',
//             style: TextStyle(fontSize: 20),
//           ),
//         ),
//         Transform.scale(
//           scale: 1.2,
//           child: Radio<int>(
//             value: 4,
//             groupValue: _value,
//             onChanged: (value) {
//               setState(() {
//                 _value = value;
//               });
//             },
//             activeColor: Color(0xFF1c1447),
//           ),
//         ),
//       ],
//     ),
//   ),
//   SizedBox(
//     height: 160,
//   ),
//   Center(
//     child: Container(
//         width: double.infinity,
//         height: 45,
//         decoration: BoxDecoration(
//             color: Color(0xFF1c1447),
//             borderRadius: BorderRadius.circular(20)),
//         child: TextButton(
//             onPressed: () {
//               // Navigator.push(context,
//               //     MaterialPageRoute(builder: (context)=>ProblemService()));
//             },
//             child: Text(
//               'Confirm',
//               style: TextStyle(
//                   fontSize: 27,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white),
//             ))),
//   )
// ],
