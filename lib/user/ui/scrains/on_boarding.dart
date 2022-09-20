import 'package:flutter/material.dart';

import 'contents_boarding.dart';



class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  var color = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        onPageChanged: (int index) {
          setState(() {
            color = index;
          });
        },
        itemCount: contents.length,
        itemBuilder: (_, i) {
          return Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Image(image: AssetImage(contents[i].image)),
            ),
            const SizedBox(
              height: 45,
            ),
            Text(
              contents[i].title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              contents[i].description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(
              height: 90,
            ),
            Container(
                width: 200,
                height: 42,
                decoration: BoxDecoration(
                  color: Color(0xFF1c1447),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ElevatedButton(
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(50)),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)))),
                    onPressed: () {
                      if (color == contents.length) {}
                      _controller?.nextPage(
                          duration: const Duration(milliseconds: 150),
                          curve: Curves.bounceIn);
                    },
                    child: Text(
                      color == contents.length - 1 ? 'Sign In' : 'Continue',
                      style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ))),
            const SizedBox(
              height: 30,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                    contents.length, (index) => buildDot(index, context))),
          ]);
        },
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: color == index ? const Color(0xFF1c1447) : Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
