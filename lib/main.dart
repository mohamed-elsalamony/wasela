// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sizer/sizer.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team_projects/core/pages/chat_screen.dart';
import 'package:team_projects/core/style/themes.dart';
import 'package:team_projects/core/widgets/snackpar.dart';
import 'package:team_projects/logic/bloc_observer.dart';
import 'package:team_projects/logic/chat/cubit.dart';
import 'package:team_projects/logic/reservation/reservation_cubit.dart';

import 'package:team_projects/user/ui/main_pages/bottom_navigation_page.dart';
import 'package:team_projects/user/ui/subpages/home_pages/problems_service_page.dart';
import 'package:team_projects/user/ui/scrains/AddYourCar.dart';

import 'package:team_projects/user/ui/scrains/sign_up.dart';
import 'package:team_projects/user/ui/scrains/suitable-way.dart';
import 'package:team_projects/user/ui/scrains/welcome_screen.dart';
import 'package:team_projects/worker/ui/main_pages/navigation_bar.dart';

import 'logic/bottom_navigation/bottom_navigation_cubit.dart';



Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();

  /// Use blocs...
  BottomNavigationCubit();
  ReservationCubit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: ((BuildContext context, Orientation orientation,
        DeviceType deviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<BottomNavigationCubit>(
            create: (BuildContext context) => BottomNavigationCubit(),
          ),
          BlocProvider<ReservationCubit>(
            create: (BuildContext context) => ReservationCubit(),
          ),

        
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: Apptheme.lightTheme,
          themeMode: ThemeMode.light,
          home:   
             StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
          } else if (snapshot.hasError) {
            return showSnackBar(context, "Something went wrong");
          } else if (snapshot.hasData) {
            return AddYourCar();
          } else {
            return WelcomeScreen();
          }
        },
      ),
        ),
      );
    }));





    
  }
}
