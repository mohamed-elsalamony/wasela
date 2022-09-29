import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:sizer/sizer.dart';
import 'package:team_projects/core/style/colors.dart';
import 'package:team_projects/core/widgets/default_border_button.dart';
import 'package:team_projects/ui/shared/map_pages/web_view.dart';

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String contant;
  final bool canContact;
  final LatLng origin;
  final LatLng distination;
  final void Function()? contactButton;

   MyAlertDialog({
    Key? key,
    required this.title,
    required this.contant,
    required this.canContact,
    required this.distination,
    required this.origin,
    this.contactButton,
  }) : super(key: key);

  String imageUrl =
      "https://media.istockphoto.com/photos/service-drivethru-picture-id180709551?k=20&m=180709551&s=612x612&w=0&h=MmLyCgyc2K0QXlwVX83IlzdKdK4rADVg7PZU5rBPi0A=";


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        // mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Text(title),
        ],
      ),
      content: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                contant,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text('43 minute',
                  style: TextStyle(fontSize: 17, color: Colors.grey[800])),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text('110 LE',
                  style: TextStyle(fontSize: 17, color: Colors.grey[800])),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text('Mansoura, 12 street',
                  style: TextStyle(fontSize: 17, color: Colors.grey[800])),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: ((context) {
              return WebViewScreen(
                origin: origin,
                distination: distination,
                zoom: 16,
              );
            })));
          },
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
            backgroundColor: Color.fromRGBO(28, 20, 71, 1),
          ),
          child: Text('Go !'),
        ),
        canContact
            ? ElevatedButton(
                onPressed: contactButton,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22)),
                  backgroundColor: Color.fromRGBO(28, 20, 71, 1),
                ),
                child: Text('Contact'),
              )
            : SizedBox(),
      ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
    );
  }
}

class DoneAlertDialog extends StatelessWidget {
  final String title;
  final bool done;

  const DoneAlertDialog({super.key, required this.title, required this.done});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(20)),
      title: Column(
        children: [
          Icon(
              done
                  ? Icons.check_circle_rounded
                  : Icons.add_photo_alternate_outlined,
              color: kBlue,
              size: 30),
          Center(
              child: Text(
            done ? 'Thank you !' : 'Ooops !',
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(fontSize: 15.sp),
          )),
        ],
      ),
      content: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Color(0xFF1c1447),
            fontSize: 20,
            fontWeight: FontWeight.w500),
      ),
      actions: [
        Center(
          child: DefultBorderButton(
            title: 'Ok',
            onPressed: () => Navigator.pop(context),
            size: 40.w,
            isOutline: false,
          ),
        )
      ],
    );
  }
}
