import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:team_projects/core/style/colors.dart';

enum Status { New, Accepted, Done, Denied }

class ReservationCard extends StatelessWidget {
  final Status status;
  final String date;
  final String progress;
  final String address;
  final double price;

  ReservationCard({
    super.key,
    required this.status,
    required this.date,
    required this.progress,
    required this.address,
    required this.price,
  });

  late String title;
  late Color color;

  getMark() {
    switch (status) {
      case Status.New:
        {
          title = 'New';
          color = Colors.red;
        }
        break;
      case Status.Accepted:
        {
          title = 'Accepted';
          color = Colors.green;
        }
        break;
      case Status.Done:
        {
          title = 'Done';
          color = Colors.green;
        }
        break;
      case Status.Denied:
        {
          title = 'Denied';
          color = Colors.grey;
        }
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    getMark();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.all(10),
        width: 100.w,
        height: 25.h,
        decoration: BoxDecoration(
          color: Color.fromRGBO(243, 243, 243, 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: Row(
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
                        color: color,
                        borderRadius: BorderRadius.circular(
                          6,
                        )),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 3.w),
                      child: Text(
                        title,
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
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Icon(
                    Icons.local_car_wash_rounded,
                    color: AppColors.kBlue,
                  ),
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Icon(
                    Icons.location_on_rounded,
                    color: AppColors.kBlue,
                  ),
                ),
                SizedBox(width: 10.0),
                Text(address,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 20),
                  child: Text(
                    "$price LE",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),
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
