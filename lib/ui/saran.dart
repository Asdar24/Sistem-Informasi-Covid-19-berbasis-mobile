// import 'package:flutter/material.dart';
// import 'package:project/models/entroform.dart';
// import 'package:project/service/dbHelper.dart';
// import 'package:project/ui/home.dart';

// import 'package:sqflite/sqlite_api.dart';
// import 'dart:async';

// import '../models/contact.dart';

// class saran extends StatefulWidget {
//   const saran({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return HomeState();
//   }
// }

// class HomeState extends State<saran> {
//   DbHelper dbHelper = DbHelper();
//   int count = 0;
//   late List<Contact> contactList = [];
//   List items = <Contact>[];
//   TextEditingController seacrh = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     dbHelper = DbHelper();
//     dbHelper.getContactList().then((data) {
//       setState(() {
//         contactList = data;
//         items = contactList;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (contactList == null) {
//       contactList = <Contact>[];
//     }
//     // TODO: implement build
//     return Scaffold(
//       body: ListView(
//         children: [
//           Stack(
//             children: [
//               Container(
//                   padding: EdgeInsets.only(left: 20, top: 10),
//                   width: double.infinity,
//                   height: 240,
//                   color: Colors.green,
//                   child: Stack(
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(left: 80),
//                             child: Icon(
//                               Icons.wb_sunny_rounded,
//                               color: Colors.yellow,
//                               size: 34,
//                             ),
//                           ),
//                           SizedBox(height: 15),
//                           Text(
//                             "Masukkan",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 36,
//                               letterSpacing: 4,
//                             ),
//                           ),
//                           Text(
//                             "Saran",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 36,
//                                 letterSpacing: 4),
//                           ),
//                         ],
//                       ),
//                       Container(
//                           margin: EdgeInsets.fromLTRB(190, 30, 0, 0),
//                           child: Image.asset("assets/images/indonesia.png")),
//                     ],
//                   )),
//               Container(
//                 padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
//                 margin: EdgeInsets.only(top: 210),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: <Color>[
//                       Color(0xffFFFFFF),
//                       Color.fromARGB(255, 199, 210, 250),
//                     ],
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Text(
//                       "Saran",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     SizedBox(
//                       height: 500,
//                       child: createListView(),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 30),
//             child: FloatingActionButton(
//               child: Icon(Icons.arrow_back),
//               backgroundColor: Colors.green,
//               tooltip: 'Keluar',
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ),
//           FloatingActionButton(
//             child: Icon(Icons.add),
//             backgroundColor: Colors.green,
//             tooltip: 'Masukkan saran',
//             onPressed: () async {
//               var contact = await navigateToEntryForm(context, null);
//               if (contact != null) addContact(contact);
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Future<Contact> navigateToEntryForm(
//       BuildContext context, Contact? contact) async {
//     var result = await Navigator.push(context, MaterialPageRoute(
//       builder: (context) {
//         return EntryForm(contact);
//       },
//     ));
//     return result;
//   }

//   ListView createListView() {
//     return ListView.builder(
//       itemCount: count,
//       itemBuilder: (BuildContext context, int index) {
//         return Card(
//           color: Colors.white,
//           elevation: 2.0,
//           child: ListTile(
//             leading: CircleAvatar(
//               backgroundColor: Color.fromARGB(255, 210, 210, 210),
//               child: Icon(
//                 Icons.message_sharp,
//                 color: Colors.black,
//               ),
//             ),
//             title: Text(
//               contactList[index].name,
//             ),
//             subtitle: Text(contactList[index].phone),
//             trailing: GestureDetector(
//               child: Icon(Icons.delete),
//               onTap: () {
//                 deleteContact(contactList[index]);
//               },
//             ),
//             onTap: () async {
//               var contact =
//                   await navigateToEntryForm(context, contactList[index]);
//               if (contact != null) editContact(contact);
//             },
//           ),
//         );
//       },
//     );
//   }

//   void addContact(Contact object) async {
//     int result = await dbHelper.insert(object);
//     if (result > 0) {
//       updateListView();
//     }
//   }

//   void editContact(Contact object) async {
//     int result = await dbHelper.update(object);
//     if (result > 0) {
//       updateListView();
//     }
//   }

//   void deleteContact(Contact object) async {
//     int result = await dbHelper.delete(object);
//     if (result > 0) {
//       updateListView();
//     }
//   }

//   void updateListView() {
//     final Future<Database> dbFuture = dbHelper.dbHelper.initDb();
//     dbFuture.then((database) {
//       Future<List<Contact>> contactListFuture = dbHelper.getContactList();
//       contactListFuture.then((contactList) {
//         setState(() {
//           this.contactList = contactList;
//           count = contactList.length;
//         });
//       });
//     });
//   }
// }
