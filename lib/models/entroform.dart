import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/contact.dart';

class EntryForm extends StatefulWidget {
  final Contact? contact;
  EntryForm(this.contact);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EntryFormState(this.contact);
  }
}

class EntryFormState extends State<EntryForm> {
  Contact? contact;
  EntryFormState(this.contact);

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (contact != null) {
      nameController.text = contact!.name;
      phoneController.text = contact!.phone;
    }

    return Scaffold(
      appBar: AppBar(
        title: contact == null ? Text('Masukkan Saran') : Text('Ubah'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_arrow_left),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15, left: 10, right: 10),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 20),
              child: TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    labelText: 'Saran',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
                onChanged: (value) {},
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        color: Colors.green,
                        textColor: Colors.white,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          if (contact == null) {
                            contact = Contact(
                                nameController.text, phoneController.text);
                          } else {
                            contact!.name = nameController.text;
                            contact!.phone = phoneController.text;
                          }
                          Navigator.pop(context, contact);
                        },
                      ),
                    ),
                    Container(
                      width: 5,
                    ),
                    Expanded(
                      child: RaisedButton(
                        color: Colors.green,
                        textColor: Colors.white,
                        child: Text(
                          'Cancel',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
