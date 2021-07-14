import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Store.dart';
import 'DBHelper.dart';

class Reservation extends StatefulWidget {
  @override
  ReservationState createState() => ReservationState();
}

class ReservationState extends State<Reservation> {
  String payment = "Jazzcash";
  String status = "Processed";
  String btntext = "Pay";
  static List<Map<String, dynamic>> rows = null;
  SharedPreferences _preferences;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: FutureBuilder(
                future: DBHelper.instance.queryAll(),
                builder: (context, snapshot) {
                  print("snapshot .hasData " + (snapshot.hasData).toString());
                  print("snapshot .hasError " +
                      (snapshot.data).length.toString());

                  if ((snapshot.data).length == 0) {
                    return Center(
                        child: Text(
                            "You have no booking,please reserve the hotel first"));
                  } else if ((snapshot.data).length > 0 &&
                      snapshot.hasData &&
                      snapshot.data != null) {
                    rows = snapshot.data;
                    print("row is" + rows.toString());
                    return Stack(children: [
                      Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width - 50,
                                child: Column(
                                  children: [
                                    DropdownButton<String>(
                                      isExpanded: true,
                                      hint: Row(children: [
                                        Icon(Icons.payment),
                                        Text(payment)
                                      ]),
                                      items: <String>[
                                        'Jazzcash',
                                        'Bank ',
                                        'Payoneer',
                                        'Paypal'
                                      ].map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: new Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String value) {
                                        setState(() {
                                          payment = value;
                                        });
                                      },
                                    ),
                                    Padding(padding: EdgeInsets.only(top: 30)),
                                    Row(
                                      children: [
                                        Icon(Icons.date_range, size: 20.0),
                                        Text(
                                          "Date: ",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                            "\t\t\t\t\t\t\t\t" +
                                                rows[0]['initalDate']
                                                    .toString() +
                                                "................",
                                            style: TextStyle(fontSize: 15)),
                                        Text(rows[0]['finalDate'].toString(),
                                            style: TextStyle(fontSize: 15)),
                                      ],
                                    ),
                                    Padding(padding: EdgeInsets.only(top: 10)),
                                    Row(
                                      children: [
                                        Icon(Icons.hotel_rounded, size: 20.0),
                                        Text(
                                          "Rooms:",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                            "\t\t\t\t\t" +
                                                rows[0]['rooms'].toString(),
                                            style: TextStyle(fontSize: 15)),
                                      ],
                                    ),
                                    Padding(padding: EdgeInsets.only(top: 10)),
                                    Row(
                                      children: [
                                        ImageIcon(
                                          AssetImage("assets/child.png"),
                                          size: 20,
                                        ),
                                        Text(
                                          "Children:",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                            "\t\t\t\t" +
                                                rows[0]['childern'].toString(),
                                            style: TextStyle(fontSize: 15)),
                                      ],
                                    ),
                                    Padding(padding: EdgeInsets.only(top: 10)),
                                    Row(
                                      children: [
                                        Icon(Icons.person, size: 20.0),
                                        Text(
                                          "Adults:",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                            "\t\t\t\t\t\t\t\t" +
                                                rows[0]['adults'].toString(),
                                            style: TextStyle(fontSize: 15)),
                                      ],
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(top: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Booking Status",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Location",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Payment",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              status,
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              "Karachi",
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              payment,
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        )),
                                    Padding(padding: EdgeInsets.only(top: 30)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Order Total:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          (int.parse(rows[0]['difference']) *
                                                  4000)
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Padding(padding: EdgeInsets.only(top: 20)),
                                    Align(
                                      child: Text(
                                          " You agree to terms and conditions"),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  btntext,
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                ImageIcon(
                                                  AssetImage("assets/pay.png"),
                                                  size: 20,
                                                ),
                                              ]),
                                          onPressed: () {},
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0),
                                                      side: BorderSide(
                                                          color:
                                                              Colors.grey))))),
                                    )
                                  ],
                                ),
                              )))
                    ]);
                  } else {
                    return CircularProgressIndicator();
                  }
                })));
  }
}
