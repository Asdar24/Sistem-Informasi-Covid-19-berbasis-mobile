import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:project/models/indonesia.dart';
import 'package:project/models/provinsi.dart';
import 'package:project/models/provinsilengkap.dart';
import 'package:project/service/provinsiservice.dart';
import 'package:project/ui/classdetail.dart';
import 'package:project/ui/detail.dart';
import 'package:project/view/search.dart';

class Homeindo extends StatefulWidget {
  const Homeindo({Key? key}) : super(key: key);

  @override
  State<Homeindo> createState() => _HomeindoState();
}

class _HomeindoState extends State<Homeindo> {
  late Future data;
  Indonesia? datapindo;
  TextEditingController searchcontroller = TextEditingController();
  bool issearching = false;

  // List<Provinsi> dataprov = [];

  // @override
  // void initState() {
  //   data = ProvinsiService().getProvinsi();
  //   data.then((value) {
  //     setState(() {
  //       dataprov = value;
  //     });
  //   });
  //   super.initState();
  // }

  @override
  void initState() {
    data = IndonesiaService().getIndonesiaService();
    data.then((value) {
      setState(() {
        datapindo = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            "Covid19",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                              letterSpacing: 4,
                            ),
                          ),
                          Text(
                            "Indonesia",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 36,
                                letterSpacing: 4),
                          ),
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(190, 30, 0, 0),
                          child: Image.asset("assets/images/indonesia.png")),
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
                        Color.fromARGB(255, 199, 210, 250),
                      ],
                    ),
                  ),
                  child: datapindo == null
                      ? Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height - 210,
                            child: Center(
                                child: CircularProgressIndicator(
                                    color: Colors.black)),
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Data Covid Di indonesia",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                                "Update Terakhir ${datapindo?.total.lastUpdate} ",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 168, 168, 168),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                )),
                            detail(
                              angka: datapindo?.total.positif.toString(),
                              title: "Positif",
                              color: Colors.orange,
                            ),
                            detail(
                              angka: datapindo?.total.sembuh.toString(),
                              title: "Sembuh",
                              color: Colors.green,
                            ),
                            detail(
                              angka: datapindo?.total.dirawat.toString(),
                              title: "Dirawat",
                              color: Color.fromARGB(255, 113, 191, 255),
                            ),
                            detail(
                              angka: datapindo?.total.meninggal.toString(),
                              title: "Meninggal",
                              color: Colors.red,
                            ),
                            SizedBox(height: 30),
                            Text(
                              "Penambahan Covid Di indonesia",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            Text("Tanggal ${datapindo?.penambahan.created}",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 168, 168, 168),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                )),
                            detail(
                              angka: datapindo?.penambahan.positif.toString(),
                              title: "Positif",
                              color: Colors.orange,
                            ),
                            detail(
                              angka: datapindo?.penambahan.sembuh.toString(),
                              title: "Sembuh",
                              color: Colors.green,
                            ),
                            detail(
                              angka: datapindo?.penambahan.dirawat.toString(),
                              title: "Dirawat",
                              color: Color.fromARGB(255, 113, 191, 255),
                            ),
                            detail(
                              angka: datapindo?.penambahan.meninggal.toString(),
                              title: "Meninggal",
                              color: Colors.red,
                            ),
                          ],
                        )),
            ],
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //     backgroundColor: Colors.green,
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     child: Icon(Icons.arrow_back)),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
