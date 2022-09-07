import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:project/models/provinsi.dart';
import 'package:project/models/provinsilengkap.dart';
import 'package:project/service/provinsiservice.dart';
import 'package:project/ui/detail.dart';
import 'package:project/ui/indonesia.dart';
import 'package:project/ui/saran.dart';
import 'package:project/ui/provinsi.dart';

import 'package:project/view/search.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.green,
      // ),
      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       Container(
      //         height: 100,
      //         color: Colors.green,
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Text(
      //               "Sistem Informasi",
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 30,
      //               ),
      //             ),
      //             Text(
      //               "Covid19",
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 36,
      //                 letterSpacing: 4,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       InkWell(
      //         child: ListTile(
      //           leading: Icon(Icons.home),
      //           title: Text("Home"),
      //         ),
      //         onTap: () {},
      //       ),
      //       InkWell(
      //         child: ListTile(
      //           leading: Icon(Icons.location_on),
      //           title: Text("Detail Corona Di Indonesia"),
      //         ),
      //         onTap: () {
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (context) => Homeindo(),
      //               ));
      //         },
      //       ),
      //       InkWell(
      //         child: ListTile(
      //           leading: Icon(Icons.location_city),
      //           title: Text("Penyebaran Corona Di Provinsi Indonesia"),
      //         ),
      //         onTap: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => homewidget()));
      //         },
      //       ),
      //       // InkWell(
      //       //   child: ListTile(
      //       //     leading: Icon(Icons.local_hospital),
      //       //     title: Text("Peduli Lindungi"),
      //       //   ),
      //       //   onTap: () {
      //       //     Navigator.push(
      //       //         context,
      //       //         MaterialPageRoute(
      //       //           builder: (context) => WebViewTest(),
      //       //         ));
      //       //   },
      //       // ),
      //       // InkWell(
      //       //   child: ListTile(
      //       //     leading: Icon(Icons.message_sharp),
      //       //     title: Text("Saran"),
      //       //   ),
      //       //   onTap: () {
      //       //     Navigator.push(
      //       //         context,
      //       //         MaterialPageRoute(
      //       //           builder: (context) => saran(),
      //       //         ));
      //       //   },
      //       // ),
      //     ],
      //   ),
      // ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  width: double.infinity,
                  height: 240,
                  color: Colors.green,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 80),
                            child: Icon(
                              Icons.wb_sunny_rounded,
                              color: Colors.yellow,
                              size: 34,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Lawan",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                              letterSpacing: 4,
                            ),
                          ),
                          Text(
                            "Covid",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 36,
                                letterSpacing: 4),
                          ),
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(140, 60, 0, 0),
                          child: Image.asset("assets/images/banner1.png")),
                    ],
                  )),
              Container(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
                  margin: EdgeInsets.only(top: 210),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Color(0xffFFFFFF),
                        Color(0xffFFFFFF),
                      ],
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Apa itu Covid19?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          "Corona Virus Disease 2019 atau yang biasa disingkat COVID-19 adalah penyakit menular yang disebabkan oleh SARS-CoV-2, salah satu jenis koronavirus. Penderita COVID-19 dapat mengalami demam, batuk kering, dan kesulitan bernafas.",
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 30),
                        Text(
                          "Bagaimana Gejala COVID-19",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          "Orang yang terinfeksi memiliki gejala ringan seperti demam, batuk, dan kesulitan bernafas. Gejala dapat berkembang menjadi pneumonia berat.",
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 30),
                        Text(
                          "Bagaimana Cara Mencegah COVID-19?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          "Tindakan pencegahan untuk mengurangi kemungkinan infeksi antara lain tetap berada di rumah, menghindari bepergian dan beraktivitas di tempat umum, sering mencuci tangan dengan sabun dan air, tidak menyentuh mata, hidung, atau mulut dengan tangan yang tidak dicuci. Segera hubungi Hotline jika Anda mengalami gejala atau memiliki riwayat perjalanan/berpergian dari Negara yang terjangkit.",
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
