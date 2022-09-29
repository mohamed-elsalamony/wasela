import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:team_projects/core/widgets/snackpar.dart';
import 'package:team_projects/ui/shared/add_your_car.dart';
import 'package:team_projects/ui/shared/auth/sign_up.dart';

// import 'package:wasela/presentation/login_screen/sign_up.dart';

class LogIn extends StatefulWidget {
  final bool isWorker;
  const LogIn({super.key, required this.isWorker});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool isobscureTextVisability = false;
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  registerToSignIn() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (!mounted) return;
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AddYourCar(),
          ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(context, "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, "Wrong password provided for that user.");
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF1c1447),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: Color(0xff1c1447),
                  // ignore: prefer_const_constructors
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.only(top: 150, start: 20),
                    child: const Text("Welcome to Wasela !",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 35,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    child: Column(children: [
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        height: 45,
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            suffix: Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Email",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 45,
                        child: TextFormField(
                          obscureText: isobscureTextVisability ? true : false,
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isobscureTextVisability =
                                      !isobscureTextVisability;
                                });
                              },
                              icon: isobscureTextVisability
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Password",
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 160,
                                height: 55,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    registerToSignIn();
                                    // await loginToSCSignIn();
                                    if (!mounted) return;
                                    // showSnackBar(context, "DONE");
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromRGBO(28, 20, 71, 1),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                        20,
                                      )) // Background color
                                      ),
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 16.0),
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 160,
                                height: 55,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                 SignUp(isWorker: widget.isWorker,)));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: const Color.fromRGBO(
                                          242, 242, 242, 1),
                                      side: BorderSide(
                                          color: Color(0xff1c1447), width: 2),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                        20,
                                      ))),
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 16.0),
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        color: Color(0xff1c1447),
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ]),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
