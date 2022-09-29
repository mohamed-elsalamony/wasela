// ignore_for_file: prefer_const_constructors

/// external packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// core packages
import 'package:flutter/material.dart';

/// app files
import 'package:team_projects/core/style/themes.dart';
import 'package:team_projects/core/widgets/snackpar.dart';
import 'package:team_projects/data/my_location.dart';
import 'package:team_projects/logic/bloc_observer.dart';
import 'package:team_projects/logic/reservation/reservation_cubit.dart';
import 'package:team_projects/ui/shared/add_your_car.dart';
import 'package:team_projects/ui/shared/on_boarding.dart';
import 'package:team_projects/ui/shared/welcome_screen.dart';
import 'logic/bottom_navigation/bottom_navigation_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  MyLocation.initLocationService();
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
          title: 'Wasela',
          debugShowCheckedModeBanner: false,
          theme: Apptheme.lightTheme,
          themeMode: ThemeMode.light,
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
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
