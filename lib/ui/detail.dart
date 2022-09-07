import 'package:flutter/material.dart';
import 'package:project/models/indonesia.dart';
import 'package:project/models/provinsi.dart';
import 'package:project/service/provinsiservice.dart';
import 'package:project/ui/classdetail.dart';

class Detail extends StatefulWidget {
  final provinsi;
  final kasus;
  final dirawat;
  final sembuh;
  final meninggal;
  final lastDate;
  final jeniskelaminl;
  final jeniskelaminp;
  final penambahanpositif;
  final penambahansembuh;
  final penambahanmeninggal;

  Detail({
    Key? key,
    this.provinsi,
    this.kasus,
    this.dirawat,
    this.sembuh,
    this.meninggal,
    this.lastDate,
    this.jeniskelaminl,
    this.jeniskelaminp,
    this.penambahanpositif,
    this.penambahansembuh,
    this.penambahanmeninggal,
  }) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
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
                            "Detail",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                              letterSpacing: 4,
                            ),
                          ),
                          Text(
                            "Covid19",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 36,
                                letterSpacing: 4),
                          ),
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(190, 60, 0, 0),
                          child: Image.asset("assets/images/bannerdetail.png")),
                    ],
                  )),
              Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Detail ${widget.provinsi}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Text("Update Terakhir ${widget.lastDate}",
                          style: TextStyle(
                            color: Color.fromARGB(255, 168, 168, 168),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          )),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 6,
                                  offset: Offset(1, 1))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.kasus.toString(),
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  letterSpacing: 4),
                            ),
                            Text(
                              "Kasus",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffA5A3A3),
                                  letterSpacing: 2),
                            ),
                            SizedBox(height: 10),
                            jeniskelamin(
                              angkal: widget.jeniskelaminl.toString(),
                              titlel: "Laki-Laki",
                              angkap: widget.jeniskelaminp.toString(),
                              titlep: "Perempuan",
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                      detail(
                        angka: widget.dirawat.toString(),
                        title: "Dirawat",
                        color: Color.fromARGB(255, 113, 191, 255),
                      ),
                      detail(
                        angka: widget.sembuh.toString(),
                        title: "Sembuh",
                        color: Color.fromARGB(255, 41, 220, 47),
                      ),
                      detail(
                        angka: widget.meninggal.toString(),
                        title: "Meninggal",
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Penambahan ${widget.provinsi}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      detailpenambahan(
                        angka: widget.penambahanpositif.toString(),
                        title: "Positif",
                        color: Colors.red,
                        angka1: widget.penambahansembuh.toString(),
                        title1: "Sembuh",
                        color1: Color.fromARGB(255, 41, 220, 47),
                        angka2: widget.penambahanmeninggal.toString(),
                        title2: "Meninggal",
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back)),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
