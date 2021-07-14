import 'package:app/Booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'Info.dart';

class Hotel extends StatelessWidget {
  Info info;
  Hotel({Key key, @required this.info}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Your hotel")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(image: AssetImage("assets/1.jpg"))),
              ),
              Row(children: [
                Padding(padding: EdgeInsets.fromLTRB(30, 30, 0, 0)),
                Text(
                  info.name,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ]),
              Row(children: [
                Padding(padding: EdgeInsets.fromLTRB(25, 0, 0, 0)),
                Icon(Icons.location_on),
                Text(
                  info.location,
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ]),
              Row(children: [
                Padding(padding: EdgeInsets.fromLTRB(30, 40, 0, 0)),
                Text(
                  "Details",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ]),
              Container(
                padding: EdgeInsets.only(left: 30, right: 10),
                child: Text(info.description),
              ),
              Container(
                height: 12,
              ),
              Divider(color: Colors.grey),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Text("From Rs." + info.price.toString() + "/night"),
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                              side: BorderSide(color: Colors.blue)))),
                  child: Text('Book Now'),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Booking()));
                  },
                ),
              ])
            ],
          ),
        ));
  }
}
