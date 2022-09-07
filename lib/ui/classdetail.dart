import 'package:flutter/material.dart';

//detail jenis kelamain
class jeniskelamin extends StatelessWidget {
  jeniskelamin({
    Key? key,
    this.angkal,
    this.titlel,
    this.angkap,
    this.titlep,
    this.color,
  }) : super(key: key);

  var angkal;
  var titlel;
  var angkap;
  var titlep;
  var color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              angkal,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                  letterSpacing: 4),
            ),
            Text(
              titlel,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffA5A3A3),
                  letterSpacing: 2),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              angkap,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                  letterSpacing: 4),
            ),
            Text(
              titlep,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffA5A3A3),
                  letterSpacing: 2),
            ),
          ],
        ),
      ],
    );
  }
}

//detail
class detail extends StatelessWidget {
  detail({
    Key? key,
    this.angka,
    this.title,
    this.color,
  }) : super(key: key);

  var title;
  var angka;
  var color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      height: 110,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                angka,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: color,
                    letterSpacing: 4),
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffA5A3A3),
                    letterSpacing: 2),
              )
            ],
          ),
        ],
      ),
    );
  }
}

//detail penambahan
class detailpenambahan extends StatelessWidget {
  detailpenambahan({
    Key? key,
    this.angka,
    this.title,
    this.angka1,
    this.title1,
    this.angka2,
    this.title2,
    this.color,
    this.color1,
    this.color2,
  }) : super(key: key);

  var title;
  var angka;
  var title1;
  var angka1;
  var title2;
  var angka2;
  var color;
  var color1;
  var color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      height: 110,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                angka,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: color,
                    letterSpacing: 4),
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffA5A3A3),
                    letterSpacing: 2),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                angka1,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: color1,
                    letterSpacing: 4),
              ),
              Text(
                title1,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffA5A3A3),
                    letterSpacing: 2),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                angka2,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: color2,
                    letterSpacing: 4),
              ),
              Text(
                title2,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffA5A3A3),
                    letterSpacing: 2),
              )
            ],
          ),
        ],
      ),
    );
  }
}
