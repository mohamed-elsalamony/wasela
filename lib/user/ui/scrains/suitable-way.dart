import 'package:flutter/material.dart';

class SuitAble extends StatefulWidget {
  @override
  State<SuitAble> createState() => _SuitAbleState();
}

class _SuitAbleState extends State<SuitAble> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.keyboard_arrow_left,
              color: Color(0xFF1c1447),
              size: 40,
            )),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsetsDirectional.only(end: 16, start: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                    onTap: () {},
                    child: const SizedBox(
                        height: 30,
                        width: 30,
                        child: Image(
                          image: AssetImage('assets/images/squere.png'),
                        ))),
              ],
            ),
            Row(
              children: const [ 
                 Text(
                  'pay the suitable way to you ',
                  style: TextStyle(
                      color: Color(0xFF1c1447),
                      fontWeight: FontWeight.bold,
                      fontSize: 26),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              'Shipping value',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(17)),
              height: 45,
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(17))),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Choose your payment method',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(2, 4),
                          )
                        ]),
                    height: 100,
                    width: 90,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Image(image: AssetImage('images/apple.png')),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Pay',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      // shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(2, 4),
                          )
                        ]),
                    height: 100,
                    width: 90,
                    child: ElevatedButton(
                      onPressed: () {},
                      // shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(15)),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                              height: 30,
                              width: 30,
                              child: Image(
                                  image: AssetImage('images/vodafone.png'))),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Vodafone cash',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(2, 4),
                          )
                        ]),
                    height: 100,
                    width: 90,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                              height: 30,
                              width: 30,
                              child:
                                  Image(image: AssetImage('assets/images/visa.png'))),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'visa',
                            style: TextStyle(
                                color: Colors.blue[900],
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 200,
            ),
            Center(
              child: SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  // color: Color(0xFF1c1447),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color(0xFF1c1447)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Colors.white,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(17)))),
                  onPressed: () {
                    openDialog();
                  },
                  child: const Text(
                    'Pay',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void backSpace() {
    Navigator.of(context).pop();
  }

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          titlePadding: EdgeInsets.all(5),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(20)),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    backSpace();
                  },
                  icon: const Icon(Icons.backspace)),
              const Center(
                  child: Icon(Icons.check_circle_rounded,
                      color: Color(0xFF1c1447), size: 30)),
            ],
          ),
          content: const Text(
            'Your reservation has been successfully confirmed',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xFF1c1447),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          actions: [
            Center(
              child: SizedBox(
                width: 180,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary:  const Color(0xFF1c1447),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(30))),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
}
