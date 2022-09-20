import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:team_projects/core/resources/navigators.dart';
import 'package:team_projects/core/style/colors.dart';
import 'package:team_projects/worker/ui/subpages/profile_pages/choose_language_page.dart';
import 'package:team_projects/worker/ui/subpages/profile_pages/service_provision_page.dart';
import 'package:team_projects/worker/ui/subpages/profile_pages/worker_informations.dart';

// import 'package:signin_screen/login_screen/signin_screen.dart';
// import 'package:signin_screen/worker_screen/service_provision.dart';
// import 'package:signin_screen/worker_screen/worker_informations.dart';
// import 'package:signin_screen/worker_screen/worker_page.dart';

class WorkerProfilePage extends StatelessWidget {
  WorkerProfilePage({Key? key}) : super(key: key);
  String imageUrl =
      "https://media.istockphoto.com/photos/service-drivethru-picture-id180709551?k=20&m=180709551&s=612x612&w=0&h=MmLyCgyc2K0QXlwVX83IlzdKdK4rADVg7PZU5rBPi0A=";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 80.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Service Drive-Thru",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(height: 3.h),
                  ],
                ),
                const Divider(),
                SizedBox(
                  height: 3.h,
                ),
                _ProfileListTile(
                  icon: Icons.info,
                  title: "Information",
                  onTap: () {
                    Navigators.naviagteTo(context, WorkerInformations());
                  },
                ),
                _ProfileListTile(
                  icon: Icons.place_sharp,
                  title: "Service Provision",
                  onTap: () {
                    Navigators.naviagteTo(
                      context,
                      ServiceProvisionPage(),
                    );
                  },
                ),
                _ProfileListTile(
                  icon: Icons.g_translate_outlined,
                  title: "Langauge",
                  onTap: () {
                    Navigators.naviagteTo(context, ChangeLanguagePage());
                  },
                ),
                _ProfileListTile(
                  icon: Icons.logout,
                  title: "Logout",
                  onTap: () {
                    // TODO: firebase
                    /// logout
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function() onTap;

  const _ProfileListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: AppColors.kBlue,
      ),
      title: Text(title),
    );
  }
}


/// Draft 
  
  // listtile of home
  // ListTile(
  //   onTap: () {
  //     // Navigator.push(
  //     //     context,
  //     //     MaterialPageRoute(
  //     //       builder: (context) => WorkerPage(),
  //     //     ));
  //   },
  //   leading: const Icon(
  //     Icons.home_filled,
  //   ),
  //   title: const Text("Home"),
  // ),
