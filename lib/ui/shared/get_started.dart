import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:team_projects/core/resources/navigators.dart';
import 'package:team_projects/ui/shared/auth/login_screen.dart';
import 'package:team_projects/ui/shared/auth/sign_up.dart';
import 'package:team_projects/ui/user/main_pages/bottom_navigation_page.dart';
import 'package:team_projects/ui/worker/main_pages/navigation_bar.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: const Color(0xFF1c1447),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Let\'s Get Started',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 35),
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 150,
                          height: 48,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xFF1c1447)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: Colors.white,
                                            width: 1,
                                            style: BorderStyle.solid),
                                        borderRadius:
                                            BorderRadius.circular(50)))),
                            onPressed: () {
                              Navigators.naviagteReplacementTo(
                                  context, LogIn(isWorker: false,));
                            },
                            child: const Text(
                              'car owner',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        Text('service recipient',
                            style: TextStyle(color: Colors.white))
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(children: [
                      SizedBox(
                        width: 150,
                        height: 48,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xFF1c1447)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: Colors.white,
                                          width: 1,
                                          style: BorderStyle.solid),
                                      borderRadius:
                                          BorderRadius.circular(50)))),
                          onPressed: () {
                            // BottomNavigationPageWorker();
                            Navigators.naviagteReplacementTo(
                                context, LogIn(isWorker: true,));
                          },
                          child: const Text(
                            'worker',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      const Text(
                        'service provider',
                        style: TextStyle(color: Colors.white),
                      )
                    ]),
                  ],
                )
              ],
            )));
  }
}
