import 'package:flutter/material.dart';

import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:project/ui/home.dart';

import 'package:project/ui/navbar.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff6BCB77),
        body: Padding(
          padding: const EdgeInsets.only(top: 130),
          child: IntroductionScreen(
            globalBackgroundColor: Color(0xff6BCB77),
            pages: [
              PageViewModel(
                titleWidget: Column(
                  children: [
                    Text(
                      "Selamat Datang di",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                    Text("Sistem Informasi Covid Di Indonesia",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white)),
                  ],
                ),
                bodyWidget: Column(),
                image: Center(child: Lottie.asset("assets/lotties/awal.json")),
              ),
              PageViewModel(
                titleWidget: Column(
                  children: [
                    Text(
                      "Jangan Lupa cuci tangan",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                    Text("untuk mencegah penularan virus corona",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white)),
                  ],
                ),
                bodyWidget: Column(),
                image: Center(
                    child: Lottie.asset("assets/lotties/cucitangan.json")),
              ),
              PageViewModel(
                titleWidget: Column(
                  children: [
                    Text(
                      "Jangan Lupa Pakai Masker ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                    Text("untuk mencegah penularan virus corona",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white)),
                  ],
                ),
                bodyWidget: Column(),
                image:
                    Center(child: Lottie.asset("assets/lotties/masker.json")),
              ),
              PageViewModel(
                titleWidget: Column(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 100, vertical: 10)),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => bar(),
                              ));
                        },
                        child: Text(
                          "Mulai",
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                ),
                bodyWidget: Column(),
                image: Center(child: Lottie.asset("assets/lotties/start.json")),
              ),
            ],
            onDone: () {},
            showDoneButton: false,
            showBackButton: true,
            showNextButton: true,
            next: Icon(Icons.arrow_forward, color: Colors.white),
            back: Icon(Icons.arrow_back, color: Colors.white),
            done: const Text("Login",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.white)),
            dotsDecorator: DotsDecorator(
                size: const Size.square(10.0),
                activeSize: const Size(30.0, 10.0),
                activeColor: Colors.white,
                color: Colors.black26,
                spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0))),
          ),
        ));
  }
}
