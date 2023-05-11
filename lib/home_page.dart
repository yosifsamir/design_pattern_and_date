import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var firstColor = Color.fromARGB(255, 0, 255, 0);
  var secondColor = Color.fromARGB(255, 245, 67, 78);
  var thirdColor = Color.fromARGB(255, 43, 54, 56);

  var temp = 0;

  @override
  Widget build(BuildContext context) {
    var height = (MediaQuery.of(context).size.height / 700);
    var width = (MediaQuery.of(context).size.width / 300);

    return Scaffold(
      appBar: AppBar(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            child: Container(
          width: double.infinity,
          child: Column(
            children: [
              MaterialButton(
                onPressed: () {
                  startAnimationFirstColor();
                  // startIncrementTemp("First");
                  startIncrementLongOP();
                },
                color: Colors.red,
                child: const Text("Start background randomization in first Box",
                    style: TextStyle(color: Colors.white)),
              ),
              MaterialButton(
                onPressed: () {
                  // startIncrementTemp("Second");
                  startIncrementLongOP();
                },
                color: Colors.blue,
                child: const Text(
                    "Start background randomization in second Box",
                    style: TextStyle(color: Colors.white)),
              ),MaterialButton(
                color: Colors.lime,
                onPressed: () {
                  startAnimationSecondColor();
                },
                child: const Text(
                    "Start background randomization in third Box",
                    style: TextStyle(color: Colors.white)
                ),
              ),
              MaterialButton(
                  onPressed: () {
                    print("Temp ==> ${temp}");
                  },
                  shape: const CircleBorder(),
                  minWidth: width * 100,
                  height: width * 100,
                  color: Colors.teal,
                  child: LayoutBuilder(
                    builder: (context, size) {
                      return Text("Show Data",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: (width * 100) / 6));
                    },
                  )),

              // LayoutBuilder(
              //   builder: (context, size) {
              //     return Text("Show Data",
              //         style: TextStyle(decoration: TextDecoration.underline,
              //             fontSize: size.maxWidth *.4));
              //   },
              // )),
            ],
          ),
        )),
        Expanded(
          child: SizedBox(
            // color: Colors.black,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      color: firstColor,
                    ),
                    // const Spacer(),
                    Container(
                      width: 100,
                      height: 100,
                      color: secondColor,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.black,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }

  Future<void> startAnimationFirstColor() async {
    while (true) {
      setState(() {
        firstColor = Color.fromARGB(255, Random().nextInt(255),
            Random().nextInt(255), Random().nextInt(255));
      });
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  Future<void> startAnimationSecondColor() async {
    while (true) {
      setState(() {
        secondColor = Color.fromARGB(255, Random().nextInt(255),
            Random().nextInt(255), Random().nextInt(255));
      });
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  Future<void> startAnimation2(Color color) async {
    while (true) {
      setState(() {
        firstColor = Color.fromARGB(255, Random().nextInt(255),
            Random().nextInt(255), Random().nextInt(255));
      });
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  startIncrementTemp(String name) {

    Future.delayed(const Duration(seconds: 2)).whenComplete(
      () {
        print("It work");
        Future.microtask(() async {
          for (int i = 0; i < 1000; i++) {
            await Future.delayed(const Duration(milliseconds: 20));
            print("Temp = ${temp}");
            print("Name = ${name}");
            setState(() {
              temp++;
            });
          }
        });
      },
    );

  }

  startIncrementLongOP() {
    Future.microtask(() async  {
      for (int i = 0; i < 1000000; i++) {
        await Future.delayed(const Duration(milliseconds: 20));
        print("Temp = ${temp}");
        setState(() {
          temp++;
        });
      }
    });
  }

}
