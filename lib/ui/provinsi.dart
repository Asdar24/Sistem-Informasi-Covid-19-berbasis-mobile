import 'package:flutter/material.dart';
import 'package:project/models/provinsi.dart';
import 'package:project/models/provinsilengkap.dart';
import 'package:project/service/provinsiservice.dart';
import 'package:project/ui/detail.dart';
import 'package:project/view/search.dart';

class homewidget extends StatefulWidget {
  const homewidget({Key? key}) : super(key: key);

  @override
  State<homewidget> createState() => _homewidgetState();
}

class _homewidgetState extends State<homewidget> {
  late Future data;
  List<Provlengkap> dataprov1 = [];
  TextEditingController searchcontroller = TextEditingController();
  bool issearching = false;

  @override
  void initState() {
    data = ProvinsiUpdateService().getProvinsiUpdate();
    data.then((value) {
      setState(() {
        dataprov1 = value;
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
                            "Provinsi",
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
                          child: Image.asset("assets/images/prov.png")),
                    ],
                  )),
              Container(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
                  margin: EdgeInsets.only(top: 210),
                  width: MediaQuery.of(context).size.width,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          !issearching
                              ? Text(
                                  "Daftar Kota",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                )
                              : Container(
                                  height: 60,
                                  width: 270,
                                  child: TextField(
                                    controller: searchcontroller,
                                    decoration: InputDecoration(
                                        hintText: "Cari Lokasi",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50))),
                                    onSubmitted: (value) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => search(
                                                  keyword:
                                                      searchcontroller.text)));
                                    },
                                  ),
                                ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  this.issearching = !this.issearching;
                                });
                              },
                              icon: !issearching
                                  ? Icon(Icons.search)
                                  : Icon(Icons.cancel))
                        ],
                      ),
                      SizedBox(
                        height: 450,
                        child: //dataprov.length == 0
                            dataprov1.length == 0
                                ? Center(
                                    child: CircularProgressIndicator(
                                        color: Colors.black),
                                  )
                                : ListView.builder(
                                    itemCount: dataprov1.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Detail(
                                                  lastDate:
                                                      dataprov1[index].lastDate,
                                                  provinsi:
                                                      dataprov1[index].provinsi,
                                                  dirawat:
                                                      dataprov1[index].dirawat,
                                                  kasus: dataprov1[index].kasus,
                                                  sembuh:
                                                      dataprov1[index].sembuh,
                                                  meninggal: dataprov1[index]
                                                      .meninggal,
                                                  jeniskelaminl:
                                                      dataprov1[index]
                                                          .jenisKelamin
                                                          .lakiLaki,
                                                  jeniskelaminp:
                                                      dataprov1[index]
                                                          .jenisKelamin
                                                          .perempuan,
                                                  penambahanpositif:
                                                      dataprov1[index]
                                                          .penambahan
                                                          .positif,
                                                  penambahansembuh:
                                                      dataprov1[index]
                                                          .penambahan
                                                          .sembuh,
                                                  penambahanmeninggal:
                                                      dataprov1[index]
                                                          .penambahan
                                                          .meninggal,
                                                ),
                                              ));
                                        },
                                        child: Card(
                                          color: Colors.white,
                                          elevation: 2.0,
                                          child: ListTile(
                                            leading: Icon(Icons.location_on),
                                            title:
                                                Text(dataprov1[index].provinsi),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
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
