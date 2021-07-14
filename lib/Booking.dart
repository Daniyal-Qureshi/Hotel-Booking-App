import 'package:app/DBHelper.dart';
import 'package:app/Reservation.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import "package:shared_preferences/shared_preferences.dart";
import 'tabbed.dart';

import 'Store.dart';

class Booking extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BookingState();
}

class BookingState extends State<Booking> {
  SharedPreferences _preferences;

  DateTime from, to;
  String initialDate = "Select Date";
  String FinalDate = "Select Date";
  String adultsTitle = "1";
  String childrentTitle = "0";
  String roomtitle = "Single";
  final List<String> imageList = [
    "assets/1.jpg",
    "assets/2.jpg",
    "assets/3.jpg",
    "assets/4.jpg",
    "assets/5.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(int.parse("0xff${"add8e6"}")),
        appBar: AppBar(title: Text("Hotel Book")),
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      autoPlay: true,
                    ),
                    items: imageList
                        .map((e) => ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.asset(e,
                                      width: 100,
                                      height: 200,
                                      fit: BoxFit.cover)
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30, top: 30),
                    child: Text(
                      "Date",
                      style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                    ),
                  ),
                ),
                // The containers in the backgroun
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 130,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                    side: BorderSide(color: Colors.grey)))),
                        child: Text(
                          initialDate,
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                        onPressed: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now()
                                      .subtract(Duration(days: 0)),
                                  lastDate: DateTime.now()
                                      .subtract(Duration(days: 0)))
                              .then((value) {
                            if (value != null)
                              setState(() {
                                this.from = value;
                                initialDate =
                                    '${value.day}/${value.month}/${value.year}';
                              });
                          });
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 50,
                      padding: EdgeInsets.all(10),
                      child: Text("to"),
                      color: Colors.grey,
                    ),
                    Container(
                      width: 130,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                    side: BorderSide(color: Colors.grey)))),
                        child: Text(
                          FinalDate,
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                        onPressed: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now()
                                      .subtract(Duration(days: 0)),
                                  lastDate:
                                      DateTime.now().add(Duration(days: 30)))
                              .then((value) {
                            if (value != null)
                              setState(() {
                                this.to = value;
                                FinalDate =
                                    '${value.day}/${value.month}/${value.year}';
                              });
                          });
                        },
                      ),
                    ),
                  ],
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30, top: 20),
                    child: Text(
                      "Guests",
                      style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Row(children: [
                    Text(
                      "Adults",
                      style: TextStyle(fontSize: 15),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blueGrey,
                          ),
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(5),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: Text(adultsTitle),
                              items: <String>['1', '2', '3', '4', '5', '6']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (String value) {
                                setState(() {
                                  adultsTitle = value;
                                });
                              },
                            ))),
                    Padding(padding: EdgeInsets.only(left: 50)),
                    Text(
                      "Children",
                      style: TextStyle(fontSize: 15),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Container(
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blueGrey,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(5),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            dropdownColor: Colors.lightBlue,
                            hint: Text(childrentTitle),
                            items: <String>['0', '1', '2', '3', '4', '5', '6']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                            onChanged: (String value) {
                              setState(() {
                                childrentTitle = value;
                              });
                            },
                          )),
                    )
                  ]),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30, top: 20),
                    child: Text(
                      "Rooms",
                      style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30, top: 6),
                    child: Container(
                      height: 30,
                      width: 300,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blueGrey,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          hint: Text(roomtitle),
                          items: <String>[
                            'Single',
                            'Double ',
                            'Triple',
                            'Quad',
                            'Queen',
                            'King'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          onChanged: (String value) {
                            setState(() {
                              roomtitle = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 50)),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    width: 250,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      side: BorderSide(color: Colors.grey)))),
                      child: Text("Submit"),
                      onPressed: () async {
                        String difference = (DateTime(to.year, to.month, to.day)
                                    .difference(DateTime(
                                        from.year, from.month, from.day))
                                    .inHours /
                                24)
                            .round()
                            .toString();

                        DBHelper.instance.queryAll().then((value) async {
                          print("value is " + value.length.toString());
                          if (value.length > 0) {
                            print("value is " + value.length.toString());
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.SCALE,
                              dialogType: DialogType.ERROR,
                              body: Center(
                                child: Text(
                                  'Sorry ,you already have one booking',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              btnOkOnPress: () {
                                Navigator.pop(context);
                              },
                            )..show();
                          } else {
                            _preferences =
                                await SharedPreferences.getInstance();
                            print("email is " +
                                _preferences.getString("current"));

                            await DBHelper.instance.insert({
                              DBHelper.email: _preferences.getString("current"),
                              DBHelper.initalDate: initialDate,
                              DBHelper.finalDate: FinalDate,
                              DBHelper.rooms: roomtitle,
                              DBHelper.adults: adultsTitle,
                              DBHelper.childern: childrentTitle,
                              DBHelper.difference: difference
                            });

                            AwesomeDialog(
                              context: context,
                              animType: AnimType.SCALE,
                              dialogType: DialogType.SUCCES,
                              body: Center(
                                child: Text(
                                  'You have successfully applied for booking,enter bank details in Booking section',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              btnOkOnPress: () {
                                Navigator.pop(context);
                              },
                            )..show();
                          }
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
